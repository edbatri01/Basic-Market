import 'package:flutter/material.dart';
import 'package:basic_market/src/styles/colors_view.dart';
import 'package:basic_market/src/onboarding/progressPainter.dart';
import 'package:basic_market/src/onboarding/onboarding_1.dart';
import 'dart:async';

class onboard_0 extends StatefulWidget {
  onboard_0({Key? key}) : super(key: key);

  @override
  State<onboard_0> createState() => _onboard_0State();
}

class _onboard_0State extends State<onboard_0> {
  double porAnima=0;

  @override
  void initState(){
    super.initState();  
    animation();
    toOnboarding();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorSelect.blue1,
      body: Column(
        children: [
          Expanded(  
            child: Center(
              child: Image.asset('assets/logo_blanco-amarillo.png') 
            ,)
          
          ),
          Expanded(
            child: Container(
              child: Center(
                child: Container(
                height: 60, 
                width: 60,
                child: CustomPaint(
                  painter: progressPainter(valor: porAnima),
                ),
          ),
              ),
            ),
          ),
        ],
      )
    );
  }

  void toOnboarding()async {
    await Future.delayed( Duration(milliseconds:4000),(){});
    Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => onboard_1()),
  );
  }

  animation(){
    Timer.periodic( Duration(milliseconds: 80), (timer) {
      setState((){
        porAnima += 10;
        if(porAnima==110){
          porAnima=0;
        }
      });
     });
  }
}