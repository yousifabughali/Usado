import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:usado/app_router/router.dart';
import 'package:usado/provider/auth_provider.dart';
import 'package:usado/views/drawer_screens/categories_screen.dart';
import 'package:usado/views/drawer_screens/common_questions_screen.dart';
import 'package:usado/views/drawer_screens/contact_with_us.dart';
import 'package:usado/views/drawer_screens/privacy_screen.dart';
import 'package:usado/views/drawer_screens/settings_screen.dart';
import 'package:usado/views/home_screens/add_product.dart';
import 'package:usado/views/home_screens/favorite_content.dart';
import 'package:usado/views/home_screens/home_content.dart';
import 'package:usado/views/home_screens/message_content.dart';
import 'package:usado/views/home_screens/my_account_screen.dart';

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
    return Directionality(
      textDirection: TextDirection.rtl,
      child: SafeArea(
        child: Scaffold(
          key: _key,
          backgroundColor: Colors.white,

          // appBar: AppBar(
          //   iconTheme: IconThemeData(color: Color.fromRGBO(124, 144, 112, 1)),
          //   backgroundColor: Colors.transparent,
          //   leadingWidth: 50.w,
          //   elevation: 0,
          //   title: Container(
          //     height: 42.h,
          //     width: 300.w,
          //     child: SearchBar(
          //       trailing: [
          //         Icon(
          //           Icons.filter_alt_rounded,
          //           color: Color.fromRGBO(124, 144, 112, 1),
          //         ),
          //       ],
          //       elevation: MaterialStateProperty.all(0),
          //       hintText: 'بحث...',
          //       leading: Icon(Icons.search),
          //       side: MaterialStatePropertyAll(
          //         BorderSide(
          //           color: Color.fromRGBO(124, 144, 112, 1),
          //         ),
          //       ),
          //     ),
          //   ),
          //   actions: [
          //     Icon(Icons.notifications),
          //     SizedBox(
          //       width: 20.w,
          //     ),
          //   ],
          // ),
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
                    backgroundImage: NetworkImage(context.read<AuthProvider>().userImage??''),

                  ),
                  title: Text(
                    context.read<AuthProvider>().nameController.text,
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: 20.sp),
                  ),
                ),

                const Divider(),

                ListTile(
                  onTap: (){
                    setState(() {
                      AppRouter.NavigateToWidget(CategoriesScreen());
                    });
                  },
                  visualDensity: VisualDensity.comfortable,
                  leading: const Icon(
                    Icons.category,
                    color: Colors.black,
                  ),
                  title: Text(
                    'التصنيفات',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: 20.sp),
                  ),
                  trailing: const Icon(Icons.arrow_forward_ios),
                ),
                ListTile(
                  visualDensity: VisualDensity.comfortable,
                  leading: const Icon(
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
                  trailing: const Icon(Icons.arrow_forward_ios),
                ),

                InkWell(
                  onTap: (){
                    AppRouter.NavigateToWidget(const SettingsScreen());
                  },
                  child: ListTile(
                    visualDensity: VisualDensity.comfortable,

                    leading: const Icon(
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
                    trailing: const Icon(Icons.arrow_forward_ios),
                  ),
                ),

                InkWell(
                  onTap: (){
                    AppRouter.NavigateToWidget(const ContactWithUs());
                  },
                  child: ListTile(
                    visualDensity: VisualDensity.comfortable,

                    leading: const Icon(
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
                    trailing: const Icon(Icons.arrow_forward_ios),
                  ),
                ),

                InkWell(
                  onTap: (){
                    AppRouter.NavigateToWidget(const PrivacyScreen());
                  },
                  child: ListTile(
                    visualDensity: VisualDensity.comfortable,
                    leading: const Icon(
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
                    trailing: const Icon(Icons.arrow_forward_ios),
                  ),
                ),

                InkWell(
                  onTap: (){
                    AppRouter.NavigateToWidget(const CommonQuestionScreen());
                  },
                  child: ListTile(
                    visualDensity: VisualDensity.comfortable,

                    leading: const Icon(
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
                    trailing: const Icon(Icons.arrow_forward_ios),
                  ),
                ),

                ListTile(
                  visualDensity: VisualDensity.comfortable,
                  leading: const Icon(
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
                  trailing: const Icon(Icons.arrow_forward_ios),
                ),

                InkWell(
                  onTap: (){
                    Provider.of<AuthProvider>(context,listen: false).signOut();
                  },
                  child: ListTile(
                    visualDensity: VisualDensity.comfortable,
                    leading: const Icon(
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
                    trailing: const Icon(Icons.arrow_forward_ios),
                  ),
                ),
              ],
            ),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          floatingActionButton: selectedItem==0?Container(
            height: 56.h,
            width: 56.w,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Color.fromRGBO(124, 144, 112, 1),
            ),
            child: IconButton(icon: Icon(Icons.add,color: Colors.white,size: 35.r,),onPressed: (){
              AppRouter.NavigateToWidget(AddProduct());
            }),
          ):Container(),
          bottomNavigationBar: Container(
            height: 84.h,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(25.r),
                topLeft: Radius.circular(25.r),
              ),
              color: const Color.fromRGBO(0, 0, 0, 0.25),
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
              selectedLabelStyle: TextStyle(fontWeight: FontWeight.w400 ,fontSize: 12.sp,),
              unselectedLabelStyle: TextStyle(fontWeight: FontWeight.w400 ,fontSize: 12.sp,),
              items:  [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home_rounded,size: 24.r,),
                  label: 'الرئيسية',

                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.message,size: 24.r,),
                  label: 'رسائلي',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.favorite_border,size: 24.r,),
                  label: 'المفضلة',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person,size: 24.r,),
                  label: 'حسابي',
                ),
              ],
            ),
          ),
          body: selectedItem==0?const HomeContent():selectedItem==1?const MessageContent():selectedItem==2?const FavoriteContent():const MyAccount(),
        ),
      ),
    );
  }
}
