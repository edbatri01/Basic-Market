// ignore_for_file: use_key_in_widget_constructors

import 'package:basic_market/src/pages/bottomnavigationvar/bottom_nativigation_bar.dart';
import 'package:basic_market/src/pages/home/components/cards/card.dart';
import 'package:basic_market/src/pages/products/compare/cardsCompair/card_compair.dart';
import 'package:basic_market/src/styles/colors_view.dart';
import 'package:flutter/material.dart';

class CompareProducts extends StatefulWidget {
  final int id;
  final String url;
  final String name;
  final String price;
  const CompareProducts(this.id, this.url, this.name, this.price, {Key? key})
      : super(key: key);

  @override
  _CompareProductsState createState() =>
      // ignore: no_logic_in_create_state
      _CompareProductsState(id, url, name, price);
}

class _CompareProductsState extends State<CompareProducts> {
  int id;
  String url;
  String name;
  String price;

  _CompareProductsState(this.id, this.url, this.name, this.price);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: ColorSelect.white,
        elevation: 0,
        toolbarHeight: 50,
        leading: IconButton(
          onPressed: () => {Navigator.pop(context)},
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: ColorSelect.black,
            size: 30,
          ),
        ),
        title: Text('Comparar producto',
            style: _textStyle(bold: false, size: 20, numColor: 3)),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.center,
              //crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  child: _textFieldSearch(field: 'Buscar producto'),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 15),
                  width: MediaQuery.of(context).size.width * 0.45,
                  height: 220,
                  decoration: BoxDecoration(
                      border: Border.all(width: 1, color: ColorSelect.blue1),
                      borderRadius:
                          const BorderRadius.all(Radius.elliptical(12, 12))),
                  child: Card(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.network(
                          url,
                          width: 100,
                          height: 120,
                        ),
                        Text(name,
                            style:
                                _textStyle(bold: false, size: 15, numColor: 3)),
                        Text("\$" + price,
                            style:
                                _textStyle(bold: false, size: 15, numColor: 3))
                      ],
                    ),
                  ),
                ),
                Container(
                  //color: Colors.amberAccent,
                  height: 30,
                  width: 140,
                  //alignment: Alignment.centerLeft,
                  margin: const EdgeInsets.only(right: 195, top: 20),
                  //margin: const EdgeInsets.only(top: 20),
                  child: Text(
                    'Otras opciones',
                    style: _textStyle(bold: true, size: 20, numColor: 1),
                  ),
                ),
                CardCompair(id),
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Text(
                      //   ' Entregar en:',
                      //   style: _textStyle(bold: false, size: 14, numColor: 3),
                      // ),
                      // Container(
                      //   margin: const EdgeInsets.only(top: 7),
                      //   child: Row(
                      //     children: [
                      //       const Icon(
                      //         Icons.location_on_sharp,
                      //         size: 23,
                      //         color: ColorSelect.black2,
                      //       ),
                      //       Container(
                      //         margin: const EdgeInsets.only(left: 3),
                      //         child: Text(
                      //           'Tu ubicación',
                      //           style: _textStyle(
                      //               bold: false, size: 18, numColor: 7),
                      //         ),
                      //       )
                      //     ],
                      //   ), 
                      // ),
                      Container(
                        margin: const EdgeInsets.only(left: 7, top: 30),
                        child: Text(
                          'Recomendaciones',
                          style: _textStyle(bold: true, size: 20, numColor: 1),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                    margin: const EdgeInsets.only(top: 15), child: CardBM()),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar:  BottomNativigationBarClass(),
    );
  }

  TextField _textFieldSearch({required String field}) {
    return TextField(
      //textAlign: TextAlign.end,
      style: _textStyle(bold: false, size: 15, numColor: 3),
      //controller: emailAddressController,
      //keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        // isDense: true,
        filled: true,
        fillColor: ColorSelect.grey1,
        suffixIcon: Container(
          height: 30,
          width: MediaQuery.of(context).size.width * 0.12,
          margin: const EdgeInsets.only(right: 3),
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              color: ColorSelect.blue1),
          child: IconButton(
            icon: const Icon(Icons.search, color: ColorSelect.white),
            onPressed: () {},
          ),
        ),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide.none),
        // border: const OutlineInputBorder(
        //borderRadius: BorderRadius.all(Radius.circular(15))),
        hintText: field,
      ),
    );
  }

  TextStyle _textStyle(
      {required bool bold, required double size, required int numColor}) {
    return TextStyle(
        fontWeight: bold == true ? FontWeight.bold : FontWeight.normal,
        color: numColor == 1
            ? ColorSelect.black
            : numColor == 2
                ? ColorSelect.grey1
                : numColor == 3
                    ? ColorSelect.grey2
                    : numColor == 4
                        ? ColorSelect.grey3
                        : numColor == 5
                            ? ColorSelect.white
                            : numColor == 6
                                ? ColorSelect.blueFacebook
                                : numColor == 7
                                    ? ColorSelect.black2
                                    : ColorSelect.orange,
        fontSize: size,
        fontFamily: 'Hack',
        decoration:
            numColor == 8 ? TextDecoration.underline : TextDecoration.none);
  }
}
