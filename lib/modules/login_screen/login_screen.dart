import 'package:flutter/material.dart';
import 'package:lifeline/shared//constants.dart';
import 'package:lifeline/shared/components/login_button.dart';
import 'package:lifeline/shared/components/password_text.dart';
import 'package:lifeline/shared/components/select_account_type.dart';
import 'package:lifeline/shared/components/tail_of_login_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key, required this.title});
  final String title;
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  void toggleEye() {
    setState(() {
      showPasswordLogin = !showPasswordLogin;
    });
  }
  double opacityValue =0;
  Future timer () async{
    Future.delayed(Duration(milliseconds: 100),(){
      setState(() {
        opacityValue=1;
      });
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    timer();
  }
  Widget SelectAccountType2 (){
    return Row (children: [
      Text(' الدخول كحساب ',style: TextStyle(fontSize: 14),),
      Center(
        child: DropdownButton<String>(
          value: selectedItemJoinAsLogin,// Default value
          onChanged: (String? newValue) {
            setState(() {
              selectedItemJoinAsLogin=newValue!;

            });
            // Handle dropdown item selection
            print(selectedItemJoinAsLogin);
          },
          items: select_list_join_as_in_login.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value,style: TextStyle(fontSize: 14,color: Colors.blue),),
            );
          }).toList(),
        ),


      )],);
  }
  @override
  Widget build(BuildContext context) {

    return Center(
      child: SingleChildScrollView(
        child:  Padding(
          padding: const EdgeInsets.all(15.0),
          child: Form(
            key: formKeyLogin,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/logo.png',
                  width: screenWidth(context) / 2,
                  height: screenWidth(context) / 2,
                ),
                SizedBox(
                  height: 10,
                ),
                SelectAccountType2(),
                const SizedBox(
                  height: 10,
                ),
               TextFormField(
                 validator: (String? val) {
                   return validateEmail(val!);
                 },
                 keyboardType: TextInputType.emailAddress,
                 controller: emailAddressLogin,
                 decoration: InputDecoration(
                   labelText: 'البريد الإلكتروني',
                   border: OutlineInputBorder(
                       borderRadius: BorderRadius.circular(20)),
                 ),
               ),
                 SizedBox(
                   height: 20,
                 ),
                 passwordLoginText(
                     controller: passwordLogin,
                     showPassword: showPasswordLogin,
                     toggel: toggleEye,
                     labelText: 'كلمة المرور'),
                SizedBox(
                  height: 10,
                ),
                loginButton(width: screenWidth(context) / 2, text: 'دخول',context: context),
                SizedBox(
                  height: 10,
                ),
                tailOfLoginScreen(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
