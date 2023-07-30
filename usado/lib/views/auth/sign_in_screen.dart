import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:usado/app_router/router.dart';
import 'package:usado/provider/auth_provider.dart';
import 'package:usado/views/auth/request_reset_screen.dart';
import 'package:usado/views/auth/sign_up_screen.dart';
import 'package:usado/views/home_screens/home_screen.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  bool password = true;

  @override
  Widget build(BuildContext context) {
    final provider = context.read<AuthProvider>();

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: Padding(
          padding: EdgeInsets.only(top: 47.h, right: 18.w, left: 18.w),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Column(
                  children: [
                    Row(
                      children: [
                       
                        Text(
                          'تسجيل الدخول',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: 24.sp,
                          ),
                        ),
                        Spacer(),

                        IconButton(onPressed: (){
                          AppRouter.NavigateWithReplacemtnToWidget(SignUpScreen());
                        },icon: Icon(Icons.close)),
                      ],
                    ),
                    SizedBox(
                      height: 24.h,
                    ),
                    Form(
                      key: provider.signInKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
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
                              controller: provider.passwordController,
                              validator: provider.signInPasswordValidation,
                              obscureText: password,
                              decoration: InputDecoration(
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      password = !password;
                                    });
                                  },
                                  icon: password
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
                            height: 5.h,
                          ),
                          TextButton(
                            onPressed: () {
                              AppRouter.NavigateToWidget(RequestReset());
                            },
                            child: Text(
                              'هل نسيت كلمة المرور؟',
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 20.sp,
                                  color: Color.fromRGBO(124, 144, 112, 1)),
                            ),
                          ),
                          SizedBox(
                            height: 40.h,
                          ),
                          Container(
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                            child: ElevatedButton(
                              onPressed: () async {
                                await provider.signIn();
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    const Color.fromRGBO(124, 144, 112, 1),
                                fixedSize: Size(396.w, 69.h),
                              ),
                              child: Text(
                                'تسجيل الدخول',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 50.h,
                          ),
                          SizedBox(
                            width: 396.w,
                            child: Row(
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
                                  SizedBox(width: 15.w,),
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
                                  SvgPicture.asset('assets/icons/google.svg',color: Colors.white,),
                                  SizedBox(width: 20.w,),
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
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
