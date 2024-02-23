import 'package:e_commerce/const_variable/colors.dart';
import 'package:e_commerce/screens/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3),(){
      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=>const MainScreen()), (route) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: myBlue,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.light,
          statusBarBrightness: Brightness.light,
          systemNavigationBarColor: myBlue,
          statusBarColor: myBlue,
        ),
      ),
      backgroundColor: myBlue,
      body: Center(
        child: Image.asset('assets/images/white_logo.png'),
      ),
    );
  }
}
