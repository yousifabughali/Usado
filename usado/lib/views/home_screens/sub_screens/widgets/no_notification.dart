import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EmptyNotifications extends StatelessWidget {
  const EmptyNotifications({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Image.asset(
            'assets/icons/empty_notification.svg',
            width: 140.w,
            height: 160.h,
          ),
          SizedBox(height: 5.h,),
          Text(
            'لا يوجد اشعارات',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w400,
              fontSize: 20.sp,
            ),
          ),
          SizedBox(height: 5.h,),
          Text(
            'سوف نننبهك عندما يحدث شيء ما',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w400,
              fontSize: 18.sp,
            ),
          )
        ],
      ),
    );
  }
}
