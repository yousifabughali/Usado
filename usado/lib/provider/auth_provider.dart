import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:string_validator/string_validator.dart';
import 'package:usado/app_router/router.dart';
import 'package:usado/helpers/auth_helper.dart';
import 'package:usado/helpers/firestore_helper.dart';
import 'package:usado/helpers/storage_helper.dart';
import 'package:usado/model/user.dart';
import 'package:usado/views/drawer_screens/categories_screen.dart';
import 'package:usado/views/home_screens/home_screen.dart';

class AuthProvider extends ChangeNotifier {
  GlobalKey<FormState> signUpKey = GlobalKey();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  GlobalKey<FormState> signInKey = GlobalKey();
  File? selectedImage;
  String? userImage;

  String? nullValidation(String? value) {
    if (value == null || value.isEmpty) {
      return 'هذا الحقل مطلوب';
    }
  }

  String? emailValidation(String? value) {
    if (!isEmail(value!)) {
      return 'صيغة البريد الالكتروني خاطئة';
    }
  }

  String? signUpPasswordValidation(String? value) {
    if (passwordController.text != confirmPasswordController.text) {
      return 'كلمتا المرور غير متطابقتان';
    }
    if (value!.length < 6) {
      return 'كلمة المرور يجب ان تكون 6 رموز فأكثر';
    }
  }

  String? signInPasswordValidation(String? value) {
    if (passwordController.text == null) {
      return 'هذا الحقل مطلوب';
    }
    if (value!.length < 6) {
      return 'كلمة المرور يجب ان تكون 6 رموز فأكثر';
    }
  }

  signUp() async {
    if (signUpKey.currentState!.validate()) {
      UserCredential? credential = await AuthHelper.authHelper
          .signUp(emailController.text, passwordController.text);

      AppUser appUser = AppUser(
        id: credential?.user!.uid,
        name: nameController.text,
        email: emailController.text,
        phone: num.parse(phoneController.text),
      );
      FireStoreHelper.fireStoreHelper.addUsersToFireStore(appUser);

      if (credential != null) {
        AppRouter.NavigateWithReplacemtnToWidget(HomeScreen());
      }
    }
  }

  updateUser() async {
    String? imageUrl;
    if (selectedImage != null) {
      imageUrl = await StorageHelper.storageHelper.uploadImage(selectedImage!);
    }
    AppUser newUser = AppUser(
      name: nameController.text,
      image: imageUrl ?? '',
      email: emailController.text,
      phone: num.parse(phoneController.text),
    );
    userImage = newUser.image;
    await FireStoreHelper.fireStoreHelper.updateUser(newUser);
    notifyListeners();
  }

  selectImage() async {
    XFile? file = await ImagePicker().pickImage(source: ImageSource.gallery);
    selectedImage = File(file!.path);
    notifyListeners();
  }

  signIn() async {
    if (signInKey.currentState!.validate()) {
      UserCredential? credential = await AuthHelper.authHelper
          .signIn(emailController.text, passwordController.text);
      if (credential != null) {
        AppUser appUser = await FireStoreHelper.fireStoreHelper
            .getUserFromFireStore(credential.user!.uid);
        emailController.text = appUser.email;
        nameController.text = appUser.name;
        phoneController.text = appUser.phone.toString();
        await AppRouter.NavigateWithReplacemtnToWidget(HomeScreen());
      }
    }
  }

  checkUser() async {
    AppUser? appUser = await AuthHelper.authHelper.checkUser();
    if (appUser != null) {
      userImage = appUser.image;
      emailController.text = appUser.email;
      nameController.text = appUser.name;
      phoneController.text=appUser.phone.toString();
      await AppRouter.NavigateWithReplacemtnToWidget(HomeScreen());
    }
  }

  signOut() {
    emailController.text = '';
    passwordController.text = '';
    confirmPasswordController.text = '';
    nameController.text = '';
    phoneController.text = '';
    userImage = null;
    AuthHelper.authHelper.signOut();
  }
}
