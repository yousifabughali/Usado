import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:usado/provider/firestore_provider.dart';
import 'package:usado/widgets/product_widget.dart';

class RequestedProduct extends StatefulWidget {
  const RequestedProduct({Key? key}) : super(key: key);

  @override
  State<RequestedProduct> createState() => _RequestedProductState();
}

class _RequestedProductState extends State<RequestedProduct> {
  @override
  Widget build(BuildContext context) {
    return Consumer<FireStoreProvider>(
      builder: (context,provider,child) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: const Color.fromRGBO(124, 144, 112, 1),
              automaticallyImplyLeading: true,
              centerTitle: true,
              title: Text(
                'المنتجات التي تم طلبها',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 22.sp,
                ),
              ),
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
                child: GridView.builder(
                  shrinkWrap: true,
                  itemCount: provider.myRequested.length,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    return ProductWidget(product: provider.myRequested[index],);
                  },
                ),
              ),
            ),
          ),
        );
      }
    );
  }
}
