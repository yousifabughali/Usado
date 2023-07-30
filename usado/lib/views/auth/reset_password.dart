import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:usado/app_router/router.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  bool password1 = true;
  bool password2 = true;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          automaticallyImplyLeading: true,
          iconTheme: IconThemeData(color: Colors.black),
          title: Text(
            'إعادة تعيين كلمة المرور',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w600,
              fontSize: 24.sp,
            ),
          ),
        ),
        body: Form(
          child: Padding(
            padding:  EdgeInsets.symmetric(vertical: 16.h,horizontal: 20.w),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'يجب أن تكون كلمة المرور الجديدة تختلف عن القديمة.',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(
                    width: 396.w,
                    child: TextFormField(
                      keyboardType: TextInputType.emailAddress,
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
                    height: 16.h,
                  ),
                  SizedBox(
                    width: 396.w,
                    child: TextFormField(
                      keyboardType: TextInputType.emailAddress,
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
                  Text(
                    'يجب أن تكون كلتا كلمتا المرور متطابقتان',
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      color: Colors.black.withOpacity(0.8),
                    ),
                  ),
                  SizedBox(height: 40.h,),
                  Container(
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                        const Color.fromRGBO(124, 144, 112, 1),
                        fixedSize: Size(396.w, 69.h),
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
  }
}
