import 'package:flutter/material.dart';
import 'package:basic_market/src/styles/colors_view.dart';
import 'package:basic_market/src/onboarding/onboarding_2.dart';
class onboard_1 extends StatefulWidget {
  onboard_1({Key? key}) : super(key: key);

  @override
  State<onboard_1> createState() => _onboard_1State();
}

class _onboard_1State extends State<onboard_1> {
   @override
  void initState(){
    super.initState();  
    toOnboarding();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
            body: Container(
              // width: double.infinity,
              // height: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/onboarding_1.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              alignment: Alignment.bottomCenter,
              child: 
                Container(
                  height: 250,
                  width: double.infinity,
                    decoration: BoxDecoration(
                      color: ColorSelect.black.withOpacity(0.5)
                    ),
                  child: Container(
                    padding: EdgeInsets.fromLTRB(20, 40, 20, 20),
                      // child: Container(
                      //   alignment: Alignment.centerRight,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                           Text('Bienvenido',style: Theme.of(context).textTheme.subtitle1,textAlign: TextAlign.left,),
                            Text('Basic Market',style: Theme.of(context).textTheme.headline1,textAlign: TextAlign.start),
                          Text('La mejor app para hacer el super en tus necesidades diarias',style: Theme.of(context).textTheme.bodyText1,),
                          ],
                        ),
                      // ),
                   
                  ),
                ),
         
            ),
    );
  }
   void toOnboarding()async {
    await Future.delayed( Duration(milliseconds:4000),(){});
    Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => onboard_2()),
  );
  }
}