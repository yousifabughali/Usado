import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:usado_admin/model/Category.dart';

class CategoryWidget extends StatefulWidget {
  Category category;
   CategoryWidget({required this.category,Key? key}) : super(key: key);

  @override
  State<CategoryWidget> createState() => _CategoryWidgetState();
}

class _CategoryWidgetState extends State<CategoryWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160.w,
      margin: EdgeInsets.only(left: 6.w,top: 4.h,right: 6.w, bottom: 4.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(0.0, 1.0), //(x,y)
            blurRadius: 3.0,
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.only(top: 8.h, right: 8.w, left: 8.w,bottom: 5.h),
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
                widget.category.imageUrl,
                fit: BoxFit.cover,
                height: 150.h,
              ),
            ),
            Text(
              widget.category.name,
              style: TextStyle(
                color: Color.fromRGBO(124, 144, 112, 1),
                fontWeight: FontWeight.w700,
                fontSize: 16.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
