import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:usado/app_router/router.dart';
import 'package:usado/provider/firestore_provider.dart';
import 'package:usado/views/home_screens/specific_category_screen.dart';
import 'package:usado/widgets/category_widget.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<FireStoreProvider>(builder: (context, provider, child) {
      return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Color.fromRGBO(124, 144, 112, 1),
            title: Text('الفئات'),
            automaticallyImplyLeading: true,
            centerTitle: true,
          ),
          body: GridView.builder(
            shrinkWrap: true,
            itemCount: provider.categories.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10.h,
                crossAxisSpacing: 5.w),
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                onTap: () async {
                  await provider.getAllProduct(provider.categories[index].id!);
                  AppRouter.NavigateToWidget(SpecificCategoryScreen(category: provider.categories[index],
                  ));
                },
                child: CategoryWidget(
                    category: provider.categories[index]),
              );
            },
          ),
        ),
      );
    });
  }
}
