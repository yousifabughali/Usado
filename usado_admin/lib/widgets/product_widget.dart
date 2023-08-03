import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:usado_admin/app_router/router.dart';
import 'package:usado_admin/home/sell_product_screen.dart';

import '../model/product.dart';


class ProductWidget extends StatefulWidget {
  Product product;
   ProductWidget({required this.product,Key? key}) : super(key: key);

  @override
  State<ProductWidget> createState() => _ProductWidgetState();
}

class _ProductWidgetState extends State<ProductWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        AppRouter.NavigateToWidget(SellProductScreen(product: widget.product));
      },
      child: Container(
        width: 188.w,
        margin: EdgeInsets.only(left: 10.w,top: 10.h,right: 10.w, bottom: 10.h),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.r),
          boxShadow: const [
            BoxShadow(
              color: Colors.grey,
              offset: Offset(0.0, 1.0), //(x,y)
              blurRadius: 3.0,
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.only(top: 15.h, right: 16.w, left: 16.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: 156.w,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Image.network(
                  widget.product.image,
                  height: 140.h,
                  fit: BoxFit.cover,
                ),
              ),
              Text(
                widget.product.name,
                style: TextStyle(
                  color: Color.fromRGBO(124, 144, 112, 1),
                  fontWeight: FontWeight.w700,
                  fontSize: 18.sp,
                ),
              ),
              Text(
                '${widget.product.price} ₪',
                style: TextStyle(color: Colors.orange,fontSize: 16.sp,fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
