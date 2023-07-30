import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:usado/app_router/router.dart';
import 'package:usado/provider/auth_provider.dart';
import 'package:usado/views/home_screens/sub_screens/edit_profile_screen.dart';
import 'package:usado/views/home_screens/sub_screens/offered_product.dart';
import 'package:usado/views/home_screens/sub_screens/requested_product.dart';

class MyAccount extends StatefulWidget {
  const MyAccount({Key? key}) : super(key: key);

  @override
  State<MyAccount> createState() => _MyAccountState();
}

class _MyAccountState extends State<MyAccount> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 36.w, vertical: 20.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.min,
          children: [
            CircleAvatar(
              backgroundColor: Colors.grey,
              radius: 60.r,
              backgroundImage: NetworkImage(context.read<AuthProvider>().userImage??'')
              //TODO: ADD THE IMAGE OF THE USER
              // child: Image.as,
            ),
            Text(
              context.read<AuthProvider>().nameController.text,
              style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w600),
            ),
            InkWell(
              onTap: (){
                AppRouter.NavigateToWidget(RequestedProduct());
              },
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 10.h,horizontal: 0.w),
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
                  padding:  EdgeInsets.symmetric(vertical: 20.h,horizontal: 15.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('طلباتي',style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w600),),
                      Icon(Icons.arrow_forward_ios),
                    ],
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: (){
                AppRouter.NavigateToWidget(OfferedProduct());
              },
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 10.h,horizontal: 0.w),
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
                  padding:  EdgeInsets.symmetric(vertical: 20.h,horizontal: 15.w),
                  child: InkWell(
                    onTap: (){
                      AppRouter.NavigateToWidget(OfferedProduct());
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('المنتجات المعروضة',style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w600),),
                        Icon(Icons.arrow_forward_ios),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10.h,horizontal: 0.w),

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
                padding:  EdgeInsets.symmetric(vertical: 20.h,horizontal: 15.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('المنتجات التي تم بيعها',style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w600),),
                    Icon(Icons.arrow_forward_ios),
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10.h,horizontal: 0.w),

              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16.r),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade300,
                    offset: Offset(0.0, 1.0), //(x,y)
                    blurRadius: 3.0,
                  ),
                ],
              ),
              child: Padding(
                padding:  EdgeInsets.symmetric(vertical: 20.h,horizontal: 15.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('المفضلة',style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w600),),
                    Icon(Icons.arrow_forward_ios),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: (){
                AppRouter.NavigateToWidget(EditProfile());
              },
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 10.h,horizontal: 0.w),

                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16.r),
                  boxShadow:  [
                    BoxShadow(
                      color: Colors.grey.shade300,
                      offset: Offset(0.0, 1.0), //(x,y)
                      blurRadius: 3.0,
                    ),
                  ],
                ),
                child: Padding(
                  padding:  EdgeInsets.symmetric(vertical: 20.h,horizontal: 15.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('تعديل البيانات',style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w600),),
                      Icon(Icons.arrow_forward_ios),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
