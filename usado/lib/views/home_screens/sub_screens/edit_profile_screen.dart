import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:usado/app_router/router.dart';
import 'package:usado/provider/auth_provider.dart';
import 'package:usado/provider/firestore_provider.dart';
import 'package:usado/views/home_screens/home_screen.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(
      builder: (context,provider,child) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Color.fromRGBO(124, 144, 112, 1),
              automaticallyImplyLeading: true,
              title: Text(
                'تعديل البيانات',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 22.sp,
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () async {
                    await provider.updateUser();
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> HomeScreen()));
                  },
                  child: Text(
                    'حفظ',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontSize: 18.sp,
                    ),
                  ),
                ),
              ],
            ),
            body: Padding(
              padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 16.w),
              child: Column(
                children: [
                  InkWell(
                    onTap: ()async {
                      await provider.selectImage();

                    },
                    child: provider.selectedImage != null
                        ? Container(
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
                          )
                        : InkWell(
                            onTap: () async {
                              await provider.selectImage();
                            },
                            child: Container(
                              height: 100.h,
                              width: 100.h,
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
                          ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Container(
                    width: 395.w,
                    margin: EdgeInsets.symmetric(vertical: 10.h),
                    decoration: BoxDecoration(
                        color: Colors.grey.shade400,
                        borderRadius: BorderRadius.circular(18.r)),
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                'الاسم: ',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 18.sp,
                                ),
                              ),
                              SizedBox(
                                width: 200.w,
                                child: TextFormField(
                                  decoration:
                                      InputDecoration(border: InputBorder.none),
                                  controller:
                                      context.read<AuthProvider>().nameController,
                                  style: TextStyle(
                                    color: Colors.black45,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 18.sp,
                                  ),
                                  onChanged: (value) {
                                    value = context
                                        .read<AuthProvider>()
                                        .nameController
                                        .text;
                                  },
                                ),
                              )
                            ],
                          ),
                          Divider(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                'رقم الهاتف: ',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 18.sp,
                                ),
                              ),
                              SizedBox(
                                width: 200.w,
                                child: TextFormField(
                                  keyboardType: TextInputType.phone,
                                  decoration:
                                      InputDecoration(border: InputBorder.none),
                                  controller:
                                      context.read<AuthProvider>().phoneController,
                                  style: TextStyle(
                                    color: Colors.black45,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 18.sp,
                                  ),
                                  onChanged: (value) {
                                    value = context
                                        .read<AuthProvider>()
                                        .phoneController
                                        .text;
                                  },
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 25.h,
                  ),
                  Container(
                    width: 395.w,
                    decoration: BoxDecoration(
                        color: Colors.grey.shade400,
                        borderRadius: BorderRadius.circular(18.r)),
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                'الموقع',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 18.sp,
                                ),
                              ),
                              Text(
                                'غزة',
                                style: TextStyle(
                                  color: Colors.black45,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18.sp,
                                ),
                              )
                            ],
                          ),
                          Divider(
                            color: Colors.grey,
                            thickness: 1,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                'إظهار الموقع في الصفحة الشخصية',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 18.sp,
                                ),
                              ),
                              Switch(value: true, onChanged: (value) {}),
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
    );
  }
}
