import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart' as dt;
import 'package:provider/provider.dart';
import 'package:usado/model/product.dart';
import 'package:usado/provider/auth_provider.dart';
import 'package:usado/provider/firestore_provider.dart';
import 'package:usado/widgets/product_details.dart';

import '../../../widgets/comment.dart';

class SecondAuctionScreen extends StatefulWidget {
  Product product;

  SecondAuctionScreen({required this.product, Key? key}) : super(key: key);

  @override
  State<SecondAuctionScreen> createState() => _SecondAuctionScreenState();
}

class _SecondAuctionScreenState extends State<SecondAuctionScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer2<FireStoreProvider, AuthProvider>(
        builder: (context, provider, provider2, child) {
          return Directionality(
            textDirection: TextDirection.rtl,
            child: Scaffold(
              // resizeToAvoidBottomInset: false,
              backgroundColor: Colors.white,
              appBar: AppBar(
                automaticallyImplyLeading: true,
                backgroundColor: Color.fromRGBO(124, 144, 112, 1),
                actions: [
                  IconButton(onPressed: () {}, icon: Icon(Icons.ios_share)),
                  IconButton(
                      onPressed: () {}, icon: Icon(Icons.favorite_border)),
                ],
              ),
              body: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 341.h,
                      width: double.infinity,
                      child: Image.network(widget.product.image, fit: BoxFit.cover),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 12.w, vertical: 10.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'المزايدات المطروحة: ',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                              fontSize: 18.sp,
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery
                                .of(context)
                                .size
                                .height / 4,
                            child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: provider.bids.length,
                              itemBuilder: (context, index) {
                                return Comment(bid: provider.bids[index]);
                              },
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom,),
                            child: Row(
                              children: [
                                Container(
                                  width: 328.w,
                                  decoration: BoxDecoration(
                                    color: Colors.grey.shade300,
                                    borderRadius: BorderRadius.circular(18.r),
                                  ),
                                  child: TextFormField(
                                    controller: provider.commentController,
                                    validator: provider.requiredValidator,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(18.r),
                                      ),
                                      label: Text(
                                        'أضف سعر',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 16.sp,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 15.w,
                                ),
                                InkWell(
                                  onTap: () {
                                    provider.addNewComment(
                                      widget.product, provider2.nameController.text,);
                                  },
                                  child: Container(
                                    height: 60.h,
                                    width: 60.w,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Color.fromRGBO(124, 144, 112, 1),
                                    ),
                                    child: Center(
                                      child: SvgPicture.asset('assets/icons/send.svg'),
                                    ),
                                  ),
                                ),
                              ],
                            ),
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
