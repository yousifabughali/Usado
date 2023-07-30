import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:usado/app_router/router.dart';
import 'package:usado/provider/auth_provider.dart';
import 'package:usado/widgets/custom_widget_dialoge.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({Key? key}) : super(key: key);

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  GlobalKey<FormState> updatePassword = GlobalKey<FormState>();

  TextEditingController oldPassword = TextEditingController();
  TextEditingController newPassword = TextEditingController();
  TextEditingController confirmNewPassword = TextEditingController();

  User? user = FirebaseAuth.instance.currentUser;

   checkOldPassword() async {
    final credential = EmailAuthProvider.credential(
        email: user!.email!, password: oldPassword.text);
    try {
      await user?.reauthenticateWithCredential(credential);
      await changePassword();
    } on FirebaseAuthException catch (e) {
      CustomDialog.showDialogFunction(e.toString(), null);
      log(e.toString());

    }
  }
  changePassword () async {
     await user!.updatePassword(newPassword.text);
     log('changed Succesfully');
     context.read<AuthProvider>().signOut();

  }
   String? passwordValidator(String? value) {
    if(value == null || value.isEmpty){
      return 'هذا الحقل مطلوب';
    }else {
      if(newPassword.text!=confirmNewPassword.text) {
        return 'كلمتا المرور غير متطابقتان';
      }
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    oldPassword.dispose();
    newPassword.dispose();
    confirmNewPassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(builder: (context, provider, child) {
      return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Color.fromRGBO(124, 144, 112, 1),
            centerTitle: true,
            automaticallyImplyLeading: true,
            title: Text(
              'تغيير كلمة المرور',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18.sp,
              ),
            ),
          ),
          body: Form(
            key: updatePassword,
            child: Padding(
              padding:  EdgeInsets.symmetric(horizontal: 20.w,vertical: 20.h),
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'أدخل كلمة المرور الحالية ',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                          fontSize: 18.sp),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Container(
                      width: 335.w,
                      height: 80.h,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(15.r),
                      ),
                      child: TextFormField(
                        obscureText: true,
                        controller: oldPassword,
                        validator: provider.nullValidation,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.r),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Text(
                      'أدخل كلمة المرور الجديدة ',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                          fontSize: 18.sp),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Container(
                      width: 335.w,
                      height: 80.h,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(15.r),
                      ),
                      child: TextFormField(
                        obscureText: true,
                        controller: newPassword,
                        validator: passwordValidator,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.r),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Text(
                      'تأكيد كلمة المرور الجديدة ',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                          fontSize: 18.sp),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Container(
                      width: 335.w,
                      height: 80.h,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(15.r),
                      ),
                      child: TextFormField(
                        obscureText: true,
                        controller: confirmNewPassword,
                        validator: passwordValidator,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.r),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20.h,),
                    Container(
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: ElevatedButton(
                        onPressed: () async {
                          if(updatePassword.currentState!.validate()){
                            await checkOldPassword();
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                          const Color.fromRGBO(124, 144, 112, 1),
                          fixedSize: Size(220.w, 56.h),
                        ),
                        child: Text(
                          'إعادة تعيين كلمة المرور',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}
