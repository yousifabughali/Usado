import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
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
            'الإعدادات',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w600,
              fontSize: 24.sp,
            ),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'إعدادات الحساب',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 20.sp,
                ),
              ),
              SizedBox(
                height: 15.h,
              ),
              Container(
                width: 395.w,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(217, 217, 217, 0.27),
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ListTile(
                      visualDensity: VisualDensity.comfortable,
                      leading: Icon(
                        Icons.edit,
                        color: Colors.black,
                      ),
                      title: Text(
                        'تعديل البيانات',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                            fontSize: 20.sp),
                      ),
                      trailing: Icon(Icons.arrow_forward_ios),
                    ),
                    ListTile(
                      visualDensity: VisualDensity.comfortable,

                      leading: Icon(
                        Icons.password,
                        color: Colors.black,
                      ),
                      title: Text(
                        'تغيير كلمة المرور',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                            fontSize: 20.sp),
                      ),
                      trailing: Icon(Icons.arrow_forward_ios),
                    ),
                    ListTile(
                      visualDensity: VisualDensity.comfortable,

                      leading: Icon(
                        Icons.notifications,
                        color: Colors.black,
                      ),
                      title: Text(
                        'إظهار الإشعارات',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                            fontSize: 20.sp),
                      ),
                      trailing: Switch(value: true, onChanged: (value) {}),
                    ),
                    ListTile(
                      visualDensity: VisualDensity.comfortable,

                      leading: Icon(
                        Icons.nightlight_round,
                        color: Colors.black,
                      ),
                      title: Text(
                        'الوضع الليلي',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                            fontSize: 20.sp),
                      ),
                      trailing:
                          Switch.adaptive(value: false, onChanged: (value) {}),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 40.h,
              ),
              Text(
                'المزيد',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 20.sp,
                ),
              ),
              SizedBox(
                height: 15.h,
              ),
              Container(
                width: 395.w,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(217, 217, 217, 0.27),
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ListTile(
                      visualDensity: VisualDensity.comfortable,

                      leading: Icon(
                        Icons.question_mark_outlined,
                        color: Colors.black,
                      ),
                      title: Text(
                        'من نحن؟',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                            fontSize: 20.sp),
                      ),
                      trailing: Icon(Icons.arrow_forward_ios),
                    ),
                    ListTile(
                      visualDensity: VisualDensity.comfortable,

                      leading: Icon(
                        Icons.headset_mic_rounded,
                        color: Colors.black,
                      ),
                      title: Text(
                        'المساعدة والدعم',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                            fontSize: 20.sp),
                      ),
                      trailing: Icon(Icons.arrow_forward_ios),
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
