import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:usado_admin/app_router/router.dart';
import 'package:usado_admin/model/product.dart';

class ConfirmSelling extends StatefulWidget {
  Product product;
  ConfirmSelling({required this.product,Key? key}) : super(key: key);

  @override
  State<ConfirmSelling> createState() => _ConfirmSellingState();
}

class _ConfirmSellingState extends State<ConfirmSelling> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          automaticallyImplyLeading: true,
          backgroundColor: Color.fromRGBO(124, 144, 112, 1),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.favorite_border),
            ),
            SizedBox(
              width: 10.w,
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.ios_share),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                height: 341.h,
                child: Image.network(widget.product.image, fit: BoxFit.cover),
              ),
              SizedBox(
                height: 10.h,
              ),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 20.w,vertical: 5.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'يرجى تعبئة معلومات لاستلام المنتج:',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                          fontSize: 22.sp),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                    SizedBox(
                      height: 20.h,
                    ),
                    SizedBox(
                      width: 389.w,
                      child: TextFormField(
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(
                            Icons.phone_enabled,
                            color: Colors.black,
                          ),
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
                    SizedBox(
                      height: 20.h,
                    ),
                    SizedBox(
                      width: 389.w,
                      child: TextFormField(
                        decoration: InputDecoration(
                          prefixIcon: const Icon(
                            Icons.location_on_outlined,
                            color: Colors.black,
                          ),
                          focusColor: const Color.fromRGBO(124, 144, 112, 1),
                          label: Text(
                            'العنوان',
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              side: const BorderSide(
                                color:  Color.fromRGBO(124, 144, 112, 1),
                              ),
                              fixedSize: Size(150.w, 56.h),
                            ),
                            child: Text(
                              'إرسال',
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
                              AppRouter.popRouter();
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                              const Color.fromRGBO(124, 144, 112, 1),
                              fixedSize: Size(98.w, 56.h),
                            ),
                            child: Text(
                              'إلغاء',
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

            ],
          ),
        ),
      ),
    );
  }
}
