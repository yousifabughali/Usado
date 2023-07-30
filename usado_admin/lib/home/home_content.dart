import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:usado_admin/app_router/router.dart';
import 'package:usado_admin/home/see_more_screen.dart';
import 'package:usado_admin/provider/firestore_provider.dart';
import 'package:usado_admin/widgets/product_widget.dart';

class HomeContent extends StatefulWidget {
  const HomeContent({Key? key}) : super(key: key);

  @override
  State<HomeContent> createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  @override
  Widget build(BuildContext context) {
    return Consumer<FireStoreProvider>(
      builder: (context,provider,child) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: Color.fromRGBO(250, 248, 242, 1),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      setState(() {
                        Scaffold.of(context).openDrawer();
                      });
                    },
                    icon: Icon(
                      Icons.menu,
                      color: Color.fromRGBO(124, 144, 112, 1),
                    ),
                  ),
                  SizedBox(
                    width: 110.w,
                  ),
                  Center(
                      child: Text(
                    'لوحة التحكم',
                    style: TextStyle(
                        color: Color.fromRGBO(124, 144, 112, 1),
                        fontWeight: FontWeight.w600,
                        fontSize: 18.sp),
                  ))
                ],
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  ListTile(
                    title: Text(
                      'المُضاف حديثًا',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w600),
                    ),
                    trailing: Directionality(
                      textDirection: TextDirection.ltr,
                      child: TextButton.icon(
                        onPressed: () {
                          AppRouter.NavigateToWidget(SeeMore(title: 'المُضاف حديثًا'));
                        },
                        label: Text(
                          'المزيد',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w600),
                        ),
                        icon: Icon(
                          Icons.arrow_back_ios,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 280.h,
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: provider.allProducts.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context,int index){
                        return ProductWidget(product: provider.allProducts[index]);
                      },
                    ),
                  ),
                  ListTile(
                    title: Text(
                      'اهتماماتك',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w600),
                    ),
                    trailing: Directionality(
                      textDirection: TextDirection.ltr,
                      child: TextButton.icon(
                        onPressed: () {},
                        label: Text(
                          'المزيد',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w600),
                        ),
                        icon: Icon(
                          Icons.arrow_back_ios,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 280.h,
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: provider.allProducts.length,
                      itemBuilder: (context,int index){
                        return ProductWidget(product: provider.allProducts[index]);
                      },
                    ),
                  ),
                  ListTile(
                    title: Text(
                      'أماكن قريبة منك',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w600),
                    ),
                    trailing: Directionality(
                      textDirection: TextDirection.ltr,
                      child: TextButton.icon(
                        onPressed: () {},
                        label: Text(
                          'المزيد',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w600),
                        ),
                        icon: Icon(
                          Icons.arrow_back_ios,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),

                  SizedBox(
                    height: 280.h,
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: provider.allProducts.length,
                      itemBuilder: (context,int index){
                        return ProductWidget(product: provider.allProducts[index]);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      }
    );
  }
}
