import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:usado/provider/firestore_provider.dart';
import 'package:usado/widgets/product_widget.dart';

class SeeMore extends StatefulWidget {
  const SeeMore({Key? key}) : super(key: key);

  @override
  State<SeeMore> createState() => _SeeMoreState();
}

class _SeeMoreState extends State<SeeMore> {
  @override
  Widget build(BuildContext context) {
    return Consumer<FireStoreProvider>(
      builder: (context,provider,child) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: SafeArea(
            child: Scaffold(
              backgroundColor: Colors.white,
              appBar: AppBar(
                automaticallyImplyLeading: true,
                iconTheme: IconThemeData(color: Colors.white),
                backgroundColor: Color.fromRGBO(124, 144, 112, 1),
                leadingWidth: 50.w,
                elevation: 0,
                centerTitle: true,
                title: Text(
                  'المضاف حديثًا',
                  style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w700,
                      color: Colors.white),
                ),
              ),
              body: GridView.builder(
                shrinkWrap: true,
                itemCount: provider.allProducts.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10.h,
                    crossAxisSpacing: 5.w),
                itemBuilder: (BuildContext context, int index) {
                  return ProductWidget(product: provider.allProducts[index],);
                },
              ),
            ),
          ),
        );
      }
    );
  }
}
