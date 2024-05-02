import 'package:flutter/material.dart';
import 'package:lifeline/shared//constants.dart';
import 'package:lifeline/shared/components/app_bar.dart';
import 'package:lifeline/shared/components/login_button.dart';
import 'package:lifeline/shared/components/password_text.dart';
import 'package:lifeline/shared/components/phone_number_text.dart';
import 'package:lifeline/shared/components/select_account_type.dart';
import 'package:lifeline/shared/components/tail_of_login_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  void toggelEye() {
    setState(() {
      showPasswordRegistration = !showPasswordRegistration;
    });
  }

  Widget SelectGover() {
    return Row(
      children: [
        Text(
          ' المحافظة  ',
          style: TextStyle(fontSize: 14),
        ),
        Center(
          child: DropdownButton<String>(
            value: selectedGoverMenu, // Default value
            onChanged: (String? newValue) {
              setState(() {
                selectedGoverMenu = newValue!;
                selectedCity = cityList[newValue]![0];
                print('new city is $selectedCity');
              });
              // Handle dropdown item selection
              print('Selected: $newValue');
            },
            items:
                egyptGovernorates.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(
                  value,
                  style: TextStyle(fontSize: 14, color: Colors.blue),
                ),
              );
            }).toList(),
          ),
        )
      ],
    );
  }
  Widget SelectCity (){
    return Row (children: [
      Text(' المدينة ',style: TextStyle(fontSize: 14),),
      Center(
        child: DropdownButton<String>(
          value: selectedCity,// Default value

          onChanged: (String? newValue) {
            setState(() {
              selectedCity=newValue!;

            });
            // Handle dropdown item selection
            print('Selected: $newValue');
          },
          items: cityList[selectedGoverMenu]!.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value,style: TextStyle(fontSize: 14,color: Colors.blue),),
            );
          }).toList(),
        ),


      )],);
  }
  Widget SelectAccountType (){
    return Row (children: [
      Text(' التسجيل كحساب ',style: TextStyle(fontSize: 14),),
      Center(
        child: DropdownButton<String>(
          value: selectedItemJoinAsRegistration,// Default value
          onChanged: (String? newValue) {
            setState(() {
              selectedItemJoinAsRegistration=newValue!;

            });
            // Handle dropdown item selection
            print('Selected: $newValue');
          },
          items: select_list_join_as_in_registration.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value,style: TextStyle(fontSize: 14,color: Colors.blue),),
            );
          }).toList(),
        ),


      )],);
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
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: appBarWidget(title: 'تسجيل حساب جديد'),
        body: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: AnimatedOpacity(
                opacity: opacityValue,
                duration: Duration(seconds: 2),
                child: Form(
                  key: formKeyRegister,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SelectAccountType(),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: double.infinity,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                                child: TextFormField(
                              validator: (String? val) => validateName(val!),
                              controller: firstNameRegistration,
                              decoration: InputDecoration(
                                  labelText: 'الاسم الأول',
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20))),
                            )),
                            SizedBox(width: 10),
                            Expanded(
                                child: TextFormField(
                              validator: (String? val) => validateName(val!),
                              controller: lastNameRegistration,
                              decoration: InputDecoration(
                                labelText: 'اللقب',
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20)),
                              ),
                            )),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        validator: (String? val) {
                          if (val!.isEmpty) {
                            return 'خانة تاريخ الميلاد مطلوبة ';
                          }
                        },
                        onTap: () {
                          showDatePickerFun(context);
                        },
                        keyboardType: TextInputType.datetime,
                        controller: birthDayRegistration,
                        decoration: InputDecoration(
                          labelText: 'تاريخ الميلاد',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20)),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Drop(
                              ScreenType: 3,
                            ),
                          ),
                          Expanded(
                              child: Drop(
                            ScreenType: 4,
                          )),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Expanded(child: SelectGover()),
                          Expanded(
                              child: SelectCity()),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        validator: (String? val) {
                          return validateEmail(val!);
                        },
                        keyboardType: TextInputType.emailAddress,
                        controller: emailAddressRegistration,
                        decoration: InputDecoration(
                          labelText: 'البريد الإلكتروني',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20)),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      phoneNumberText(controller: phoneNumberRegistration),
                      SizedBox(
                        height: 20,
                      ),
                      passwordRegistrationText(
                          controller: passwordRegistration,
                          controller2: rewritePasswordRegistration,
                          showPassword: showPasswordRegistration,
                          toggel: toggelEye,
                          labelText: 'كلمة المرور'),
                      SizedBox(
                        height: 20,
                      ),
                      passwordRegistrationText(
                          controller: rewritePasswordRegistration,
                          controller2: passwordRegistration,
                          showPassword: showPasswordRegistration,
                          toggel: toggelEye,
                          labelText: 'أعد كتابة كلمة المرور'),
                      SizedBox(
                        height: 10,
                      ),
                      registerButton(
                          width: screenWidth(context) / 2, text: 'التسجــيل',context: context),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
