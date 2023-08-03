import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:usado_admin/app_router/router.dart';
import 'package:usado_admin/home/product_request_screen.dart';
import 'package:usado_admin/model/product.dart';

class OrderSoldWidget extends StatefulWidget {
  Product product;
  OrderSoldWidget({required this.product,Key? key}) : super(key: key);

  @override
  State<OrderSoldWidget> createState() => _OrderSoldWidgetState();
}

class _OrderSoldWidgetState extends State<OrderSoldWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
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
                    radius: 35.r,
                    backgroundColor: Colors.grey,
                    backgroundImage: NetworkImage(widget.product.productHolderImage??'https://backend.artreview.com/wp-content/uploads/2021/04/pakpixel.jpg'),

                  ),
                  SizedBox(
                    width: 15.w,
                  ),
                  Text(
                    'البائع: ${widget.product.productHolder}',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 22.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10.h,),
              Row(
                children: [
                  CircleAvatar(
                    radius: 35.r,
                    backgroundColor: Colors.grey,
                    backgroundImage: NetworkImage(widget.product.buyerImage??'https://backend.artreview.com/wp-content/uploads/2021/04/pakpixel.jpg'),
                  ),
                  SizedBox(
                    width: 15.w,
                  ),
                  Text(
                    'المشتري: ${widget.product.buyerName}',
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
                            widget.product.name,
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
            ],
          ),
        ),
      ),
    );
  }
}
