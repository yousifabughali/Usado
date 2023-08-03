import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:usado/app_router/router.dart';
import 'package:usado/model/Category.dart';
import 'package:usado/model/user.dart';
import 'package:usado/provider/auth_provider.dart';
import 'package:usado/provider/firestore_provider.dart';

class AddProduct extends StatefulWidget {
  AddProduct({Key? key}) : super(key: key);

  @override
  State<AddProduct> createState() => _AddProductState();
}

enum TypeOfProcess { sell, bid }

class _AddProductState extends State<AddProduct> {
  TypeOfProcess? selected = TypeOfProcess.sell;
   String? selectedCategory;
  String selectedColor = 'أسود';

  @override
  void initState() {
    // TODO: implement initState
    selectedCategory= context.read<FireStoreProvider>().categoriesName.first;
    context.read<FireStoreProvider>().addProduct=true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer2<FireStoreProvider, AuthProvider>(
        builder: (context, provider, provider2, child) {
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
                onPressed: provider.addProduct
                    ? () async {
                        setState(() {
                          provider.addProduct = false;
                        });
                        await provider.addNewProductToRequested(
                            selectedCategory!,
                            selected.toString(),
                            provider2.nameController.text,
                            provider2.userImage ?? '',
                            provider2.phoneController.text);
                      }
                    : null,
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
                padding: EdgeInsets.symmetric(horizontal: 50.w, vertical: 20.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Text(
                        'أضف صورة للمنتج',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                          fontSize: 18.sp,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    InkWell(
                      onTap: () async {
                        await provider.selectImage();
                        provider.value='';
                      },
                      child: provider.selectedImage == null
                          ? Center(
                              child: Container(
                                height: 80.h,
                                width: 80.h,
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
                              ),
                            )
                          : Center(
                              child: Container(
                                height: 80.h,
                                width: 80.h,
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
                    ),
                    Text(
                      provider.value??'',
                      style: TextStyle(
                          color: Colors.red,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Text(
                      'اختر الفئة',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                          fontSize: 18.sp),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(15.r),
                      ),
                      child: SizedBox(
                        width: 335.w,
                        child: DropdownButton<String>(
                          isExpanded: true,
                          elevation: 0,
                          padding: EdgeInsets.only(right: 20.w),
                          value: selectedCategory,
                          underline: Container(),
                          onChanged: (newValue) {
                            setState(() {
                              selectedCategory = newValue;
                            });
                          },
                          items: provider.categoriesName.map((e) {
                            return DropdownMenuItem<String>(
                              alignment: Alignment.centerRight,
                              value: e,
                              child: Text(e),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Text(
                      'أضف اسم المنتج',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                          fontSize: 18.sp),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Container(
                      width: 335.w,
                      height: 80.h,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(15.r),
                      ),
                      child: TextFormField(
                        controller: provider.productNameController,
                        validator: provider.requiredValidator,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.r),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Text(
                      'مدة استخدام المنتج',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                          fontSize: 18.sp),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Container(
                      width: 335.w,
                      height: 80.h,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(15.r),
                      ),
                      child: TextFormField(
                        controller: provider.productUsedTimeController,
                        validator: provider.requiredValidator,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.r),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Text(
                      'اختر لون المنتج',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                          fontSize: 18.sp),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    SizedBox(
                      width: 325.w,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(15.r),
                        ),
                        child: DropdownButton<String>(
                          isExpanded: true,
                          padding: EdgeInsets.only(right: 20.w),
                          elevation: 0,
                          underline: Container(),
                          value: selectedColor,
                          onChanged: (newValue) {
                            setState(() {
                              selectedColor = newValue!;
                              provider.productColorController.text = newValue!;
                            });
                          },
                          items: provider.colors.map((e) {
                            return DropdownMenuItem<String>(
                              alignment: Alignment.centerRight,
                              value: e,
                              child: Text(e),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Text(
                      'نوع المنتج',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                          fontSize: 18.sp),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Row(
                      children: [
                        InkWell(
                          onTap: () {
                            setState(() {
                              selected = TypeOfProcess.sell;
                            });
                          },
                          child: Container(
                            width: 50.w,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                  color: selected == TypeOfProcess.sell
                                      ? const Color.fromRGBO(124, 144, 112, 1)
                                      : Colors.grey,
                                  width: 4.w),
                            ),
                            child: Center(
                              child: Text(
                                'بيع',
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w600,
                                  color: const Color.fromRGBO(36, 36, 36, 1),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 20.w,
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              selected = TypeOfProcess.bid;
                            });
                          },
                          child: Container(
                            width: 70.w,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(
                                    color: selected == TypeOfProcess.bid
                                        ? Color.fromRGBO(124, 144, 112, 1)
                                        : Colors.grey,
                                    width: 4.w)),
                            child: Center(
                              child: Text(
                                'مزايدة',
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'Poppins',
                                  color: const Color.fromRGBO(36, 36, 36, 1),
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
                    Text(
                      selected == TypeOfProcess.sell
                          ? 'أضف سعر المنتج'
                          : 'يبدأ سعر المزايدة من:',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                          fontSize: 18.sp),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Container(
                      width: 335.w,
                      height: 80.h,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(15.r),
                      ),
                      child: TextFormField(
                        controller: provider.productPriceController,
                        validator: provider.requiredValidator,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.r),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}
