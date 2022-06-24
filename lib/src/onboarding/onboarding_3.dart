
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:basic_market/src/styles/colors_view.dart';
import 'package:basic_market/src/onboarding/onboarding_4.dart';

class onboard_3 extends StatefulWidget {
  onboard_3({Key? key}) : super(key: key);

  @override
  State<onboard_3> createState() => _onboard_3State();
}

class _onboard_3State extends State<onboard_3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Column(children: [
        Expanded(//child: 
        // Container(
          // alignment: Alignment.bottomCenter,
          child: Stack(
              children: [
                Container(alignment: Alignment.bottomCenter,child: SvgPicture.asset('assets/svg/Frame_2.svg')),
                Container(
                 margin: EdgeInsets.symmetric(horizontal:90),
                  alignment: Alignment.bottomCenter,
                  padding: EdgeInsets.only(bottom: 17),
                  child:Image.asset('assets/svg/cyber-monday.png'),)
                
              ],
          ),
        // ),
        ),
        Expanded(child: Container(
                    padding: EdgeInsets.fromLTRB(20, 40, 20, 20),
                      // child: Container(
                      //   alignment: Alignment.centerRight,
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
          
                               Expanded(
                                 child: Container( 
                                  padding: EdgeInsets.symmetric(horizontal:40),
                                  child: Text('Solucion a tus compras',
                                    style: TextStyle(color: ColorSelect.black2,
                                      fontSize:28, fontWeight: FontWeight.bold), textAlign: TextAlign.center,)),
                               ),
                               Expanded(
                                 child: Container(
                                  padding: EdgeInsets.symmetric(horizontal:45),
                                  child: Text('Has tu lista de compras de diferentes tiendas y no tendras que hacer colas y preocuparte por el trafico',style: TextStyle(color: ColorSelect.grey2,fontSize:15), textAlign: TextAlign.center,)),
                               ),
                               Expanded(child:
                               
                                 Center(
                                   child: Container(
                                    height: 45,
                                    width: MediaQuery.of(context).size.width,
                                   
                                      child: ElevatedButton(
                                          style:ElevatedButton.styleFrom(
                                            primary: ColorSelect.aquaGreen,
                                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7))
                                            // onSurface: Colors.transparent,
                                            // shadowColor: Colors.transparent,
                                            //make color or elevated button transparent
                                        ),
                                          onPressed: () {Navigator.push(
                                            context,
                                            MaterialPageRoute(builder: (context) => onboard_4()),
                                          ); },
                                          child: Text('Continuar'),
                                        ),
                                      
                                   ),
                                 ),
                               )
                            ],
                          ),
                        ),
                      // ),
                   
                  ),)
      ],)
    );
  }
}