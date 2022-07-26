// ignore_for_file: must_be_immutable

import 'dart:convert';
import 'dart:developer';

import 'package:basic_market/src/models/products.dart';
import 'package:basic_market/src/pages/products/compare/compare_products.dart';
import 'package:basic_market/src/styles/colors_view.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CardBM extends StatefulWidget {
  CardBM({Key? key}) : super(key: key);

  @override
  State<CardBM> createState() => _CardBMState();
}

Future<Products> getProducts() async {
  final resp = await http.get(
    Uri.parse('http://apibmbalancer-1997433991.us-east-1.elb.amazonaws.com/getProducts'),
    //headers: {"Content-Type": "application/json"},
  );
  // print(resp.body);
  //log(resp.body.toString());
  return productsFromJson(resp.body);
}

class _CardBMState extends State<CardBM> {
  // var products = [

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getProducts(),
        builder: (BuildContext context, AsyncSnapshot<Products> snapshot) {
          if (snapshot.hasData) {
            return _ListProducts(snapshot.data!.items);
          } else {
            //print(snapshot.hasData);
            return const CircularProgressIndicator();
          }
        });
  }
}

class _ListProducts extends StatelessWidget {
  final List<Item> products;
  const _ListProducts(this.products);

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.amberAccent,
      height: 220,
      margin: const EdgeInsets.only(top: 0, left: 8),
      child: GridView.count(
        mainAxisSpacing: 0,
        physics: const BouncingScrollPhysics(),
        crossAxisCount: 1,
        scrollDirection: Axis.horizontal,
        children: List.generate(products.length, (index) {
          return GestureDetector(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => CompareProducts(
                        products[index].id,
                        products[index].urlImage.toString(),
                        products[index].name.toString(),
                        products[index].code.toString()))),
            child: Container(
              width: 100,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: ColorSelect.white, width: 1)),
              child: Container(
                margin: const EdgeInsets.only(left: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.network(
                      products[index].urlImage.toString(),
                      fit: BoxFit.cover,
                      width: 100,
                      height: 100,
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      child: Text(
                        products[index].name.toString(),
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.green),
                      ),
                    ),
                    // SizedBox(
                    //   width: 170,
                    //   child: Text(
                    //     productsChe[index]['desc'].toString(),
                    //     style: const TextStyle(
                    //         fontWeight: FontWeight.normal,
                    //         fontSize: 15,
                    //         color: Colors.grey),
                    //   ),
                    // ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: const [
                        Text(
                          "",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 17),
                        ),
                        // Text(
                        //   products[index].code,
                        //   style: const TextStyle(
                        //       fontWeight: FontWeight.bold, fontSize: 17),
                        // )
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
