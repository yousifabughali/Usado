import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:usado/app_router/router.dart';
import 'package:usado/views/auth/reset_code_screen.dart';

class RequestReset extends StatefulWidget {
  const RequestReset({Key? key}) : super(key: key);

  @override
  State<RequestReset> createState() => _RequestResetState();
}

class _RequestResetState extends State<RequestReset> {
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
        body: Padding(
          padding:  EdgeInsets.symmetric(vertical: 16.h,horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Text(
                'الرجاء كتابة البريد الإلكتروني الخاص بك، لإرسال رمز التأكيد',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 18.sp,
                  color: Colors.black,
                ),
              ),
              SizedBox(
                height: 24.h,
              ),
              SizedBox(
                width: 396.w,
                child: TextFormField(
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
                height: 32.h,
              ),
              Container(
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: ElevatedButton(
                  onPressed: () {
                    AppRouter.NavigateToWidget(ResetCodeScreen());
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromRGBO(124, 144, 112, 1),
                    fixedSize: Size(396.w, 69.h),
                  ),
                  child: Text(
                    'إرسال رمز التأكيد',
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
    );
  }
}
