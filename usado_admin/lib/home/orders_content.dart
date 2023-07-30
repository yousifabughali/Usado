import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:usado_admin/provider/firestore_provider.dart';
import 'package:usado_admin/widgets/order_widget.dart';

class OrderContent extends StatefulWidget {
  const OrderContent({Key? key}) : super(key: key);

  @override
  State<OrderContent> createState() => _OrderContentState();
}

class _OrderContentState extends State<OrderContent> {
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
                child: Center(child: Text('الطلبات',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w700,fontSize: 22.sp),)),
              ),
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                   itemCount: provider.requests.length,
                    itemBuilder: (context, index) {
                      return OrderWidget(product: provider.requests[index],);
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
