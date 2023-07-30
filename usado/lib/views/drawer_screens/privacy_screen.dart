import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PrivacyScreen extends StatefulWidget {
  const PrivacyScreen({Key? key}) : super(key: key);

  @override
  State<PrivacyScreen> createState() => _PrivacyScreenState();
}

class _PrivacyScreenState extends State<PrivacyScreen> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          automaticallyImplyLeading: true,
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.black),

          elevation: 0,
          title: Text(
            'سياسة الخصوصية',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w600,
              fontSize: 24.sp,
            ),
          ),
        ),
        body: Padding(
          padding:  EdgeInsets.only(top: 16.h,right: 20.w,left: 20.w),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '''يرجى قراءة سياسة الخصوصية هذه بعناية قبل استخدام خدماتنا.باستخدام تطبيق Usado والخدمات ذات الصلة، فإنك تمنح لUsado موافقة صريحة لجمع واستخدام والاحتفاظ بالمعلومات الشخصية الخاصة بك من قبلنا، كما هو موضح في سياسة الخصوصية هذه وشروط الاستخدام الخاصة بنا.
يجوز لتطبيق Usado تغيير سياسة الخصوصية هذه من حين لآخر كما هو موضح أدناه. ننصحك بقراءة هذه السياسة بصورة منتظمة للتأكد من التغييرات. تعتبر أي سياسة خصوصية معدلة سارية المفعول فور نشرها على تطبيقنا.''',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 16.sp,
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  height: 16.h,
                ),
                Text(
                  '1. ما هي البيانات التي نجمعها عنك؟',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 18.sp,
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  height: 1.h,
                ),
                Text(
                  '''
- معلومات التسجيل والحسابات الأخرى: عندما تقوم بالتسجيل لاستخدام منصاتنا، فإنه يجوز لنا أن نجمع المعلومات التالية عنك بناءً على كيفية التسجيل على منصتنا والتي يمكن أن تتضمن رقم الهاتف المحمول والاسم والايميل من بين المعلومات أساسية أخرى.
- البيانات التي نجمعها تلقائياً عند استخدامك لخدماتنا: عندما تتفاعل مع منصتنا أو تستخدم خدماتنا، نقوم تلقائياً بجمع معلومات مختلفة تتضمن، على سبيل المثال لا الحصر، معلومات عن الجهاز ومعلومات الموقع وبيانات السجل وبيانات تصفح الإنترنت وملفات تعريف الارتباط والتقنيات المشابهة.
- البيانات من أطراف ثالثة أو من مصادر متاحة للجمهور: قد نتلقى بيانات شخصية عنك من أطراف ثالثة ومصادر عامة مختلفة.''',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 16.sp,
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  height: 16.h,
                ),
                Text(
                  '2. لماذا نقوم بمعالجة معلوماتك الشخصية؟',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 18.sp,
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  height: 1.h,
                ),
                Text(
                  '''نحن نستخدم بياناتك الشخصية عندما يسمح القانون لنا بذلك. الأكثر شيوعا دون الحصر، سوف نستخدم البيانات التي نحتاج اليها لتنفيذ العقد المزمع إبرامه معكم أو قد تم إبرامه معكم، لتحسين وتخصيص وتقديم خدماتنا و منصاتنا الحالية والقادمة ولنبذل قصارى جهدنا لاكتشاف حالات الغش والاحتيال ولتقديم ميزات الخدمات والمنصة لتقديم خدمة أفضل لكم عن طريق أدوات المساعدة ، والامتثال لالتزام قانوني أو تنظيمي مع السلطات حسب الاقتضاء.''',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 16.sp,
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  height: 16.h,
                ),
                Text(
                  '3. الاتصال والتسويق',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 18.sp,
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  height: 1.h,
                ),
                Text(
                  '''سوف نتواصل معك عن طريق البريد الإلكتروني أو الرسائل القصيرة SMS أو استعمال إشعارات التطبيق فيما يتعلق بخدماتنا أو منصتنا لتأكيد تسجيلك وإبلاغك في حال تم بيع منتجك أو أصبحت إعلاناتك فعالة أو منتهية الصلاحية, والمراسلة بغرض رسائل المعاملات الأخرى المتعلقة بخدماتنا.''',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 16.sp,
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  height: 16.h,
                ),
                Text(
                  '4. مع من نشارك بياناتك؟',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 18.sp,
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  height: 1.h,
                ),
                Text(
                  '''قد نضطر إلى تبادل بياناتكم الشخصية مع الأطراف المبينة أدناه للأغراض المبينة أعلاه.يجوز لنا أن الكشف عن بياناتك الشخصية لسلطات تنفيذ القانون والهيئات التنظيمية والهيئات الحكومية أو العامة والأطراف الثالثة الأخرى ذات الصلة للامتثال لأي متطلبات قانونية أو تنظيمية.''',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 16.sp,
                    color: Colors.black,
                  ),
                ),
                Text(
                  '''يجوز لنا أن نختار بيع أو نقل أو دمج أجزاء من أعمالنا أو أصولنا. وعوضا عن ذلك، يجوز لنا السعي للإستحواذ على أعمال أخرى أو الاندماج معهم. وفي حالة حدوث تغيير لأعمالنا، عندئذ يجوز للمالكين الجدد استخدام بياناتك الشخصية بالطريقة نفسها المنصوص عليها في سياسة الخصوصية هذه.
عند قيامك بنشر إعلان باستخدام خدماتنا، فإنه بإمكانك التصريح عن بعض المعلومات الشخصية والتي من الممكن أن تكون متاحة لمستخدمي Usado. وربما يتضمن ذلك، على سبيل المثال لا الحصر، اسمك وعنوان بريدك الإلكتروني وموقعك ورقم الاتصال بك وصورتك. يرجى ملاحظة أن أي معلومات تقدمها للمستخدمين الآخرين يمكن دائماً مشاركتها مع الآخرين، لذا يرجى ممارسة تقديراتك الخاصة بهذا الصدد.''',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 16.sp,
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  height: 16.h,
                ),
                Text(
                  '5. التغييرات في هذه السياسة',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 18.sp,
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  height: 1.h,
                ),
                Text(
                  '''قد نقوم بتحديث سياسة الخصوصية هذه أو ترقيتها أو تعديلها (جزئيا و /أو كلياً) من حين لآخر لإبقائها مواكبة للمتطلبات القانونية والطريقة التي ندير بها أعمالنا. يرجى مراجعة هذه الصفحة بانتظام للحصول على أحدث إصدار من سياسة الخصوصية. يشير استمرار استخدامك لخدماتنا بعد إجراء تعديل إلى قبولك أي تغييرات.''',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 16.sp,
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  height: 16.h,
                ),
                Text(
                  '6. قبول هذه السياسة',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 18.sp,
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  height: 1.h,
                ),
                Text(
                  '''أنت تقر بأنك قرأت هذه السياسة وتوافق على جميع أحكامها وشروطها. من خلال الوصول إليها واستخدام الأنظمة الأساسية والخدمات، فإنك توافق على الالتزام بهذه السياسة وبشروط الاستخدام. في حالة عدم الموافقة على الالتزام بشروط هذه السياسة وسياساتنا الأخرى، فأنك غير مخول بالوصول إلى واستخدام المنصة والخدمات.''',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 16.sp,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 10.h,),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
