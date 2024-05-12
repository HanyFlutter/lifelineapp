


import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:lifeline/modules/login_screen/login_screen.dart';
import 'package:lifeline/shared/constants.dart';



List<PageViewModel> listPagesViewModel =[
  PageViewModel(
    title: 'فوائد التبرع بالدم', bodyWidget: Center(child:Card(child: Image.asset('assets/blood_donation_info/ben0.png'),)),),
  PageViewModel(
    title: 'فوائد التبرع بالدم', bodyWidget: Center(child:Card(child: Image.asset('assets/blood_donation_info/ben1.png'),)),),
  PageViewModel(
    title: 'فوائد التبرع بالدم', bodyWidget: Center(child:Card(child: Image.asset('assets/blood_donation_info/ben2.png'),)),),
  PageViewModel(
    title: 'فوائد التبرع بالدم', bodyWidget: Center(child:Card(child: Image.asset('assets/blood_donation_info/ben3.png'),)),),
  PageViewModel(
    title: 'من يمكنه التبرع بالدم ؟', bodyWidget: Center(child:Card(child: Image.asset('assets/blood_donation_info/who0.png'),)),),

  PageViewModel(
    title: 'من يمكنه التبرع بالدم ؟', bodyWidget: Center(child:Card(child: Image.asset('assets/blood_donation_info/who1.png'),)),),
  PageViewModel(
    title: 'من يمكنه التبرع بالدم ؟', bodyWidget: Center(child:Card(child: Image.asset('assets/blood_donation_info/who2.png'),)),),
  PageViewModel(
    title: 'التبرع لأول مرة', bodyWidget: Center(child:Card(child: Image.asset('assets/blood_donation_info/1st.png'),)),),
  PageViewModel(
    title: 'قواعد المنح بين فضائل الدم', bodyWidget: Center(child:Card(child: Image.asset('assets/blood_donation_info/BloodTypes.jpg'),)),),




];

class IntroScreen extends StatefulWidget {
@override
State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
// 1. Define a `GlobalKey` as part of the parent widget's state
final _introKey = GlobalKey<IntroductionScreenState>();
String _status = 'انتظار ...';

@override
Widget build(BuildContext context) {
return IntroductionScreen(
// 2. Pass that key to the `IntroductionScreen` `key` param
key: _introKey,
pages: listPagesViewModel,
showNextButton: true,
showDoneButton: true,
  showSkipButton: true,
  done: Text('تسجيل الدخول',style: TextStyle(fontSize: 16,color: Colors.blue),),
  next: Text('التالي',style: TextStyle(fontSize: 16,color: Colors.blue),),
  skip: Text('<< تخطى',style: TextStyle(fontSize: 16,color: Colors.blue),),
  dotsDecorator: DotsDecorator(
  size: const Size.square(10.0),
  activeSize: const Size(30.0, 10.0),
  activeColor: Theme.of(context).colorScheme.secondary,
  color: Colors.black26,
  spacing: const EdgeInsets.symmetric(horizontal: 0.5),
  activeShape: RoundedRectangleBorder(
  borderRadius: BorderRadius.circular(25.0)

 ),
  ),
  onDone: (){
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (ctx)=>LoginScreen()));

  },
  onSkip: (){
  Navigator.pushReplacement(context, MaterialPageRoute(builder: (ctx)=>LoginScreen()));
  },
  );
}
}