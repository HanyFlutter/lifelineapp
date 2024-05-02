import 'package:flutter/material.dart';
import 'package:lifeline/modules/login_screen/login_screen.dart';
import 'package:lifeline/network/local_database.dart';
import 'package:lifeline/shared/components/app_bar.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'LifeLine',
      theme: ThemeData(
        fontFamily: 'beINBlack',
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home:  MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
@override
  void initState() {
    super.initState();
    openMyDatabase().then((value) => print(value)).catchError((val){print('the error is ${val.toString()}');});
  }

 @override
  Widget build(BuildContext context) {


    return Directionality(
      textDirection:  TextDirection.rtl,

      child: Scaffold(
        appBar: appBarWidget(title: 'تسجيل الدخول'),
        body:LoginScreen(title: 'LifeLine'),



        ),
      );

  }
}
