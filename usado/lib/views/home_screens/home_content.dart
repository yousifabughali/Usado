import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:usado/app_router/router.dart';
import 'package:usado/provider/firestore_provider.dart';
import 'package:usado/views/drawer_screens/categories_screen.dart';
import 'package:usado/views/home_screens/add_product.dart';
import 'package:usado/views/home_screens/sub_screens/filter.dart';
import 'package:usado/views/home_screens/sub_screens/notification_screen.dart';
import 'package:usado/views/home_screens/sub_screens/see_more_screen.dart';
import 'package:usado/widgets/product_widget.dart';

class HomeContent extends StatefulWidget {
  const HomeContent({Key? key}) : super(key: key);

  @override
  State<HomeContent> createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  @override
  Widget build(BuildContext context) {
    return Consumer<FireStoreProvider>(builder: (context, provider, child) {
      return SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: Color.fromRGBO(250, 248, 242, 1),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                      Container(
                        width: 245.w,
                        height: 50.h,
                        child: SearchBar(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.transparent),
                          elevation: MaterialStateProperty.all(0),
                          // hintText: 'بحث...',
                          leading: Icon(Icons.search),
                          side: MaterialStatePropertyAll(
                            BorderSide(
                              color: Color.fromRGBO(124, 144, 112, 1),
                            ),
                          ),
                        ),
                      ),
                      // IconButton(
                      //   icon: Icon(
                      //     Icons.filter_alt_rounded,
                      //     color: Color.fromRGBO(124, 144, 112, 1),
                      //   ),
                      //   onPressed: () {
                      //     AppRouter.NavigateToWidget(AddProduct());
                      //   },
                      // ),
                      IconButton(
                        onPressed: () {
                          AppRouter.NavigateToWidget(NotificationScreen());
                        },
                        icon: Icon(
                          Icons.notifications,
                          color: Color.fromRGBO(124, 144, 112, 1),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      TextButton.icon(
                        icon: SvgPicture.asset('assets/icons/cate.svg',height: 35.h,width: 35.w,),
                        onPressed: () {
                          AppRouter.NavigateToWidget(CategoriesScreen());
                        },
                        label: Text('الفئات',style: TextStyle(color: Colors.black),),
                      ),
                      SizedBox(width: 10.w,),
                      TextButton.icon(
                        icon: SvgPicture.asset('assets/icons/filter.svg',height: 35.h,width: 35.w,),
                        onPressed: () {
                          AppRouter.NavigateToWidget(FilterScreen());
                        },
                        label: Text('فلتر',style: TextStyle(color: Colors.black),),
                      ),
                    ],
                  ),
                ],
              ),
            ),
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
                    AppRouter.NavigateToWidget(SeeMore());
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
                itemBuilder: (context, int index) {
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
                itemBuilder: (context, int index) {
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
                itemBuilder: (context, int index) {
                  return ProductWidget(product: provider.allProducts[index]);
                },
              ),
            ),
          ],
        ),
      );
    });
  }
}
