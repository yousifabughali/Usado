import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:usado/app_router/router.dart';
import 'package:usado/provider/auth_provider.dart';
import 'package:usado/views/auth/sign_in_screen.dart';
import 'package:usado/views/home_screens/home_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool password1 = true;
  bool password2 = true;

  @override
  Widget build(BuildContext context) {
    final provider = context.read<AuthProvider>();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.only(top: 47.h, right: 18.w, left: 18.w),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  Icon(Icons.close),
                  Spacer(),
                  Text(
                    'تسجيل',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 24.sp,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 24.h,
              ),
              Form(
                key: provider.signUpKey,
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 396.w,
                        child: TextFormField(
                          controller: provider.nameController,
                          validator: provider.nullValidation,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            prefixIcon: const Icon(
                              Icons.person,
                              color: const Color.fromRGBO(124, 144, 112, 1),
                            ),
                            focusColor: const Color.fromRGBO(124, 144, 112, 1),
                            label: Text(
                              'اسم المستخدم',
                              style: TextStyle(
                                color: const Color.fromRGBO(124, 144, 112, 1),
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.r),
                              borderSide: const BorderSide(
                                color: Color.fromRGBO(124, 144, 112, 1),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 38.h,
                      ),
                      SizedBox(
                        width: 396.w,
                        child: TextFormField(
                          controller: provider.emailController,
                          validator: provider.emailValidation,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            prefixIcon: const Icon(
                              Icons.email,
                              color: const Color.fromRGBO(124, 144, 112, 1),
                            ),
                            focusColor: const Color.fromRGBO(124, 144, 112, 1),
                            label: Text(
                              'البريد الإلكتروني',
                              style: TextStyle(
                                color: const Color.fromRGBO(124, 144, 112, 1),
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.r),
                              borderSide: const BorderSide(
                                color: Color.fromRGBO(124, 144, 112, 1),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 38.h,
                      ),
                      SizedBox(
                        width: 396.w,
                        child: TextFormField(
                          controller: provider.phoneController,
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                            prefixIcon: const Icon(
                              Icons.phone_enabled,
                              color: const Color.fromRGBO(124, 144, 112, 1),
                            ),
                            focusColor: const Color.fromRGBO(124, 144, 112, 1),
                            label: Text(
                              'رقم الهاتف',
                              style: TextStyle(
                                color: const Color.fromRGBO(124, 144, 112, 1),
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.r),
                              borderSide: const BorderSide(
                                color: Color.fromRGBO(124, 144, 112, 1),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 38.h,
                      ),
                      SizedBox(
                        width: 396.w,
                        child: TextFormField(
                          controller: provider.passwordController,
                          validator: provider.signUpPasswordValidation,
                          obscureText: password1,
                          decoration: InputDecoration(
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  password1 = !password1;
                                });
                              },
                              icon: password1
                                  ? SvgPicture.asset(
                                      'assets/icons/password_hide.svg',
                                      height: 20.h,
                                      width: 20.w,
                                    )
                                  : Icon(
                                      Icons.remove_red_eye_outlined,
                                      size: 20.r,
                                      color: Colors.black,
                                    ),
                            ),
                            prefixIcon: const Icon(
                              Icons.lock,
                              color: const Color.fromRGBO(124, 144, 112, 1),
                            ),
                            focusColor: const Color.fromRGBO(124, 144, 112, 1),
                            hintText: 'على الأقل 6 رموز',
                            label: Text(
                              'كلمة المرور',
                              style: TextStyle(
                                color: const Color.fromRGBO(124, 144, 112, 1),
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.r),
                              borderSide: const BorderSide(
                                color: Color.fromRGBO(124, 144, 112, 1),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 38.h,
                      ),
                      SizedBox(
                        width: 396.w,
                        child: TextFormField(
                          controller: provider.confirmPasswordController,
                          validator: provider.signUpPasswordValidation,
                          obscureText: password2,
                          decoration: InputDecoration(
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  password2 = !password2;
                                });
                              },
                              icon: password2
                                  ? SvgPicture.asset(
                                      'assets/icons/password_hide.svg',
                                      height: 20.h,
                                      width: 20.w,
                                    )
                                  : Icon(
                                      Icons.remove_red_eye_outlined,
                                      size: 20.r,
                                      color: Colors.black,
                                    ),
                            ),
                            prefixIcon: const Icon(
                              Icons.lock,
                              color: const Color.fromRGBO(124, 144, 112, 1),
                            ),
                            focusColor: const Color.fromRGBO(124, 144, 112, 1),
                            hintText: 'على الأقل 6 رموز',
                            label: Text(
                              'تأكيد كلمة المرور ',
                              style: TextStyle(
                                color: const Color.fromRGBO(124, 144, 112, 1),
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.r),
                              borderSide: const BorderSide(
                                color: Color.fromRGBO(124, 144, 112, 1),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Row(
                        children: [
                          Checkbox(
                            value: true,
                            onChanged: (v) {},
                            shape: CircleBorder(),
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          Text(
                            'لقد قرأت ووافقت على ',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w600),
                          ),
                          Text(
                            'الشروط والأحكام',
                            style: TextStyle(
                                color: Colors.blueGrey,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Container(
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        child: ElevatedButton(
                          onPressed: () async {
                            await provider.signUp();
                            // AppRouter.NavigateWithReplacemtnToWidget(HomeScreen());
                            //TODO: sign up process
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromRGBO(124, 144, 112, 1),
                            fixedSize: Size(396.w, 69.h),
                          ),
                          child: Text(
                            'إنشاء حساب',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 22.sp,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Row(
                        children: [
                          const Text('يوجد لديك حساب بالفعل؟'),
                          TextButton(
                            onPressed: () {
                              AppRouter.NavigateToWidget(SignInScreen());
                            },
                            child: Text(
                              'تسجيل الدخول',
                              style: TextStyle(
                                  color: Color.fromRGBO(124, 144, 112, 1),
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 24.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Flexible(
                            child: Divider(
                              thickness: 1.h,
                              endIndent: 10.w,
                            ),
                          ),
                          Text('أو'),
                          Flexible(
                            child: Divider(
                              thickness: 1,
                              indent: 10.w,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Container(
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                            fixedSize: Size(396.w, 69.h),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset('assets/icons/facebook.svg'),
                              SizedBox(
                                width: 15.w,
                              ),
                              Text(
                                'الدخول بواسطة فيسبوك',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                      Container(
                        width: 390.w,
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                            fixedSize: Size(390.w, 69.h),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                'assets/icons/google.svg',
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: 20.w,
                              ),
                              Text(
                                'الدخول بواسطة جوجل',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
