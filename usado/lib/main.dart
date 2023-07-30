import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:usado/app_router/router.dart';
import 'package:usado/firebase_options.dart';
import 'package:usado/views/drawer_screens/contact_with_us.dart';
import 'package:usado/views/drawer_screens/settings_screen.dart';
import 'package:usado/views/home_screens/home_screen.dart';
import 'package:usado/views/lunch_screen.dart';

import 'provider/auth_provider.dart';
import 'provider/firestore_provider.dart';
import 'views/home_screens/add_product.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<AuthProvider>(
            create: (context) => AuthProvider(),
          ),
          ChangeNotifierProvider<FireStoreProvider>(
            create: (context) => FireStoreProvider(),
          ),
        ],
        builder: (context, child) {
          return ScreenUtilInit(
            designSize: const Size(428, 926),
            builder: (context, child) {
              return MaterialApp(
                navigatorKey: AppRouter.navKey,
                home: LunchScreen(),
              );
            },
          );
        });
  }
}
