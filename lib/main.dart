
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:auth/controler/onboardingcubit/onbordingcubit.dart';
import 'package:auth/core/my_theme.dart';
import 'package:auth/dashboard/view/dashboard_page.dart';
import 'package:auth/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'dashboard/newproduct.dart/view/NewproductPage.dart';

void main()async {
  
  

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    name: "dashboard2-a3fdd",
    
    options: DefaultFirebaseOptions.currentPlatform);
  
    final shared=await SharedPreferences.getInstance() ;
     
  bool onbording=shared.getBool("onbording")??false;
  runApp( MyApp(onbording: onbording,));
  

}
class MyApp extends StatelessWidget {
  MyApp({super.key, required this.onbording});
  final bool onbording;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: MyTheme.instance.light,
      darkTheme:MyTheme.instance.dark ,
      themeMode:ThemeMode.dark ,
      home:dashboard_page() ,

      // onbording?Signin():onbordingpage(),
    );
  }
}
