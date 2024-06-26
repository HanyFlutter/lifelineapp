import 'dart:io';

import 'package:flutter/material.dart';
import 'package:lifeline/shared/components/app_bar.dart';

class PolicyScreen extends StatefulWidget {
  const PolicyScreen({super.key});

  @override
  State<PolicyScreen> createState() => _PolicyScreenState();
}

class _PolicyScreenState extends State<PolicyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
appBar: appBarWidget(title: 'سياسة الاستخدام والخصوصية'),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(_policyText,
                textDirection: TextDirection.rtl,
                style: TextStyle(

                    fontSize: 16),),
              SizedBox(height: 20,),

              Row(

                children: [



                  Expanded(child: ElevatedButton(onPressed: (){
                    exit(0);
                  }, child: Text('لا أوافق '))),
                  SizedBox(width: 20,),
                  Expanded(child: ElevatedButton(onPressed: (){
                    Navigator.pop(context);

                  }, child: Text('أوافق على الشروط'))),
                ],),
            ],
          ),
        ),
      ),);
  }
}
String _policyText='''
سياسة الخصوصية والشروط والأحكام

شكرًا لاستخدامكم لتطبيقناLifeLine  لخدمات التبرع بالدم. يرجى قراءة هذه السياسة والشروط بعناية قبل استخدام التطبيق.

1. جمع المعلومات:
نقوم بجمع معلومات شخصية من المستخدمين عند تسجيلهم في التطبيق أو عندما يقومون بالتفاعل معه. تشمل هذه المعلومات الاسم، ورقم الهاتف، وعنوان البريد الإلكتروني، وفصيلة الدم، والعنوان، والموقع الجغرافي (في حال كان التطبيق يحتاج إلى معرفة الموقع لتحديد المستشفيات أو نقاط التبرع القريبة).

2. استخدام المعلومات:
نحن نستخدم المعلومات التي نقوم بجمعها لتحسين خدماتنا وتجربة المستخدم، وكذلك لتوفير ميزات مخصصة للمستخدمين، مثل توجيههم إلى أقرب نقطة تبرع بالدم، وتذكيرهم بالمواعيد المهمة للتبرع.

3. مشاركة المعلومات:
لا نقوم ببيع أو مشاركة معلومات المستخدمين مع أطراف ثالثة بدون موافقتهم، إلا في الحالات التي يقتضي فيها القانون ذلك أو لتقديم خدمات محددة يطلبها المستخدم.

4. الأمان:
نحن نهتم بأمان المعلومات الشخصية للمستخدمين ونتخذ التدابير اللازمة لحمايتها من الوصول غير المصرح به أو الاستخدام أو التغيير أو الكشف.

5. ملفات تعريف الارتباط:
قد نستخدم ملفات تعريف الارتباط وتقنيات تتبع أخرى لتخصيص تجربة المستخدم وتحليل استخدام التطبيق. يمكن للمستخدم تعطيل ملفات تعريف الارتباط في إعدادات التطبيق إذا كان يفضل ذلك.

6. تحديثات السياسة:
قد نقوم بتحديث سياسة الخصوصية والشروط والأحكام بين الحين والآخر، وسنقوم بإشعار المستخدمين بالتغييرات الرئيسية عبر إشعار داخل التطبيق أو عبر البريد الإلكتروني المقدم في الحساب.

7. موافقة المستخدم:
باستخدامك لتطبيقنا، فإنك توافق على شروط وسياسة الخصوصية الواردة هنا.

إذا كان لديك أي أسئلة أو استفسارات حول سياسة الخصوصية والشروط والأحكام الخاصة بنا، يرجى الاتصال بفريق الدعم عبر البريد الإلكتروني: Mothqf.com@gmail.com

آخر تحديث: مارس 2024
''';