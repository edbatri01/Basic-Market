import 'package:basic_market/src/onboarding/onboarding_0.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive,
    overlays: [SystemUiOverlay.top]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Basic Market',
      theme: ThemeData(
        fontFamily: 'OpenSans',
        textTheme:const TextTheme(
          headline1: TextStyle(fontSize:50,fontWeight:FontWeight.bold, color:Colors.white),
          subtitle1: TextStyle(fontSize: 30.0,fontWeight:FontWeight.bold, color: Colors.white),
          bodyText1: TextStyle(fontSize: 15.0, color: Colors.white),
        )
      ),
      initialRoute: 'initialHeader',
      
      routes: {
        'initialHeader': (BuildContext context)=> onboard_0(),

      },
    );
  }
}
