import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:usado/views/auth/reset_password.dart';

import '../../app_router/router.dart';

class ResetCodeScreen extends StatefulWidget {
  const ResetCodeScreen({Key? key}) : super(key: key);

  @override
  State<ResetCodeScreen> createState() => _ResetCodeScreenState();
}

class _ResetCodeScreenState extends State<ResetCodeScreen> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: false,
        body: Padding(
          padding: EdgeInsets.only(top: 140.h, right: 25.w, left: 25.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: SvgPicture.asset(
                    'assets/images/reset_code.svg',
                    height: 170.h,
                    width: 230.w,
                  ),
                ),
                SizedBox(
                  height: 45.h,
                ),
                Text(
                  '.يُرجى تفقد البريد الإلكتروني الخاص بك، للعثور على الرسالة التي تحتوي على الرمز المكون من 6 أرقام',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(
                  height: 24.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      height: 48.h,
                      width: 48.w,
                      child: TextFormField(
                        decoration: InputDecoration(
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
                      height: 48.h,
                      width: 48.w,
                      child: TextFormField(
                        decoration: InputDecoration(
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
                      height: 48.h,
                      width: 48.w,
                      child: TextFormField(
                        decoration: InputDecoration(
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
                      height: 48.h,
                      width: 48.w,
                      child: TextFormField(
                        decoration: InputDecoration(
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
                      height: 48.h,
                      width: 48.w,
                      child: TextFormField(
                        decoration: InputDecoration(
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
                      height: 48.h,
                      width: 48.w,
                      child: TextFormField(

                        decoration: InputDecoration(
                          focusColor: const Color.fromRGBO(124, 144, 112, 1),
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
                  ],
                ),
                SizedBox(
                  height: 5.h,
                ),
                Text(
                  'ألم تتلقَ رمزًا؟',
                  style: TextStyle(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w400,
                    color: Colors.black.withOpacity(0.5),
                  ),
                ),
                SizedBox(height: 10.h,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      width: 98.w,
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.r),
                        border: Border.all(color: Color.fromRGBO(124, 144, 112, 1),width: 0.8.w)
                      ),
                      child: ElevatedButton(
                        onPressed: () {
                          AppRouter.popRouter();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          side: const BorderSide(
                            color:  Color.fromRGBO(124, 144, 112, 1),
                          ),
                          fixedSize: Size(98.w, 56.h),
                        ),
                        child: Text(
                          'إلغاء',
                          style: TextStyle(
                            color:  const Color.fromRGBO(124, 144, 112, 1),
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 10.w,),
                    Container(
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: ElevatedButton(
                        onPressed: () {
                          AppRouter.NavigateToWidget(ResetPassword());
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                          const Color.fromRGBO(124, 144, 112, 1),
                          fixedSize: Size(98.w, 56.h),
                        ),
                        child: Text(
                          'متابعة',
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
              ],
            ),

        ),
      ),
    );
  }
}
