import 'package:flutter/material.dart';

////////////////////////////////
/*
 validation functions
*/
String? validateEmail(String value) {
  String pattern = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
  RegExp regex = RegExp(pattern);
  if (value.isEmpty) {
    return 'حقل البريد الالكتروني فارغ';
  }
  if (!regex.hasMatch(value)) {
    return 'هذا ليس بريد الكتروني صحيح';
  }
  return null;
}
bool validatePassword(String password) {
  // Regular expressions for password validation
  RegExp upperCaseRegex = RegExp(r'[A-Z]');
  RegExp lowerCaseRegex = RegExp(r'[a-z]');
  RegExp digitRegex = RegExp(r'[0-9]');
  RegExp specialCharRegex = RegExp(r'[!@#$%^&*()_+=\[\]{};:"\\|,.<>?/]');

  // Checking length
  if (password.length < 8 || password.length > 20) {
    return false;
  }

  if (!upperCaseRegex.hasMatch(password)) {
    return false;
  }

  if (!lowerCaseRegex.hasMatch(password)) {
    return false;
  }

  if (!digitRegex.hasMatch(password)) {
    return false;
  }

  if (!specialCharRegex.hasMatch(password)) {
    return false;
  }
  return true;
}
bool validateEgyptianPhoneNumber(String phoneNumber) {
  // Regular expression for Egyptian phone numbers starting with 10, 11, 12, or 15 and having exactly 10 digits
  RegExp regex = RegExp(r"^(10|11|12|15|010|011|012|015)\d{8}$");

  return regex.hasMatch(phoneNumber);
}
String? validateName(String value) {
  RegExp name = RegExp(r'^[a-zA-Z\u0600-\u06FF\s]+$');
  if (value.isEmpty) {
    return 'خانة الاسم مطلوبة ';
  }
  if (!name.hasMatch(value)) {
    return 'اسم غير صالح';
  }

  return null;
}

/////////////////////////////////////
/*
 selected listed and items
*/
List<String> select_list_join_as_in_registration = [ 'مستشفى', 'شخصي'];
List<String> select_list_join_as_in_login = ['بنك دم', 'مستشفى', 'شخصي'];
String selectedItemJoinAsLogin = select_list_join_as_in_login[2];
String selectedItemJoinAsRegistration = select_list_join_as_in_registration[1];
List<String> genderMenu = ['ذكر', 'أنثي'];
String selectedGenderItem = genderMenu[0];
List<String> bloodTypeMenu = ['O−', 'O+', 'A-', 'A+', 'B-', 'B+', 'AB-', 'AB+'];
String selectedBloodTypeMenu = bloodTypeMenu[0];
Map<String, List<String>> cityList = {
  "الإسكندرية": ["الإسكندرية"],
  "أسوان": ["أسوان", "أبو سمبل", "كوم أمبو"],
  "أسيوط": ["أسيوط", "ديروط"],
  "البحيرة": ["دمنهور", "رشيد"],
  "بني سويف": ["بني سويف", "الواسطى"],
  "القاهرة": ["القاهرة", "الجيزة", "شبرا الخيمة"],
  "الدقهلية": ["المنصورة", "ميت غمر"],
  "دمياط": ["دمياط"],
  "الفيوم": ["الفيوم", "طامية"],
  "الغربية": ["طنطا", "كفر الزيات"],
  "الجيزة": ["الجيزة", "مدينة 6 أكتوبر"],
  "الإسماعيلية": ["الإسماعيلية"],
  "كفر الشيخ": ["كفر الشيخ"],
  "الأقصر": ["الأقصر", "إسنا"],
  "مطروح": ["مرسى مطروح"],
  "المنيا": ["المنيا", "بني مزار"],
  "المنوفية": ["شبين الكوم"],
  "الوادي الجديد": ["الخارجة", "الداخلة"],
  "شمال سيناء": ["العريش"],
  "بورسعيد": ["بورسعيد"],
  "القليوبية": ["بنها"],
  "قنا": ["قنا", "نجع حمادي"],
  "البحر الأحمر": ["الغردقة", "القصير"],
  "الشرقية": ["الزقازيق"],
  "سوهاج": ["سوهاج", "جرجا"],
  "جنوب سيناء": ["شرم الشيخ", "دهب"],
  "السويس": ["السويس"]
};
String selectedGoverMenu = egyptGovernorates[0];
String selectedCity = cityList[selectedGoverMenu]![0];
List<String> egyptGovernorates = [
  'الإسكندرية',
  'الإسماعيلية',
  'أسوان',
  'أسيوط',
  'الأقصر',
  'البحر الأحمر',
  'البحيرة',
  'بني سويف',
  'بورسعيد',
  'جنوب سيناء',
  'الدقهلية',
  'دمياط',
  'الفيوم',
  'الغربية',
  'القاهرة',
  'القليوبية',
  'قنا',
  'كفر الشيخ',
  'مطروح',
  'المنوفية',
  'المنيا',
  'الوادي الجديد',
  'شمال سيناء',
  'سوهاج',
  'السويس'
];
////////////////////////
/*
to detect the screen size
*/
double screenWidth(context) => MediaQuery.of(context).size.width;
double screenHeight(context) => MediaQuery.of(context).size.height;

/////////////////////////////////
/*
global keys const
*/
final formKeyRegister = GlobalKey<FormState>();
final formKeyLogin = GlobalKey<FormState>();
/////////////////////////////////////////////////////
/*
text controller
*/
TextEditingController phoneNumberRegistration = TextEditingController();
TextEditingController passwordRegistration = TextEditingController();
TextEditingController rewritePasswordRegistration = TextEditingController();
TextEditingController firstNameRegistration = TextEditingController();
TextEditingController lastNameRegistration = TextEditingController();
TextEditingController emailAddressRegistration = TextEditingController();
TextEditingController birthDayRegistration = TextEditingController();
TextEditingController emailAddressLogin = TextEditingController();
TextEditingController passwordLogin = TextEditingController();
/////////////////////////
/*
to control show or hidden password text
*/
bool showPasswordRegistration = true;
bool showPasswordLogin = true;

////////////////////////
/*
date picker constants
*/
Future showDatePickerFun(BuildContext context) async {
  final DateTime? picked = await selectDate(context);
  if (picked != null) {
    print('Selected date: $picked');
    day = picked.day;
    month = picked.month;
    year = picked.year;
    birthDayRegistration.text = 'يوم : $day شهر : $month سنة : $year';
  }
}
Future<DateTime?> selectDate(BuildContext context) async {
  final DateTime? picked = await showDatePicker(
    context: context,
    initialDate: DateTime(2006),
    firstDate: DateTime(1900),
    lastDate: DateTime(2006),
  );
  return picked;
}
int day = 0;
int month = 0;
int year = 0;


