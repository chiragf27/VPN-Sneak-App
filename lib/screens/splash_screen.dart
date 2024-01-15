import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/route_manager.dart';
import 'package:vpn_basic_project/screens/home_screen.dart';
import '../main.dart';
import 'home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState(){
    super.initState();
    Future.delayed(Duration(milliseconds: 2000), () {

      //exit full screen
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);

      //navigate to home
      Get.off(() => HomeScreen());
      //Navigator.pushReplacement(
      //context, MaterialPageRoute(builder: (_) => HomeScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: mq.width *.5,
            left: mq.width * .2,
            width: mq.width * .7,
            child: Image.asset('assets/images/icon.png')),
            //label
            Positioned(
              bottom: mq.height * .15,
              width: mq.width,
              child: Text('BUDDY 🤝', 
              textAlign: TextAlign.center,
              style: TextStyle(color: Theme.of(context).lightText, letterSpacing: 1, fontSize: 20),
              )
              )
            ],
            ),
    );
  }
}