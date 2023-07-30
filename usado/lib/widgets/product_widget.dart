import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:usado/app_router/router.dart';
import 'package:usado/model/product.dart';
import 'package:usado/provider/firestore_provider.dart';
import 'package:usado/views/home_screens/sub_screens/auction_screen.dart';
import 'package:usado/views/home_screens/sub_screens/sell_product_screen.dart';

class ProductWidget extends StatefulWidget {
  Product product;

  ProductWidget({required this.product, Key? key}) : super(key: key);

  @override
  State<ProductWidget> createState() => _ProductWidgetState();
}

class _ProductWidgetState extends State<ProductWidget> {
   
  @override
  Widget build(BuildContext context) {
    return Consumer<FireStoreProvider>(
        builder: (context, provider, child) {
          return InkWell(
            onTap: ()  async {
               bool liked = provider.favourite.any((element) => element.id==widget.product.id);
               bool mine = await provider
                   .myProducts
                   .any((element) => element.id == widget.product.id);
               log(mine.toString());
               log(provider.myProducts.first.id.toString());
               log(widget.product.id.toString());
              if (widget.product.operation == 'TypeOfProcess.sell') {
                AppRouter.NavigateToWidget(SellProductScreen(product: widget.product,liked: liked,mine: mine));
              }
              else {
                AppRouter.NavigateToWidget(
                    AuctionScreen(product: widget.product,liked: liked,mine: mine));
              }
            },
            child: Container(
              width: 188.w,

              margin: EdgeInsets.only(
                  left: 10.w, top: 10.h, right: 10.w, bottom: 10.h),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16.r),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.grey,
                    offset: Offset(0.0, 1.0), //(x,y)
                    blurRadius: 3.0,
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: 156.w,
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: Image.network(
                      widget.product.image,
                      fit: BoxFit.cover,
                      height: 140.h,
                    ),
                  ),
                  Text(
                    widget.product.name,
                    style: TextStyle(
                      color: Color.fromRGBO(124, 144, 112, 1),
                      fontWeight: FontWeight.w700,
                      fontSize: 18.sp,
                    ),
                  ),
                  Text(
                    '${widget.product.price} ₪',
                    style: TextStyle(color: Colors.orange,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
          );
        }
    );
  }
}
