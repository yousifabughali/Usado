import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:usado/app_router/router.dart';
import 'package:usado/model/product.dart';
import 'package:usado/provider/firestore_provider.dart';
import 'package:usado/views/home_screens/home_screen.dart';
import 'package:usado/widgets/custom_widget_dialoge.dart';

import '../../../../provider/auth_provider.dart';

class ConfirmSelling extends StatefulWidget {
  Product product;

  ConfirmSelling({required this.product, Key? key}) : super(key: key);

  @override
  State<ConfirmSelling> createState() => _ConfirmSellingState();
}

class _ConfirmSellingState extends State<ConfirmSelling> {
  late bool liked;

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
              onPressed: () {
                setState(() {
                  context.read<FireStoreProvider>().favourite.map((e) =>
                      e.id == widget.product ? liked = true : liked = false);
                  if (liked) {
                    context
                        .read<FireStoreProvider>()
                        .addNewFavorite(widget.product);
                  } else {
                    context
                        .read<FireStoreProvider>()
                        .removeFromFavorite(widget.product);
                  }
                });
              },
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
            crossAxisAlignment: CrossAxisAlignment.start,
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
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 5.h),
                child: Form(
                  key: context.read<FireStoreProvider>().sellProductKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'يرجى تعبئة معلومات لاستلام المنتج:',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                            fontSize: 22.sp),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SizedBox(
                            width: 188.w,
                            child: TextFormField(
                              validator: context
                                  .read<FireStoreProvider>()
                                  .requiredValidator,
                              decoration: InputDecoration(
                                focusColor:
                                    const Color.fromRGBO(124, 144, 112, 1),
                                label: Text(
                                  'الإسم الأول',
                                  style: TextStyle(
                                    color:
                                        const Color.fromRGBO(124, 144, 112, 1),
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8.r),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8.r),
                                  borderSide: const BorderSide(
                                    color: Color.fromRGBO(124, 144, 112, 1),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 188.w,
                            child: TextFormField(
                              validator: context
                                  .read<FireStoreProvider>()
                                  .requiredValidator,
                              decoration: InputDecoration(
                                focusColor:
                                    const Color.fromRGBO(124, 144, 112, 1),
                                label: Text(
                                  'الإسم الأخير',
                                  style: TextStyle(
                                    color:
                                        const Color.fromRGBO(124, 144, 112, 1),
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8.r),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8.r),
                                  borderSide: const BorderSide(
                                    color: Color.fromRGBO(124, 144, 112, 1),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      SizedBox(
                        width: 389.w,
                        child: TextFormField(
                          keyboardType: TextInputType.phone,
                          validator: context
                              .read<FireStoreProvider>()
                              .requiredValidator,
                          decoration: InputDecoration(
                            prefixIcon: const Icon(
                              Icons.phone_enabled,
                              color: Colors.black,
                            ),
                            focusColor: const Color.fromRGBO(124, 144, 112, 1),
                            label: Text(
                              'رقم الهاتف',
                              style: TextStyle(
                                color: const Color.fromRGBO(124, 144, 112, 1),
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.r),
                              borderSide: const BorderSide(
                                color: Color.fromRGBO(124, 144, 112, 1),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      SizedBox(
                        width: 389.w,
                        child: TextFormField(
                          validator: context
                              .read<FireStoreProvider>()
                              .requiredValidator,
                          decoration: InputDecoration(
                            prefixIcon: const Icon(
                              Icons.location_on_outlined,
                              color: Colors.black,
                            ),
                            focusColor: const Color.fromRGBO(124, 144, 112, 1),
                            label: Text(
                              'العنوان',
                              style: TextStyle(
                                color: const Color.fromRGBO(124, 144, 112, 1),
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.r),
                              borderSide: const BorderSide(
                                color: Color.fromRGBO(124, 144, 112, 1),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                            child: ElevatedButton(
                              onPressed: () async {
                                widget.product.buyerName = context
                                    .read<AuthProvider>()
                                    .nameController
                                    .text;

                                widget.product.buyerImage =
                                    context.read<AuthProvider>().userImage;
                                await context
                                    .read<FireStoreProvider>()
                                    .addNewToMyRequested(widget.product);
                                await context
                                    .read<FireStoreProvider>()
                                    .deleteProduct(widget.product);
                                await context
                                    .read<FireStoreProvider>()
                                    .addNewSold(widget.product);
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                side: const BorderSide(
                                  color: Color.fromRGBO(124, 144, 112, 1),
                                ),
                                fixedSize: Size(150.w, 56.h),
                              ),
                              child: Text(
                                'إرسال',
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
                                AppRouter.popRouter();
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    const Color.fromRGBO(124, 144, 112, 1),
                                fixedSize: Size(98.w, 56.h),
                              ),
                              child: Text(
                                'إلغاء',
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
