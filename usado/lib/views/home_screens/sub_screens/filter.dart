import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:usado/app_router/router.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({Key? key}) : super(key: key);

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

enum TypeOfProcess { sell, bid }
enum TypeOfProcess1 { add,high,low, view }

class _FilterScreenState extends State<FilterScreen> {
  TypeOfProcess? selected = TypeOfProcess.sell;
  TypeOfProcess1? selected1 = TypeOfProcess1.add;
  SfRangeValues _values = SfRangeValues(100, 7000);
  List<String>  locations = ['خانيونس','الوسطى','غزة','شمال غزة',];
  late String selectedLocation='خانيونس';

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(124, 144, 112, 1),
          title: Text('فلتر'),
          automaticallyImplyLeading: true,
          centerTitle: true,
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 40.w, vertical: 20.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
                                ? Colors.orange
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
                                  ? Colors.orange
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
              Divider(),
              Text(
                'سعر المنتج',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                    fontSize: 18.sp),
              ),
              SizedBox(
                height: 10.h,
              ),
              SizedBox(
                child: SfRangeSlider(
                  min: 100,
                  max: 7000,
                  activeColor: Colors.orange,
                  enableTooltip: true,
                  showLabels: true,
                  values: _values,
                  onChanged: (SfRangeValues value) {
                    setState(() {
                      _values= value;
                    });

                  },
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Divider(),
              Text(
                'ترتيب بواسطة',
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
                        selected1 = TypeOfProcess1.add;
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                            color: selected1 == TypeOfProcess1.add
                                ? Colors.orange
                                : Colors.grey,
                            width: 4.w),
                      ),
                      child: Center(
                        child: Text(
                          'المضاف حديثًا',
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
                    width: 5.w,
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        selected1 = TypeOfProcess1.high;
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                              color: selected1 == TypeOfProcess1.high
                                  ? Colors.orange
                                  : Colors.grey,
                              width: 4.w)),
                      child: Center(
                        child: Text(
                          ' الأعلى سعرًا',
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
                  SizedBox(
                    width: 5.w,
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        selected1 = TypeOfProcess1.low;
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                              color: selected1 == TypeOfProcess1.low
                                  ? Colors.orange
                                  : Colors.grey,
                              width: 4.w)),
                      child: Center(
                        child: Text(
                          'الأقل سعرًا',
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
                  SizedBox(
                    width: 5.w,
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        selected1 = TypeOfProcess1.view;
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                              color: selected1 == TypeOfProcess1.view
                                  ? Colors.orange
                                  : Colors.grey,
                              width: 4.w)),
                      child: Center(
                        child: Text(
                          'المشاهدات',
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
              SizedBox(height: 10.h,),
              Divider(),
              Text('اختر الفئة',style: TextStyle(color: Colors.black,fontWeight: FontWeight.w700,fontSize: 18.sp),),
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
                    value: selectedLocation,
                    underline: Container(),
                    onChanged: (newValue) {
                      setState(() {
                        selectedLocation = newValue!;
                      });
                    },
                    items: locations.map((e) {
                      return DropdownMenuItem<String>(
                        alignment: Alignment.centerRight,
                        value: e,
                        child: Text(e),
                      );
                    }).toList(),
                  ),
                ),
              ),
              SizedBox(height: 10.h,),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: ElevatedButton(
                      onPressed: ()  {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        side: const BorderSide(
                          color: Color.fromRGBO(124, 144, 112, 1),
                        ),
                        fixedSize: Size(98.w, 56.h),
                      ),
                      child: Text(
                        'إلغاء',
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
                        'تعيين',
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
    );
  }
}
