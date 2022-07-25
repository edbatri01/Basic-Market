// ignore_for_file: camel_case_types

import 'dart:convert';

import 'package:basic_market/src/models/product_filter.dart';
import 'package:basic_market/src/models/products.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../styles/colors_view.dart';



class searchProduct extends SearchDelegate<Products> {

  Future<ProductFilter> getProductsFilter(String name) async {
    final resp = await http.post(
        Uri.parse('http://44.207.133.148/productsFilterByNameList'),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({"name": name}));
    return productFilterFromJson(resp.body);
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: const Icon(Icons.close),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () =>
          {FocusScope.of(context).unfocus(), Navigator.pop(context)},
      icon: const Icon(
        Icons.arrow_back_ios_new_rounded,
        color: ColorSelect.black,
        size: 30,
      ),
    );
    // throw UnimplementedError();
  }

  @override
  Widget buildResults(BuildContext context) {
    return FutureBuilder(
        future: getProductsFilter(query.trim()),
        builder:
            (BuildContext context, AsyncSnapshot<ProductFilter> snapshot) {
          if (snapshot.hasData) {
            return _ListProductFilter(snapshot.data!.product);
          } else {
            return const  NoResults();
          }
        });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    
    return const Center();
  }
}

class _ListProductFilter extends StatelessWidget {
  final List<Product> productListFilter;
 const  _ListProductFilter(this.productListFilter);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorSelect.white,
        elevation: 0,
        toolbarHeight: 50,
        leading: IconButton(
          onPressed: () =>
              {FocusScope.of(context).unfocus(), Navigator.pop(context)},
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: ColorSelect.black,
            size: 30,
          ),
        ),
        title: Text(
          'Resultados de la busqueda',
          style: _textStyle(bold: false, size: 25, numColor: 1),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: List.generate(productListFilter.length, (index) {
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
                                productListFilter[index].price.toString(),
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
                              margin: const EdgeInsets.only(right: 30),
                              child: Image.network(
                                productListFilter[index].urlImage.toString(),
                                height: 63,
                                width: 150,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(left: 15),
                          child: Image.network(
                            productListFilter[index].shopImg.toString(),
                            height: 63,
                            width: 150,
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(right: 40),
                          child: Text(
                            productListFilter[index].shopName.toString(),
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
          })
            ),
          ),
        )
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

class NoResults extends StatelessWidget {
const NoResults({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorSelect.white,
        elevation: 0,
        toolbarHeight: 50,
        leading: IconButton(
          onPressed: () =>
              {FocusScope.of(context).unfocus(), Navigator.pop(context)},
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: ColorSelect.black,
            size: 30,
          ),
        ),
        title: Text(
          'Resultados de la busqueda',
          style: _textStyle(bold: false, size: 25, numColor: 1),
        ),
      ),
      body: Center(
        child: Text(
          'NO HAY RESULTADOS PARA MOSTRAR',
          style: _textStyle(bold: false, size: 50, numColor: 4),
        ),
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


