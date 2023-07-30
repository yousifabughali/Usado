import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          automaticallyImplyLeading: true,
          iconTheme: IconThemeData(color: Colors.white),
          backgroundColor: Color.fromRGBO(124, 144, 112, 1),
          leadingWidth: 50.w,
          centerTitle: true,
          elevation: 0,
          title: Text(
            'الاشعارات',
            style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 16.w),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(19.r),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        offset: Offset(0.0, 1.0), //(x,y)
                        blurRadius: 3.0,
                      ),
                    ],
                  ),
                  child: ListTile(
                    visualDensity: VisualDensity.comfortable,
                    leading: CircleAvatar(
                      radius: 31.25.r,
                      backgroundColor: Colors.grey,
                      backgroundImage: AssetImage('assets/images/image.png'),
                    ),
                    trailing: Text(
                      'منذ 10 دقائق',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 12.sp),
                    ),
                    title: Text(
                      'ينتهي المزاد خلال 3 أيام',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 16.sp),
                    ),
                  ),
                ),
                SizedBox(
                  height: 16.h,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(124, 144, 112, 1),
                    borderRadius: BorderRadius.circular(19.r),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        offset: Offset(0.0, 1.0), //(x,y)
                        blurRadius: 3.0,
                      ),
                    ],
                  ),
                  child: ListTile(
                    visualDensity: VisualDensity.comfortable,
                    leading: CircleAvatar(
                        radius: 31.25.r, backgroundColor: Colors.grey,
                      backgroundImage: AssetImage('assets/images/image.png'),

                    ),
                    trailing: Text(
                      'منذ ساعة',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                          fontSize: 12.sp),
                    ),
                    title: Text(
                      'تم الموافقة على طلبك',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                          fontSize: 16.sp),
                    ),
                  ),
                ),
                SizedBox(
                  height: 16.h,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(19.r),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        offset: Offset(0.0, 1.0), //(x,y)
                        blurRadius: 3.0,
                      ),
                    ],
                  ),
                  child: ListTile(
                    visualDensity: VisualDensity.comfortable,
                    leading: CircleAvatar(
                        radius: 31.25.r, backgroundColor: Colors.grey,
                      backgroundImage: AssetImage('assets/images/image.png'),
                    ),
                    trailing: Text(
                      'منذ ساعتان',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 12.sp),
                    ),
                    title: Text(
                      'لم يتم الموافقة على طلبك، تواصل معنا',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 16.sp),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
