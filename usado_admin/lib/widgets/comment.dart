import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:usado_admin/model/comments.dart';

class Comment extends StatefulWidget {
  Bids bid;
   Comment({ required this.bid,Key? key}) : super(key: key);

  @override
  State<Comment> createState() => _CommentState();
}

class _CommentState extends State<Comment> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10.h),
      width: MediaQuery.of(context).size.width,
      child: Row(
        children: [
          CircleAvatar(
            radius: 40.r,
            backgroundColor: Colors.grey,
          ),
          SizedBox(
            width: 8.w,
          ),
          Container(
            height: 90.h,
            width: 334.w,
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(20.r),
            ),
            child: Padding(
              padding:  EdgeInsets.symmetric(vertical: 10.h,horizontal: 10.w),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(widget.bid.name,style: TextStyle(color: Colors.black,fontSize: 18.sp,fontWeight: FontWeight.w600),),
                      Text(widget.bid.date,style: TextStyle(color: Colors.black,fontSize: 18.sp,fontWeight: FontWeight.w600),),
                    ],
                  ),
                  Spacer(),
                  Align(
                    alignment: Alignment.bottomRight,
                      child: Text(widget.bid.answer,style: TextStyle(color: Colors.black45,fontSize: 18.sp,fontWeight: FontWeight.w600),)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
