import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:usado/app_router/router.dart';
import 'package:usado/model/product.dart';
import 'package:usado/provider/firestore_provider.dart';
import 'package:usado/widgets/product_widget.dart';

class MessageContent extends StatefulWidget {
  const MessageContent({Key? key}) : super(key: key);

  @override
  State<MessageContent> createState() => _MessageContentState();
}

class _MessageContentState extends State<MessageContent> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: Color.fromRGBO(124, 144, 112, 1),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 0.w),
            child: Center(
              child: Text(
                'الرسائل',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 22.sp,
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 150.h,
        ),
        Center(
          child: Column(
            children: [
              SvgPicture.asset('assets/icons/messages.svg'),
              SizedBox(
                height: 10.h,
              ),
              Text('لا توجد رسائل! إبدأ الدردشة الان',style: TextStyle(color: Colors.black,fontSize: 18.sp,fontWeight: FontWeight.w700),)
            ],
          ),
        ),
      ],
    );
  }
}
