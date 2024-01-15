import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:vpn_basic_project/screens/splash_screen.dart';
import 'helpers/pref.dart';
import 'screens/home_screen.dart';
import 'screens/splash_screen.dart';

//global object for accessing device screen size
late Size mq;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //for application to be in fullscreen mode
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);

  await Pref.initializeHive();

  //for application to be in portrait orientation only
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]).then((v) {
    runApp(const MyApp());
  });

  
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'VPN Sneak',
      home: SplashScreen(),
      //theme
      theme: ThemeData(
        appBarTheme: AppBarTheme(centerTitle: true, elevation: 3)
      ),

      themeMode: Pref.isDarkMode ? ThemeMode.dark : ThemeMode.light,
      //Dark theme
      darkTheme:
       ThemeData(
        brightness: Brightness.dark,
        appBarTheme: AppBarTheme(centerTitle: true, elevation: 3)
      ),

      debugShowCheckedModeBanner: false,
    );
  }
}

extension AppTheme on ThemeData{
  Color get lightText => Pref.isDarkMode ? Colors.white70 : Colors.black54;
  Color get bottomNav => Pref.isDarkMode ? Colors.white12 : Colors.blue;
  Color get lightColor => Pref.isDarkMode ? Colors.white12 : Colors.blue;
}
