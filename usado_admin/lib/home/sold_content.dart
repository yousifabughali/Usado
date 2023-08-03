import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:usado_admin/model/product.dart';
import 'package:usado_admin/provider/firestore_provider.dart';
import 'package:usado_admin/widgets/order_widget.dart';
import 'package:usado_admin/widgets/sold_widget.dart';

class SoldContent extends StatefulWidget {
   SoldContent({Key? key}) : super(key: key);

  @override
  State<SoldContent> createState() => _SoldContentState();
}

class _SoldContentState extends State<SoldContent> {
  @override
  Widget build(BuildContext context) {
    return Consumer<FireStoreProvider>(
      builder: (context,provider,child) {
        return SafeArea(
          child: Column(
            children: [
              Container(
                height: 85.h,
                width: double.infinity,
                color: Color.fromRGBO(124, 144, 112, 1),
                child: Center(child: Text('المبيعات والتسليم',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w700,fontSize: 22.sp),)),
              ),
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: provider.soldProduct.length,
                  itemBuilder: (context, index) {
                    return OrderSoldWidget(product: provider.soldProduct[index],);
                  },
                ),
              ),
            ],
          ),
        );
      }
    );
  }
}
