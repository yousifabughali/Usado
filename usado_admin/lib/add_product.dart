import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:usado_admin/provider/firestore_provider.dart';

import 'model/Category.dart';

class AddProduct extends StatefulWidget {
  Category category;
   AddProduct({required this.category,Key? key}) : super(key: key);

  @override
  State<AddProduct> createState() => _AddProductState();
}

enum TypeOfProcess { sell, bid }

class _AddProductState extends State<AddProduct> {
  TypeOfProcess? selected=TypeOfProcess.sell;

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
              backgroundColor: Color.fromRGBO(124, 144, 112, 0.97),
              centerTitle: true,
              title: Text(
                'أضف مُنتج',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 20.sp,
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () async{
                    await provider.addNewProduct(widget.category,selected.toString());
                  },
                  child: Text(
                    'إضافة',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 20.sp,
                    ),
                  ),
                ),
              ],
            ),
            body: Form(
              key: provider.addNewProductKey,
              child: SingleChildScrollView(
                child: Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 12.w,vertical: 20.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    // mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'أضف صورة للمنتج',
                        style: TextStyle(
                          color: Color.fromRGBO(36, 36, 36, 0.5),
                          fontWeight: FontWeight.w500,
                          fontSize: 14.sp,
                        ),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      InkWell(
                        onTap: () async {
                          await provider.selectImage();
                        },
                        child: provider.selectedImage==null
                            ? Container(
                                height: 120.h,
                                width: 120.h,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color.fromRGBO(217, 217, 217, 0.2),
                                ),
                                child: Center(
                                  child: SvgPicture.asset(
                                    'assets/icons/addPhoto.svg',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              )
                            : Container(
                                height: 120.h,
                                width: 120.h,
                                clipBehavior: Clip.antiAlias,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color.fromRGBO(217, 217, 217, 0.2),
                                ),
                                child: Image(
                                  image: FileImage(
                                    provider.selectedImage!,
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      SizedBox(
                        width: 335.w,
                        child: TextFormField(
                          controller: provider.productNameController,
                          validator: provider.requiredValidator,
                          decoration: InputDecoration(
                            label: Text('اسم المنتج'),
                            hintText: 'أضف اسم المنتج',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12.r),
                              borderSide:
                                  BorderSide(style: BorderStyle.solid, width: 1.w),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      SizedBox(
                        width: 335.w,
                        child: TextFormField(
                          controller: provider.productUsedTimeController,
                          validator: provider.requiredValidator,
                          decoration: InputDecoration(
                            label: Text('مدة استخدام المنتج'),
                            hintText: 'أضف مدة استخدام المنتج',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12.r),
                              borderSide:
                                  BorderSide(style: BorderStyle.solid, width: 1.w),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      SizedBox(
                        width: 335.w,
                        child: TextFormField(
                          controller: provider.productPriceController,
                          validator: provider.requiredValidator,
                          decoration: InputDecoration(
                            label: Text('سعر المنتج'),
                            hintText: 'أضف سعر المنتج',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12.r),
                              borderSide:
                                  BorderSide(style: BorderStyle.solid, width: 1.w),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      SizedBox(
                        width: 335.w,
                        child: TextFormField(
                          controller: provider.productColorController,
                          validator: provider.requiredValidator,
                          decoration: InputDecoration(
                            label: Text('لون المنتج'),
                            hintText: 'أضف لون المنتج',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12.r),
                              borderSide:
                                  BorderSide(style: BorderStyle.solid, width: 1.w),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      ListView(
                        shrinkWrap: true,

                        children: [
                          RadioListTile<TypeOfProcess>(
                            title: Text(
                              'بيع',
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
                                color: const Color.fromRGBO(36, 36, 36, 1),
                              ),
                            ),
                            value: TypeOfProcess.sell,
                            groupValue: selected,
                            onChanged: (value) {
                              setState(() {
                                selected = value;
                                // provider.level = value.toString();
                              });
                            },
                          ),
                          RadioListTile<TypeOfProcess>(
                            title: Text(
                              'مزايدة',
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'Poppins',
                                color: const Color.fromRGBO(36, 36, 36, 1),
                              ),
                            ),
                            value: TypeOfProcess.bid,
                            groupValue: selected,
                            onChanged: (value) {
                              setState(() {
                                selected = value;
                                // provider.level = value.toString();
                              });
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      }
    );
  }
}
