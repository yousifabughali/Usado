import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CommonQuestionScreen extends StatefulWidget {
  const CommonQuestionScreen({Key? key}) : super(key: key);

  @override
  State<CommonQuestionScreen> createState() => _CommonQuestionScreenState();
}

class _CommonQuestionScreenState extends State<CommonQuestionScreen> {
  bool expanded = false;
  bool expanded2 = false;
  bool expanded3 = false;
  bool expanded4 = false;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          automaticallyImplyLeading: true,
          backgroundColor: Colors.white,
          iconTheme: const IconThemeData(color: Colors.black),
          elevation: 0,
          title: Text(
            'الأسئلة الشائعة',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w600,
              fontSize: 24.sp,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(top: 40.h, right: 20.w, left: 20.w,bottom: 40.h),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.r),
                    color: Colors.grey.withOpacity(0.2),
                  ),
                  child: ExpansionTile(
                    onExpansionChanged: (value) {
                      setState(() {
                        expanded = value;
                      });
                    },
                    trailing: Icon(
                      expanded
                          ? Icons.keyboard_arrow_up
                          : Icons.keyboard_arrow_down,
                      color: Colors.black,
                    ),
                    title: Text(
                      'ما هو تطبيق Usado ؟',
                      style: TextStyle(color: Colors.black),
                    ),
                    children: <Widget>[
                      ListTile(
                        title: Text(
                            'تطبيق Usado هو تطبيق تجاري يمثل سوق محلي آمن وسهل الاستخدام لبيع وشراء المنتجات المستعملة كالإلكترونيات والكهربائيات والأثاث والهواتف والملابس وغيرها الكثير من المستلزمات، بالإضافة إلى الخدمات.'),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 22.h,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.r),
                    color: Colors.grey.withOpacity(0.2),
                  ),
                  child: ExpansionTile(
                    onExpansionChanged: (value) {
                      setState(() {
                        expanded2 = value;
                      });
                    },
                    trailing: Icon(
                      expanded2
                          ? Icons.keyboard_arrow_up
                          : Icons.keyboard_arrow_down,
                      color: Colors.black,
                    ),
                    title: Text(
                      'كيفية نشر وبيع منتج؟',
                      style: TextStyle(color: Colors.black),
                    ),
                    children: <Widget>[
                      ListTile(
                        title: Text(
                            'بعد الضغط على زر إضافة منتج الموجود في الصفجة الرئيسية للتطبيق، تقوم بتعبئة فورم يحتوي على تفاصيل المنتج وفق شروط معينة، تُرسل إلى المدير ثم يتم إعلامك بقبول النشر أو رفضه.'),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 22.h,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.r),
                    color: Colors.grey.withOpacity(0.2),
                  ),
                  child: ExpansionTile(
                    onExpansionChanged: (value) {
                      setState(() {
                        expanded3 = value;
                      });
                    },
                    trailing: Icon(
                      expanded3
                          ? Icons.keyboard_arrow_up
                          : Icons.keyboard_arrow_down,
                      color: Colors.black,
                    ),
                    title: Text(
                      'كيفية طلب وشراء منتج؟',
                      style: TextStyle(color: Colors.black),
                    ),
                    children: <Widget>[
                      ListTile(
                        title: Text(
                            'بعد تصفحك في التطبيق واختيارك لمنتج معين ثم الضغط على زر الشراء، يظهر لك فورم تقوم بتعبئته لبيان مكان الإقامة وكيفية التواصل معك وتوصيل المنتج إليك، ثم يُرسل إلى المدير فيتم التواصل معك لاحقاً وايصال المنتج إليك عن طريق شركة توصيل يتم التعامل معها من خلال التطبيق، ويتم الدفع نقداً.'),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 22.h,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.r),
                    color: Colors.grey.withOpacity(0.2),
                  ),
                  child: ExpansionTile(
                    onExpansionChanged: (value) {
                      setState(() {
                        expanded4 = value;
                      });
                    },
                    trailing: Icon(
                      expanded4
                          ? Icons.keyboard_arrow_up
                          : Icons.keyboard_arrow_down,
                      color: Colors.black,
                    ),
                    title: Text(
                      ' كيف يتم الدفع؟',
                      style: TextStyle(color: Colors.black),
                    ),
                    children: <Widget>[
                      ListTile(
                        title: Text(
                            'بعد تصفحك في التطبيق واختيارك لمنتج معين ثم الضغط على زر الشراء، يظهر لك فورم تقوم بتعبئته لبيان مكان الإقامة وكيفية التواصل معك وتوصيل المنتج إليك، ثم يُرسل إلى المدير فيتم التواصل معك لاحقاً وايصال المنتج إليك عن طريق شركة توصيل يتم التعامل معها من خلال التطبيق، ويتم الدفع نقداً.'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
