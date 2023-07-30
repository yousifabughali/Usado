import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:usado_admin/app_router/router.dart';
import 'package:usado_admin/provider/firestore_provider.dart';

class AddNewCategoryWidget extends StatefulWidget {
  const AddNewCategoryWidget({Key? key}) : super(key: key);

  @override
  State<AddNewCategoryWidget> createState() => _AddNewCategoryWidgetState();
}

class _AddNewCategoryWidgetState extends State<AddNewCategoryWidget> {
  bool addCategory = true;

  @override
  Widget build(BuildContext context) {
    return Consumer<FireStoreProvider>(builder: (context, provider, child) {
      return Directionality(
        textDirection: TextDirection.rtl,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
          child: Form(
            key: provider.addNewCategoryKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'أضف تصنيف',
                      style: TextStyle(
                        color: Color.fromRGBO(36, 36, 36, 0.5),
                        fontWeight: FontWeight.w500,
                        fontSize: 14.sp,
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          elevation: 0,
                          backgroundColor: Color.fromRGBO(124, 144, 112, 0.97),
                          fixedSize: Size(72.w, 32.h),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.r))),
                      onPressed: addCategory
                          ? () async {
                              setState(() {
                                addCategory = false;
                              });
                              await provider.addNewCategory();
                              setState(() {
                                addCategory = true;
                              });
                            }
                          : null,
                      child: Text(
                        'إضافة',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 14.sp,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5.h,
                ),
                InkWell(
                  onTap: () {},
                  child: provider.selectedImage == null
                      ? InkWell(
                          onTap: () async {
                            await provider.selectImage();
                          },
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
                      : Container(
                          height: 60.h,
                          width: 60.h,
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
                    controller: provider.categoryNameController,
                    validator: provider.requiredValidator,
                    decoration: InputDecoration(
                      label: Text('اسم الفئة'),
                      hintText: 'أضف اسم الفئة',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.r),
                        borderSide:
                            BorderSide(style: BorderStyle.solid, width: 1.w),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
    ;
  }
}
