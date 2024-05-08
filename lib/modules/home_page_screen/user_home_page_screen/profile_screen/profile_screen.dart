import 'dart:io';

import 'package:flutter/material.dart';
import 'package:lifeline/modules/login_screen/login_screen.dart';
import 'package:lifeline/network/local/shared_preferences_helper.dart';
import 'package:lifeline/shared/constants.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(child: ElevatedButton(child: Text('تسجيل خروج'),onPressed: ()async{
    await  SharedPreferencesHelper.remove();

       rememberMe=false;
       email='';
       password='';
       userType='';
       Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>LoginScreen()));
    },));
  }
}
