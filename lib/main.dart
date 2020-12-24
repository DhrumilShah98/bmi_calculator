import 'package:bmi_calculator/screens/home_screen.dart';
import 'package:bmi_calculator/screens/result_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  //Set app to only portrait mode
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarColor: const Color.fromRGBO(10, 13, 34, 1),
    systemNavigationBarIconBrightness: Brightness.light
  ));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BMI CALCULATOR',
      theme: ThemeData(
        primaryColor: const Color.fromRGBO(10, 13, 34, 1),
        canvasColor: const Color.fromRGBO(10, 13, 34, 1),
        cardColor: const Color.fromRGBO(17, 20, 40, 1),
        accentColor: const Color.fromRGBO(235, 21, 85, 1),
        primaryTextTheme: Theme.of(context).primaryTextTheme.apply(
              bodyColor: Colors.white,
            ),
        iconTheme: Theme.of(context).iconTheme.copyWith(
              color: const Color.fromRGBO(128, 129, 141, 1),
            ),
        textTheme: Theme.of(context).textTheme.copyWith(
              headline6: TextStyle(
                fontSize: 20,
                letterSpacing: 1,
                fontWeight: FontWeight.w500,
                color: const Color.fromRGBO(128, 129, 141, 1),
              ),
              headline4: TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.w500,
                letterSpacing: 1,
                color: const Color.fromRGBO(128, 129, 141, 1),
              ),
              headline3: TextStyle(
                fontSize: 56,
                fontWeight: FontWeight.w900,
                letterSpacing: 1,
                color: const Color.fromRGBO(128, 129, 141, 1),
              ),
              headline1: TextStyle(
                fontSize: 104,
                fontWeight: FontWeight.w700,
                letterSpacing: 1,
                color: const Color.fromRGBO(128, 129, 141, 1),
              ),
              button: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                letterSpacing: 1,
                backgroundColor: const Color.fromRGBO(235, 21, 85, 1),
              ),
            ),
        sliderTheme: Theme.of(context).sliderTheme.copyWith(
              activeTrackColor: Colors.white,
              inactiveTrackColor: const Color.fromRGBO(128, 129, 141, 1),
              thumbColor: const Color.fromRGBO(235, 21, 85, 1),
              trackHeight: 1,
              overlayColor: const Color.fromRGBO(235, 21, 85, 0.33),
            ),
        fontFamily: 'Roboto',
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomeScreen(),
      routes: {
        ResultScreen.routeName: (context) => ResultScreen(),
      },
    );
  }
}
