import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:usado_admin/app_router/router.dart';
import 'package:usado_admin/drawer_screens/categories_screen.dart';
import 'package:usado_admin/drawer_screens/common_questions_screen.dart';
import 'package:usado_admin/drawer_screens/contact_with_us.dart';
import 'package:usado_admin/drawer_screens/privacy_screen.dart';
import 'package:usado_admin/drawer_screens/settings_screen.dart';
import 'package:usado_admin/home/add_new_categoty_widget.dart';
import 'package:usado_admin/home/home_content.dart';
import 'package:usado_admin/home/orders_content.dart';
import 'package:usado_admin/home/product_request_screen.dart';
import 'package:usado_admin/home/sold_content.dart';
import 'package:usado_admin/provider/firestore_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedItem = 0;
  final GlobalKey<ScaffoldState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Consumer<FireStoreProvider>(
      builder: (context,provider,child) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: SafeArea(
            child: Scaffold(
              key: _key,
              backgroundColor: Colors.white,
              floatingActionButton: selectedItem == 1
                  ? FloatingActionButton(
                      backgroundColor: Color.fromRGBO(124, 144, 112, 1),
                      onPressed: () {
                        showBottomSheet(context);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: Icon(Icons.add,color: Colors.white,),
                        ),
                      ),
                    )
                  : Container(),
              drawer: Drawer(
                backgroundColor: Colors.white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ListTile(
                      visualDensity: VisualDensity.comfortable,
                      leading: CircleAvatar(
                        backgroundColor: Colors.grey,
                        radius: 55.r,
                      ),
                      title: Text(
                        'مدير لوحة التحكم',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                            fontSize: 20.sp),
                      ),
                    ),
                    Divider(),
                    ListTile(
                      visualDensity: VisualDensity.comfortable,
                      leading: Icon(
                        Icons.share,
                        color: Colors.black,
                      ),
                      title: Text(
                        'شارك مع الأصدقاء',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                            fontSize: 20.sp),
                      ),
                      trailing: Icon(Icons.arrow_forward_ios),
                    ),
                    InkWell(
                      onTap: () {
                        AppRouter.NavigateToWidget(SettingsScreen());
                      },
                      child: ListTile(
                        visualDensity: VisualDensity.comfortable,
                        leading: Icon(
                          Icons.settings,
                          color: Colors.black,
                        ),
                        title: Text(
                          'الإعدادات',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                              fontSize: 20.sp),
                        ),
                        trailing: Icon(Icons.arrow_forward_ios),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        AppRouter.NavigateToWidget(ContactWithUs());
                      },
                      child: ListTile(
                        visualDensity: VisualDensity.comfortable,
                        leading: Icon(
                          Icons.phone,
                          color: Colors.black,
                        ),
                        title: Text(
                          'تواصل معنا',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                            fontSize: 20.sp,
                          ),
                        ),
                        trailing: Icon(Icons.arrow_forward_ios),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        AppRouter.NavigateToWidget(PrivacyScreen());
                      },
                      child: ListTile(
                        visualDensity: VisualDensity.comfortable,
                        leading: Icon(
                          Icons.privacy_tip_outlined,
                          color: Colors.black,
                        ),
                        title: Text(
                          'سياسة الخصوصية',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                            fontSize: 20.sp,
                          ),
                        ),
                        trailing: Icon(Icons.arrow_forward_ios),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        AppRouter.NavigateToWidget(CommonQuestionScreen());
                      },
                      child: ListTile(
                        visualDensity: VisualDensity.comfortable,
                        leading: Icon(
                          Icons.question_mark_outlined,
                          color: Colors.black,
                        ),
                        title: Text(
                          'الأسئلة الشائعة',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                              fontSize: 20.sp),
                        ),
                        trailing: Icon(Icons.arrow_forward_ios),
                      ),
                    ),
                    ListTile(
                      visualDensity: VisualDensity.comfortable,
                      leading: Icon(
                        Icons.language,
                        color: Colors.black,
                      ),
                      title: Text(
                        'اللغة',
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
                        Icons.logout,
                        color: Colors.black,
                      ),
                      title: Text(
                        'تسجيل الخروج',
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
              bottomNavigationBar: Container(
                height: 84.h,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(25.r),
                    topLeft: Radius.circular(25.r),
                  ),
                  color: Color.fromRGBO(0, 0, 0, 0.25),
                ),
                child: BottomNavigationBar(
                  onTap: (value) {
                    setState(() {
                      selectedItem = value;
                    });
                  },
                  elevation: 0,
                  selectedIconTheme:
                      const IconThemeData(color: Color.fromRGBO(124, 144, 112, 1)),
                  selectedItemColor: const Color.fromRGBO(124, 144, 112, 1),
                  unselectedItemColor: Colors.black,
                  unselectedIconTheme: const IconThemeData(color: Colors.black),
                  showUnselectedLabels: true,
                  currentIndex: selectedItem,
                  type: BottomNavigationBarType.fixed,
                  selectedLabelStyle: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 12.sp,
                  ),
                  unselectedLabelStyle: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 12.sp,
                  ),
                  items: [
                    BottomNavigationBarItem(
                      icon: Icon(
                        Icons.home_rounded,
                        size: 24.r,
                      ),
                      label: 'الرئيسية',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(
                        Icons.category,
                        size: 24.r,
                      ),
                      label: 'القئات',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(
                        Icons.shopping_cart,
                        size: 24.r,
                      ),
                      label: 'الطلبات',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(
                        Icons.sell,
                        size: 24.r,
                      ),
                      label: 'المبيعات',
                    ),
                  ],
                ),
              ),
              body: selectedItem == 0
                  ? HomeContent()
                  : selectedItem == 1
                      ? CategoriesScreen()
                      : selectedItem == 2
                          ? OrderContent()
                          : SoldContent(),
            ),
          ),
        );
      }
    );
  }
  showBottomSheet(BuildContext context) {
    return showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40.0), topRight: Radius.circular(40.0)),
      ),
      builder: (BuildContext context) {
        return Padding(
          padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: SizedBox(
            height: 361.h,
            width: 375.w,
            child: AddNewCategoryWidget(),
          ),
        );
      },
    );
  }
}

