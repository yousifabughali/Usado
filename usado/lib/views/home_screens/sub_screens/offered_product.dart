import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:usado/model/product.dart';
import 'package:usado/provider/firestore_provider.dart';
import 'package:usado/widgets/product_widget.dart';

class OfferedProduct extends StatefulWidget {
  const OfferedProduct({Key? key}) : super(key: key);

  @override
  State<OfferedProduct> createState() => _OfferedProductState();
}

class _OfferedProductState extends State<OfferedProduct> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: const Color.fromRGBO(124, 144, 112, 1),
          automaticallyImplyLeading: true,
          centerTitle: true,
          title: Text(
            'المنتجات المعروضة',
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
              itemCount: context.read<FireStoreProvider>().myProducts.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemBuilder: (BuildContext context, int index) {
                return ProductWidget(product: context.read<FireStoreProvider>().myProducts[index],);
              },
            ),
          ),
        ),
      ),
    );
  }
}
