
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:usado_admin/model/product.dart';

class ProductDetails extends StatelessWidget {
  Product product;
   ProductDetails({
     required this.product,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 267.h,
      margin: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  children: [
                    SvgPicture.asset('assets/icons/category.svg'),
                    SizedBox(
                      width: 2.w,
                    ),
                    Text(product.name),
                  ],
                ),
                Row(
                  children: [
                    SvgPicture.asset('assets/icons/sub_category.svg'),
                    SizedBox(
                      width: 2.w,
                    ),
                    Text(product.categoryName),
                  ],
                ),
                Row(
                  children: [
                    SvgPicture.asset('assets/icons/ticket.svg'),
                    SizedBox(
                      width: 2.w,
                    ),
                    Text('35828'),
                  ],
                ),
                Row(
                  children: [
                    SvgPicture.asset('assets/icons/color.svg'),
                    SizedBox(
                      width: 2.w,
                    ),
                    Text(product.color),
                  ],
                ),
                Row(
                  children: [
                    SvgPicture.asset('assets/icons/location.svg'),
                    SizedBox(
                      width: 2.w,
                    ),
                    Text('غزة'),
                  ],
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  children: [
                    SvgPicture.asset('assets/icons/price.svg'),
                    SizedBox(
                      width: 2.w,
                    ),
                    Text('${product.price} ILS'),
                  ],
                ),
                Row(
                  children: [
                    SizedBox(width: 5.w,),
                    SvgPicture.asset('assets/icons/type.svg'),
                    SizedBox(
                      width: 2.w,
                    ),
                    Text(product.categoryName),
                  ],
                ),
                Row(
                  children: [
                    SizedBox(width: 5.w,),

                    SvgPicture.asset('assets/icons/used.svg'),
                    SizedBox(
                      width: 2.w,
                    ),
                    Text(product.usedTime),
                  ],
                ),
                Row(
                  children: [
                    SizedBox(width: 5.w,),

                    SvgPicture.asset('assets/icons/ad.svg'),
                    SizedBox(
                      width: 2.w,
                    ),
                    Text(product.operation=='TypeOfProcess.sell'?'بيع':'مزاد'),
                  ],
                ),
                Row(
                  children: [
                    SizedBox(width: 5.w,),
                    SvgPicture.asset('assets/icons/time.svg'),
                    SizedBox(
                      width: 2.w,
                    ),
                    Text(product.publishDate),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
