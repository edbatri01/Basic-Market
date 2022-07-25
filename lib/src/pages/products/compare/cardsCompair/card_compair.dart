// ignore_for_file: must_be_immutable, no_logic_in_create_state

import 'dart:convert';

import 'package:basic_market/src/models/products_by_shop.dart';
import 'package:basic_market/src/styles/colors_view.dart';
import 'package:flutter/material.dart';
import 'package:counter_button/counter_button.dart';
import 'package:http/http.dart' as http;

class CardCompair extends StatefulWidget {
  final int id;
  const CardCompair(this.id, {Key? key}) : super(key: key);

  @override
  State<CardCompair> createState() => _CardCompairState(id);
}

class _CardCompairState extends State<CardCompair> {
  int id;

  Future<ProductsByShop> getProductsByShop() async {
    final resp = await http.post(
        Uri.parse('http://44.207.133.148/filterPriceByshop'),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({"id_product": id}));
    return productsByShopFromJson(resp.body);
  }

  _CardCompairState(this.id);
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
    return FutureBuilder(
        future: getProductsByShop(),
        builder:
            (BuildContext context, AsyncSnapshot<ProductsByShop> snapshot) {
          if (snapshot.hasData) {
            return _ListProductsByShop(snapshot.data!.productsByShop);
          } else {
            return const CircularProgressIndicator();
          }
        });
  }
}

class _ListProductsByShop extends StatefulWidget {
  final List<ProductsByShopElement> productsByShop;
  _ListProductsByShop(this.productsByShop);

  @override
  State<_ListProductsByShop> createState() => _ListProductsByShopState();
}

class _ListProductsByShopState extends State<_ListProductsByShop> {
  // int _counterValue = 1;
  // int countAux = 1;
  // int isPressed = 0;
  // bool flag = false;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        //color: Colors.amberAccent,
        width: MediaQuery.of(context).size.width,
        //height: MediaQuery.of(context).size.height * 1.5,
        margin: const EdgeInsets.only(top: 15, left: 8),
        child: Column(
          children: List.generate(widget.productsByShop.length, (index) {
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
                            "\$" +
                                widget.productsByShop[index].price.toString(),
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                color: Colors.black),
                          ),
                        ),
                        // Row(
                        //   //: MainAxisAlignment.end,
                        //   children: [
                        //     Container(
                        //       //color: Colors.amberAccent,
                        //       margin: const EdgeInsets.only(right: 30),
                        //       child: CounterButton(
                        //         loading: false,
                        //         onChange: (int val) {
                        //           setState(() {
                        //             if (_counterValue >= 1 && val > 0) {
                        //               isPressed = index;

                        //               print(val);
                        //               _counterValue = val;
                        //               print(val);
                        //             }
                        //           });
                        //           print(isPressed.toString() +
                        //               " --- " +
                        //               index.toString() +
                        //               " --- " +
                        //               _counterValue.toString());
                        //         },
                        //         count:
                        //             isPressed == index ? _counterValue : countAux,
                        //         countColor: ColorSelect.black,
                        //         buttonColor: ColorSelect.black,
                        //       ),
                        //     ),
                        //   ],
                        // )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(left: 15),
                          child: Image.network(
                            widget.productsByShop[index].shopImg.toString(),
                            height: 63,
                            width: 150,
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(right: 40),
                          child: Text(
                            'Total = ' +
                                "\$" +
                                widget.productsByShop[index].price.toString(),
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
                            '',
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
      ),
    );
  }
}
