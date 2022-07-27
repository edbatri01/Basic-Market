import 'package:basic_market/src/pages/bottomnavigationvar/bottom_nativigation_bar.dart';
import 'package:basic_market/src/pages/categories/categories.dart';
import 'package:basic_market/src/pages/home/components/cards/card.dart';
import 'package:basic_market/src/pages/home/components/caroulsel/caroulser.dart';
import 'package:basic_market/src/pages/search/searche_delegate.dart';
import 'package:basic_market/src/styles/colors_view.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context)!.settings.arguments as Map;
    final id = arguments['id'];
    final name = arguments['name'];
    return Scaffold(
      //resizeToAvoidBottomInset: false,
      body: SafeArea(
          child: SingleChildScrollView(
        reverse: true,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 10),
                child: _textFieldSearch(field: 'Buscar producto'),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      ' Hola:',
                      style: _textStyle(bold: true, size: 15, numColor: 3),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 7),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.account_circle,
                            size: 23,
                            color: ColorSelect.black2,
                          ),
                          Container(
                            margin: const EdgeInsets.only(left: 3),
                            child: Text(
                              name.toString(),
                              style: _textStyle(
                                  bold: false, size: 18, numColor: 7),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 30),
                      child: SizedBox(
                        height: 60,
                        width: MediaQuery.of(context).size.width * 0.7,
                        //color: Colors.amberAccent,
                        child: Text(
                          '¡Proximamente!',
                          style: _textStyle(bold: true, size: 25, numColor: 1),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              //const Padding(padding: EdgeInsets.only(top: 30)),
              Container(
                  margin: const EdgeInsets.only(top: 30), child: Caroulser()),
              Container(
                margin: const EdgeInsets.only(left: 30, top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Popular',
                      style: _textStyle(bold: true, size: 20, numColor: 1),
                    ),
                    // TextButton(
                    //     onPressed: () {},
                    //     child: Text(
                    //       'Ver todo',
                    //       style: _textStyle(bold: false, size: 20, numColor: 8),
                    //     ))
                  ],
                ),
              ),
              Container(
                  margin: const EdgeInsets.only(top: 20), child: CardBM()),
              // Container(
              //     margin: const EdgeInsets.only(top: 10),
              //     child: const Categories()),
            ],
          ),
        ),
      )),
      bottomNavigationBar: BottomNativigationBarClass(),
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
            onPressed: () {
              showSearch(context: context, delegate: searchProduct());
              // setState(() {});
            },
          ),
        ),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide.none),
        // border: const OutlineInputBorder(
        //borderRadius: BorderRadius.all(Radius.circular(15))),
        hintText: field,
      ),
      onTap: () {
        showSearch(context: context, delegate: searchProduct());
      },
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
