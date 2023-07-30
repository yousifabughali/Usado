import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:usado_admin/app_router/router.dart';
import 'package:usado_admin/model/product.dart';
import 'package:usado_admin/provider/firestore_provider.dart';
import 'package:usado_admin/widgets/product_details.dart';


class ProductRequestScreen extends StatefulWidget {
  Product product;
   ProductRequestScreen({required this.product,Key? key}) : super(key: key);

  @override
  State<ProductRequestScreen> createState() => _ProductRequestScreenState();
}

class _ProductRequestScreenState extends State<ProductRequestScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<FireStoreProvider>(
      builder: (context,provider,child) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              automaticallyImplyLeading: true,
              backgroundColor: Color.fromRGBO(124, 144, 112, 1),
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.favorite_border),
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
                    padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 40.r,
                              backgroundColor: Colors.grey,
                              backgroundImage: NetworkImage(widget.product.productHolderImage!),

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
                        SizedBox(height: 10.h,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8.r),
                              ),
                              child: ElevatedButton(
                                onPressed: () async {
                                  await provider.deleteRequestedProduct(widget.product);
                                  Navigator.pop(context);

                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.red,
                                  fixedSize: Size(98.w, 56.h),
                                ),
                                child: Text(
                                  'رفض',
                                  style: TextStyle(
                                    color:  Colors.white,
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 10.w,),
                            Container(
                              clipBehavior: Clip.antiAlias,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.r),
                              ),
                              child: ElevatedButton(
                                onPressed: () async {
                                  await provider.addProductToCategory(widget.product);
                                  Navigator.pop(context);
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.green,
                                  fixedSize: Size(98.w, 56.h),
                                ),
                                child: Text(
                                  'قبول',
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
      }
    );
  }
}
