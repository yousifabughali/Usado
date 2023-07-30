import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:usado/app_router/router.dart';
import 'package:usado/model/product.dart';
import 'package:usado/provider/firestore_provider.dart';
import 'package:usado/widgets/product_widget.dart';

class FavoriteContent extends StatefulWidget {
  const FavoriteContent({Key? key}) : super(key: key);

  @override
  State<FavoriteContent> createState() => _FavoriteContentState();
}

class _FavoriteContentState extends State<FavoriteContent> {
  @override
  Widget build(BuildContext context) {
    return Consumer<FireStoreProvider>(
      builder: (context,provider,child) {
        return ListView(
          shrinkWrap: true,
          children: [
            Container(
              color: Color.fromRGBO(124, 144, 112, 1),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15.h,horizontal: 0.w),
                child: Center(
                  child: Text(
                    'المفضلة',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 22.sp,
                    ),
                  ),
                ),
              ),
            ),
            GridView.builder(
              shrinkWrap: true,
              itemCount: context.read<FireStoreProvider>().favourite!.length,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
              ),
              itemBuilder: (BuildContext context, int index) {
                return provider.favourite!.length==0? Center(child: CircularProgressIndicator()):
                  ProductWidget(product: provider.favourite![index] as Product);
              },
            ),
          ],
        );
      }
    );
  }
}
