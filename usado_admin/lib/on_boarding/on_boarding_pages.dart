import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:usado_admin/app_router/router.dart';
import 'package:usado_admin/home/home_screen.dart';
import 'package:usado_admin/on_boarding/widgets/on_boarding_indicator.dart';
import 'package:usado_admin/on_boarding/widgets/on_bording_content.dart';


class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int _currentPageIndex = 0;
  late PageController _pageController;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageController = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView(
              reverse: true,
              controller: _pageController,
              onPageChanged: (int value) {
                setState(() {
                  _currentPageIndex = value;
                });
              },
              scrollDirection: Axis.horizontal,
              children: [
                OnBoardingContent(
                  image: 'on_1',
                  title: 'خدمة توصيل',
                  subtitle:
                      'لا يوجد حاجة لبطاقة الائتمان، معنا الدفع عند الاستلام',
                ),
                OnBoardingContent(
                  image: 'on_2',
                  title: 'لدينا عملاء موثوقين، بيع و اشتري بأمان',
                  subtitle: '',
                ),
                OnBoardingContent(
                  image: 'on_3',
                  title: ' Usado مرحباً بك في',
                  subtitle:
                      '  ماذا تنتظر؟ ابدأ الآن واكتشف عالمك الجديد في بيع وشراء الأشياء المستعملة ',
                ),
              ],
            ),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              OnBordingIndicator(
                selected: _currentPageIndex == 2,
                marginEnd: 20.w,
              ),
              OnBordingIndicator(
                  selected: _currentPageIndex == 1, marginEnd: 20.w),
              OnBordingIndicator(
                selected: _currentPageIndex == 0,
                marginEnd: 20.w,
              ),
            ],
          ),
          SizedBox(
            height: 20.h,
          ),
          Visibility(
            visible: _currentPageIndex!=2,
            child: Column(
              children: [
                ElevatedButton(
                  onPressed: () {
                    _pageController.animateToPage(
                        _currentPageIndex == 2
                            ? _currentPageIndex = 0
                            : ++_currentPageIndex,
                        duration: const Duration(seconds: 1),
                        curve: Curves.easeIn);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromRGBO(124, 144, 112, 1),
                    fixedSize: Size(332.w, 69.h),
                  ),
                  child: Text(
                    'متابعة',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                ElevatedButton(
                  onPressed: () {
                    _pageController.animateToPage(2,
                        duration: const Duration(milliseconds: 10), curve: Curves.easeIn);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromRGBO(238, 238, 238, 1),
                    fixedSize: Size(332.w, 69.h),
                  ),
                  child: Text(
                    'تخطي',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Visibility(
            visible: _currentPageIndex==2,
            child: Padding(
              padding:  EdgeInsets.only(bottom: 89.h),
              child: ElevatedButton(
                onPressed: () {
                  AppRouter.NavigateWithReplacemtnToWidget(HomeScreen());
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromRGBO(124, 144, 112, 1),
                  fixedSize: Size(332.w, 69.h),
                ),
                child: Text(
                  'ابدأ الآن',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 40.h,
          ),
        ],
      ),
    );
  }
}
