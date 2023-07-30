import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:usado/app_router/router.dart';
import 'package:usado/model/Category.dart';
import 'package:usado/model/user.dart';
import 'package:usado/provider/firestore_provider.dart';
import 'package:usado/views/home_screens/add_product.dart';
import 'package:usado/views/home_screens/sub_screens/auction_screen.dart';
import 'package:usado/views/home_screens/sub_screens/sell_product_screen.dart';
import 'package:usado/widgets/product_widget.dart';

class SpecificCategoryScreen extends StatefulWidget {
  Category category;

  SpecificCategoryScreen({required this.category,Key? key}) : super(key: key);

  @override
  State<SpecificCategoryScreen> createState() => _SpecificCategoryScreenState();
}

class _SpecificCategoryScreenState extends State<SpecificCategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<FireStoreProvider>(
      builder: (context,provider,child) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Color.fromRGBO(124, 144, 112, 1),
              centerTitle: true,
              automaticallyImplyLeading: true,
              title: Text(
                widget.category.name,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            body: GridView.builder(
              shrinkWrap: true,
              itemCount: provider.products.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, mainAxisSpacing: 10.h, crossAxisSpacing: 5.w),
              itemBuilder: (BuildContext context, int index) {
                return ProductWidget(product: provider.products[index]);
              },
            ),
          ),
        );
      }
    );
  }
}
