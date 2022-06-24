
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:basic_market/src/styles/colors_view.dart';

class onboard_4 extends StatefulWidget {
  onboard_4({Key? key}) : super(key: key);

  @override
  State<onboard_4> createState() => _onboard_4State();
}

class _onboard_4State extends State<onboard_4> {
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
                  margin: EdgeInsets.symmetric(horizontal:110),
                  alignment: Alignment.bottomCenter,
                  padding: EdgeInsets.only(bottom: 17),
                  child:Image.asset('assets/svg/trolley_grocery.png'),)
                
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
                                  child:const Text('Nostros hacemos las compras por ti',
                                    style: TextStyle(color: ColorSelect.black2,
                                      fontSize:28, fontWeight: FontWeight.bold), textAlign: TextAlign.center,)),
                               ),
                               Expanded(
                                 child: Container(
                                  padding: EdgeInsets.symmetric(horizontal:45),
                                  child: const Text('Nuestro trabajo hacer entrega de tus compras de diferentes tiendas y supermercados facil, comodo y ahorrando dinero.',style: TextStyle(color: ColorSelect.grey2,fontSize:15), textAlign: TextAlign.center,)),
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
                                          onPressed: () { },
                                          child: Text('Empezar'),
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