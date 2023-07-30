import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OnBoardingContent extends StatelessWidget {
  final String title;
  final String subtitle;
  final String image;

  OnBoardingContent({
    required this.title,
    required this.subtitle,
    required this.image,

  });

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(top: 97.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: SvgPicture.asset('assets/images/$image.svg',height: 420.h,width: double.infinity,),
            ),
            SizedBox(height: 30.h,),
            Text(
              title,
              style: TextStyle(
                fontSize: 25.sp,
                fontWeight: FontWeight.w700,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 5.h),
            Expanded(
              child: Text(
                subtitle,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey.shade600,
                ),
              ),
            ),
            SizedBox(height: 10.h,),
          ],
        ),
      );
  }
}
