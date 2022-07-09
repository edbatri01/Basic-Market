import 'package:basic_market/src/pages/products/compare/compare_products.dart';
import 'package:basic_market/src/styles/colors_view.dart';
import 'package:flutter/material.dart';

class CardBM extends StatelessWidget {
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
      "price": 13.0
    },
    {
      "image": "assets/images/cafe.png",
      "name": "Nescafe",
      "desc": "Café soluble 1kg",
      "price": 120.0
    },
    {
      "image": "assets/images/leche.png",
      "name": "Lala Deslactosada",
      "desc": "1L",
      "price": 24.0
    },
  ];

  CardBM({Key? key}) : super(key: key);

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
                        products[index]['image'].toString(),
                        products[index]['name'].toString(),
                        products[index]['desc'].toString(),
                        products[index]['price'].toString()))),
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
                    Image.asset(
                      products[index]['image'].toString(),
                      fit: BoxFit.cover,
                      width: 100,
                      height: 100,
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      child: Text(
                        products[index]['name'].toString(),
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.green),
                      ),
                    ),
                    SizedBox(
                      width: 170,
                      child: Text(
                        products[index]['desc'].toString(),
                        style: const TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 15,
                            color: Colors.grey),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          "\$",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 17),
                        ),
                        Text(
                          products[index]['price'].toString(),
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 17),
                        )
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
