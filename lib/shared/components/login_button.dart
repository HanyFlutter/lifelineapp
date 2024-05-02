
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lifeline/layout/home_screen/blood_bank_home_screen/blood_bank_home_screen.dart';
import 'package:lifeline/layout/home_screen/hospital_home_screen/hospital_home_screen.dart';

import '../../layout/home_screen/user_home_screen/user_home_screen.dart';
import '../../shared//constants.dart';

Widget loginButton({required String text,required double width,required BuildContext context}){

  return  Container(
    width: width,
    child: ElevatedButton(

      onPressed: (){
        if(formKeyLogin.currentState!.validate()){
          if(selectedItemJoinAsLogin=='شخصي'){
            Navigator.of(context).pushReplacement(MaterialPageRoute(builder:(context)=>UserHomeScreen(),));}
          else  if(selectedItemJoinAsLogin=='بنك دم'){
            Navigator.of(context).pushReplacement(MaterialPageRoute(builder:(context)=>BloodBankHomeScreen(),));}
          else{Navigator.of(context).pushReplacement(MaterialPageRoute(builder:(context)=>HospitalHomeScreen(),));}
        }

      },child: Text(text,style: TextStyle(fontSize: 20.0),),),
  );
}
Widget registerButton({required String text,required double width,required BuildContext context}){

  return  Container(
    width: width,
    child: ElevatedButton(

      onPressed: (){

        if(formKeyRegister.currentState!.validate()){
          if(selectedItemJoinAsRegistration=='شخصي'){
          Navigator.of(context).pushReplacement(MaterialPageRoute(builder:(context)=>UserHomeScreen(),));}

          else{Navigator.of(context).pushReplacement(MaterialPageRoute(builder:(context)=>HospitalHomeScreen(),));}

        }
      },child: Text(text,style: TextStyle(fontSize: 20.0),),),
  );
}