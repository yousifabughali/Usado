import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:usado_admin/app_router/router.dart';
import 'package:usado_admin/home/confirm_selling.dart';
import 'package:usado_admin/widgets/product_details.dart';

import '../model/product.dart';

class SellProductScreen extends StatefulWidget {
  Product product;
   SellProductScreen({required this.product,Key? key}) : super(key: key);

  @override
  State<SellProductScreen> createState() => _SellProductScreenState();
}

class _SellProductScreenState extends State<SellProductScreen> {
  @override
  Widget build(BuildContext context) {
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
                          backgroundImage: NetworkImage(widget.product.productHolderImage==null? 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS23feRa_9kqBNN6ot_FPnc31ALug_Uwf9dVBFtFQHQ&s': widget.product.productHolderImage!),
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
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.r),
                          ),
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              side: const BorderSide(
                                color:  Color.fromRGBO(124, 144, 112, 1),
                              ),
                              fixedSize: Size(150.w, 56.h),
                            ),
                            child: Text(
                              'تواصل معي',
                              style: TextStyle(
                                color:  const Color.fromRGBO(124, 144, 112, 1),
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
                            onPressed: () {
                              AppRouter.NavigateToWidget(ConfirmSelling(product: widget.product,));

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
  }
}
