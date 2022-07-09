// ignore_for_file: must_be_immutable

import 'package:basic_market/src/styles/colors_view.dart';
import 'package:flutter/material.dart';
import 'package:counter_button/counter_button.dart';

class CardCompair extends StatefulWidget {
  const CardCompair({Key? key}) : super(key: key);

  @override
  State<CardCompair> createState() => _CardCompairState();
}

class _CardCompairState extends State<CardCompair> {
  var products = [
    {
      "image": "assets/images/aceite.png",
      "name": "Aceite nutrioli",
      "desc": "Puro de soya 946 ml",
      "price": 30.0
    },
    {
      "image": "assets/images/atun.png",
      "name": "Atun dolores",
      "desc": "En agua 120 gr",
      "price": 25.0
    },
    {
      "image": "assets/images/cafe.png",
      "name": "Nescafe",
      "desc": "Café soluble 1kg",
      "price": 26.0
    },
    {
      "image": "assets/images/leche.png",
      "name": "Lala Deslactosada",
      "desc": "1L",
      "price": 24.0
    },
  ];

  var shops = [
    {"image": "assets/images/walmart.png"},
    {"image": "assets/images/chedraui.png"},
    {"image": "assets/images/soriana.png"},
    {"image": "assets/images/aurrera.png"}
  ];

  int _counterValue = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Colors.amberAccent,
      width: MediaQuery.of(context).size.width,
      height: 1000,
      margin: const EdgeInsets.only(top: 15, left: 8),
      child: Column(
        children: List.generate(shops.length, (index) {
          return Container(
            //color: Colors.amberAccent,

            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: ColorSelect.white, width: 1)),
            child: Card(
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.center,
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(left: 130),
                        //color: Colors.red,
                        child: Text(
                          "\$" + products[index]['price'].toString(),
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: Colors.black),
                        ),
                      ),
                      Row(
                        //: MainAxisAlignment.end,
                        children: [
                          Container(
                            //color: Colors.amberAccent,
                            margin: const EdgeInsets.only(right: 30),
                            child: CounterButton(
                              loading: false,
                              onChange: (int val) {
                                  
                                if (_counterValue >= 1 && val > 0) {
                                  _counterValue = val;
                                }
                                setState(() {});
                              },
                              count: _counterValue,
                              countColor: ColorSelect.black,
                              buttonColor: ColorSelect.black,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(left: 15),
                        child: Image.asset(
                          shops[index]['image'].toString(),
                          height: 100,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(right: 40),
                        child: Text(
                          'Total = ' +
                              "\$" +
                              products[index]['price'].toString(),
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              fontFamily: 'Hack'),
                        ),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(left: 130),
                        child: const Text(
                          '-5%',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: Colors.red),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(right: 15),
                        child: ElevatedButton(
                            onPressed: () {},
                            style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    ColorSelect.aquaGreen),
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(3)))),
                            child: const Text(
                              'Agregar a lista',
                              style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontSize: 15,
                                  color: ColorSelect.white),
                            )),
                      )
                    ],
                  ),
                  const Divider(thickness: 0.7),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
