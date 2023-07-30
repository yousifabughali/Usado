
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:usado_admin/app_router/router.dart';
import 'package:usado_admin/home/product_request_screen.dart';
import 'package:usado_admin/model/product.dart';
import 'package:usado_admin/provider/firestore_provider.dart';

class OrderWidget extends StatefulWidget {
  Product product;
   OrderWidget({required this.product,Key? key}) : super(key: key);

  @override
  State<OrderWidget> createState() => _OrderWidgetState();
}

class _OrderWidgetState extends State<OrderWidget> {
  @override
  Widget build(BuildContext context) {
    return Consumer<FireStoreProvider>(
      builder: (context,provider,child) {
        return InkWell(
          onTap: (){
            AppRouter.NavigateToWidget(ProductRequestScreen(product: widget.product,));
          },
          child: Container(
            width: 396.w,
            margin: EdgeInsets.symmetric(vertical: 10.h,horizontal: 20.w),
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(25.r),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 50.r,
                        backgroundColor: Colors.grey,
                        backgroundImage: NetworkImage(widget.product.productHolderImage!),
                      ),
                      SizedBox(
                        width: 15.w,
                      ),
                      Text(
                        widget.product.productHolder,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 22.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              SvgPicture.asset('assets/icons/category.svg'),
                              SizedBox(
                                width: 20.w,
                              ),
                              Text(
                                widget.product.categoryName,
                                style: TextStyle(
                                  color: Colors.black54,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 18.sp,
                                ),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              SvgPicture.asset('assets/icons/location.svg'),
                              SizedBox(
                                width: 20.w,
                              ),
                              Text(
                                'غزة',
                                style: TextStyle(
                                  color: Colors.black54,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 18.sp,
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              SvgPicture.asset('assets/icons/ad.svg'),
                              SizedBox(
                                width: 20.w,
                              ),
                              Text(
                                widget.product.operation=='TypeOfProcess.sell'?'بيع':'مزاد',
                                style: TextStyle(
                                  color: Colors.black54,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 18.sp,
                                ),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              SvgPicture.asset('assets/icons/time.svg'),
                              SizedBox(
                                width: 20.w,
                              ),
                              Text(
                                widget.product.publishDate,
                                style: TextStyle(
                                  color: Colors.black54,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 18.sp,
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 20.h,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        child: ElevatedButton(
                          onPressed: () async {
                            await provider.deleteRequestedProduct(widget.product);

                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                            fixedSize: Size(98.w, 56.h),
                          ),
                          child: Text(
                            'رفض',
                            style: TextStyle(
                              color:  Colors.white,
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
                          onPressed: () async {
                            await provider.addProductToCategory(widget.product);
                            await provider.deleteRequestedProduct(widget.product);

                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                            fixedSize: Size(98.w, 56.h),
                          ),
                          child: Text(
                            'قبول',
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
    );
  }
}
