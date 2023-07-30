import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:usado/app_router/router.dart';

class ContactWithUs extends StatefulWidget {
  const ContactWithUs({Key? key}) : super(key: key);

  @override
  State<ContactWithUs> createState() => _ContactWithUsState();
}

class _ContactWithUsState extends State<ContactWithUs> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        appBar: AppBar(
          automaticallyImplyLeading: true,
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.black),
          elevation: 0,
          title: Text(
            'تواصل معنا',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w600,
              fontSize: 24.sp,
            ),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.only(top: 16.h, left: 20.w, right: 20.w),
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'سيتم الرد على أسئلتك 24/7',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 20.h,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      width: 188.w,
                      child: TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          focusColor: const Color.fromRGBO(124, 144, 112, 1),
                          label: Text(
                            'الإسم الأول',
                            style: TextStyle(
                              color: const Color.fromRGBO(124, 144, 112, 1),
                              fontSize: 16.sp,
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
                      width: 188.w,
                      child: TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          focusColor: const Color.fromRGBO(124, 144, 112, 1),
                          label: Text(
                            'الإسم الأخير',
                            style: TextStyle(
                              color: const Color.fromRGBO(124, 144, 112, 1),
                              fontSize: 16.sp,
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
                  ],
                ),
                SizedBox(height: 20.h,),
                SizedBox(
                  width: 389.w,
                  child: TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.phone_enabled,color: Colors.black,),
                      focusColor: const Color.fromRGBO(124, 144, 112, 1),
                      label: Text(
                        'رقم الهاتف',
                        style: TextStyle(
                          color: const Color.fromRGBO(124, 144, 112, 1),
                          fontSize: 16.sp,
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
                SizedBox(height: 20.h,),
                SizedBox(
                  width: 389.w,
                  child: TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.email,color: Colors.black,),
                      focusColor: const Color.fromRGBO(124, 144, 112, 1),
                      label: Text(
                        'البريد الإلكتروني',
                        style: TextStyle(
                          color: const Color.fromRGBO(124, 144, 112, 1),
                          fontSize: 16.sp,
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
                SizedBox(height: 20.h,),
                Expanded(
                  child: SizedBox(
                    width: 389.w,
                    child: TextFormField(
                      maxLines: MediaQuery.of(context).size.height> 1000.h? 6: null,
                      keyboardType: TextInputType.multiline,
                      expands: MediaQuery.of(context).size.height>1000.h?false:true,
                      decoration: InputDecoration(
                        focusColor: const Color.fromRGBO(124, 144, 112, 1),
                        label: Text(
                          'وصف المشكلة',
                          style: TextStyle(
                            color: const Color.fromRGBO(124, 144, 112, 1),
                            fontSize: 16.sp,
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
                ),
                SizedBox(height: 20.h,),
                Center(
                  child: Container(
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                        const Color.fromRGBO(124, 144, 112, 1),
                        fixedSize: Size(144.w, 56.h),
                      ),
                      child: Text(
                        'إرسال',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 40.h,),





              ],
            ),
          ),
        ),
      ),
    );
  }
}
