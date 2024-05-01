import 'package:flutter/material.dart';
import 'package:lifeline/modules/home_page_screen/list_of_screens.dart';
import 'package:lifeline/shared/components/app_bar.dart';

class HospitalHomeScreen extends StatefulWidget {
  const HospitalHomeScreen({super.key});

  @override
  State<HospitalHomeScreen> createState() => _HospitalHomeScreenState();
}

class _HospitalHomeScreenState extends State<HospitalHomeScreen> {
  int indexItem=0;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: appBarWidget(title: 'مستشفى'),

      body: screenList[indexItem],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: indexItem,
        onTap: (index){
          setState(() {
            indexItem=index;
          });
        },
        items: const [


        BottomNavigationBarItem(icon: Icon(Icons.search),label: 'البحث'),
          BottomNavigationBarItem(icon: Icon(Icons.wine_bar),label: 'الأبطال'),
          BottomNavigationBarItem(icon: Icon(Icons.minor_crash_sharp),label: 'الإستغاثات'),
          BottomNavigationBarItem(icon: Icon(Icons.person),label: 'صفحتك'),

      ],),
    );
  }
}
