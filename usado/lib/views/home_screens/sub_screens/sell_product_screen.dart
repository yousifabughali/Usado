import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:usado/app_router/router.dart';
import 'package:usado/model/product.dart';
import 'package:usado/provider/auth_provider.dart';
import 'package:usado/provider/firestore_provider.dart';
import 'package:usado/views/home_screens/sub_screens/widgets/confirm_selling.dart';
import 'package:usado/widgets/product_details.dart';
import 'package:url_launcher/url_launcher.dart';

class SellProductScreen extends StatefulWidget {
  Product product;
  bool liked;
  bool mine;

  SellProductScreen({required this.product, required this.liked,required this.mine, Key? key})
      : super(key: key);

  @override
  State<SellProductScreen> createState() => _SellProductScreenState();
}

class _SellProductScreenState extends State<SellProductScreen> {

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<FireStoreProvider>(builder: (context, provider, child) {
      return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          floatingActionButton: widget.mine
              ? FloatingActionButton(
            backgroundColor: Color.fromRGBO(124, 144, 112, 1),
                  onPressed: () async {
                    await provider.deleteProduct(widget.product);
                  },
                  child: Container(
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: Icon(Icons.delete_outlined),
                  ),
                )
              : Container(),
          backgroundColor: Colors.white,
          appBar: AppBar(
            automaticallyImplyLeading: true,
            backgroundColor: Color.fromRGBO(124, 144, 112, 1),
            actions: [
              IconButton(
                onPressed: () {
                  setState(() {
                    if (widget.liked == false) {
                      provider.addNewFavorite(widget.product);
                      widget.liked = true;
                    } else {
                      provider.removeFromFavorite(widget.product);
                      widget.liked = false;
                    }
                  });
                },
                icon: Icon(
                  widget.liked ? Icons.favorite : Icons.favorite_border,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                width: 10.w,
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.ios_share),
              ),
            ],
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  height: 341.h,
                  child: Image.network(widget.product.image, fit: BoxFit.cover),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 40.r,
                            backgroundColor: Colors.grey,
                            backgroundImage: NetworkImage(
                                widget.product.productHolderImage!),
                          ),
                          SizedBox(
                            width: 20.w,
                          ),
                          Text(
                            widget.product.productHolder,
                            style: TextStyle(),
                          )
                        ],
                      ),
                      ProductDetails(product: widget.product),
                      SizedBox(
                        height: 10.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                            child: ElevatedButton(
                              onPressed: () {
                                var whatsappUrl =
                                    "whatsapp://send?phone=${widget.product.productHolderNumber}";
                                // "whatsapp://send?phone=${num.parse(context.read<AuthProvider>().phoneController.text)}";
                                launchUrl(Uri.parse(whatsappUrl));
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                side: const BorderSide(
                                  color: Color.fromRGBO(124, 144, 112, 1),
                                ),
                                fixedSize: Size(150.w, 56.h),
                              ),
                              child: Text(
                                'تواصل معي',
                                style: TextStyle(
                                  color: const Color.fromRGBO(124, 144, 112, 1),
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          Container(
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                            child: ElevatedButton(
                              onPressed: () {
                                AppRouter.NavigateToWidget(
                                    ConfirmSelling(product: widget.product));
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    const Color.fromRGBO(124, 144, 112, 1),
                                fixedSize: Size(98.w, 56.h),
                              ),
                              child: Text(
                                'شراء',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
