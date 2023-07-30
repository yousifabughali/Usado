import 'package:firebase_auth/firebase_auth.dart';
import 'package:usado/app_router/router.dart';
import 'package:usado/helpers/firestore_helper.dart';
import 'package:usado/model/user.dart';
import 'package:usado/views/auth/sign_in_screen.dart';
import 'package:usado/views/on_boarding/on_boarding_pages.dart';
import 'package:usado/widgets/custom_widget_dialoge.dart';


class AuthHelper{
  AuthHelper._();
  static AuthHelper authHelper=AuthHelper._();
  FirebaseAuth firebaseAuth=FirebaseAuth.instance;

  Future<UserCredential?> signUp(String emailAddress,String password) async {
    try {
      final credential = await firebaseAuth.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
      return credential;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        CustomDialog.showDialogFunction('The password provided is too weak.',null);
      } else if (e.code == 'email-already-in-use') {
        CustomDialog.showDialogFunction('The account already exists for that email.',null);
      }
    } catch (e) {
      print(e);
    }

  }
  Future<UserCredential?> signIn(String emailAddress,String password) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailAddress,
          password: password
      );
      return credential;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        CustomDialog.showDialogFunction('No user found for that email.',null);
      } else if (e.code == 'wrong-password') {
        CustomDialog.showDialogFunction('Wrong password provided for that user.',null);
      }
    }

  }

  Future<AppUser?> checkUser() async {
    User? user = await FirebaseAuth.instance.currentUser;
    if (user == null) {
       AppRouter.NavigateWithReplacemtnToWidget(OnboardingScreen());
       return null;
    } else {
      AppUser appUser= await FireStoreHelper.fireStoreHelper.getUserFromFireStore(user.uid);
      return appUser;

    }
  }

  signOut() async{
    await firebaseAuth.signOut();
    AppRouter.NavigateWithReplacemtnToWidget(SignInScreen());

  }
}