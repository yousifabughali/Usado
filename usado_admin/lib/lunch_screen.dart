import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:usado_admin/app_router/router.dart';
import 'package:usado_admin/on_boarding/on_boarding_pages.dart';


class LunchScreen extends StatefulWidget {
  const LunchScreen({Key? key}) : super(key: key);

  @override
  State<LunchScreen> createState() => _LunchScreenState();
}

class _LunchScreenState extends State<LunchScreen> {
  void initState() {
    // TODO: implement initState
    super.initState();
    navigationFun(context);
  }

  navigationFun(BuildContext context) async {
    await Future.delayed(const Duration(seconds: 3));
    AppRouter.NavigateWithReplacemtnToWidget(OnboardingScreen());
    // Provider.of<AuthProvider>(context, listen: false).checkUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(124, 144, 112, 1),
      body: Center(
        child: Text(
          'Usado',
          style: TextStyle(
            color: Colors.white,
            fontSize: 40.sp,
            shadows:  <Shadow>[
              Shadow(
                offset: const Offset(-3.0, 2.0),
                blurRadius: 3.0.r,
                color: Colors.black,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
