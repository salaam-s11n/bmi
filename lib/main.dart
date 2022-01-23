import 'package:bmi/mainPage.dart';
import 'package:flutter/material.dart';

void main() {
  //  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primarySwatch: Colors.teal,
            canvasColor: Colors.white,
            iconTheme: const IconThemeData(
              color: Colors.black,
            ),
            textTheme: const TextTheme(
              headline1: TextStyle(
                fontSize: 30,
                color: Colors.black,
                fontWeight: FontWeight.w600,
                fontFamily: "OpenSansCondensed",
              ),
              headline2: TextStyle(
                fontSize: 20,
                color: Colors.black,
                fontWeight: FontWeight.w500,
                fontFamily: "OpenSansCondensed",
              ),
              subtitle1: TextStyle(
                fontSize: 25,
                color: Colors.black,
                fontWeight: FontWeight.w500,
                fontFamily: "OpenSansCondensed",
              ),
              subtitle2: TextStyle(
                fontSize: 30,
                color: Colors.black,
                fontWeight: FontWeight.w500,
                fontFamily: "OpenSansCondensed",
              ),
            )),
        home: const MainPage());
  }
}
