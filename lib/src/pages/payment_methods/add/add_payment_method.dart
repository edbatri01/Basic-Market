import 'package:basic_market/src/styles/colors_view.dart';
import 'package:flutter/material.dart';

class AddPaymentMethod extends StatelessWidget {
  const AddPaymentMethod({Key? key}) : super(key: key);

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
        title: Text(
          'Agregar método de pago',
          style: _textStyle(bold: false, size: 20, numColor: 1),
        ),
      ),
      body: SafeArea(
          child: Container(
        margin: const EdgeInsets.all(15),
        child: Column(
          children: [
            Container(
              //color: Colors.amberAccent,
              margin: const EdgeInsets.only(top: 15),
              height: 70,
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset(
                    'assets/images/card.png',
                    height: 20,
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'Tarjeta de crédito o débito',
                      style: _textStyle(bold: false, size: 18, numColor: 1),
                    ),
                  ),
                  const Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: ColorSelect.black,
                    size: 20,
                  )
                ],
              ),
            ),
            const Divider(
              thickness: 1,
            ),
            Container(
              //color: Colors.red,
              margin: const EdgeInsets.only(top: 10),
              height: 70,
              width: MediaQuery.of(context).size.width,
              child: Row(
                //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 35),
                    //color: Colors.red,
                    child: Image.asset(
                      'assets/images/paypal.png',
                      //height: 20,
                    ),
                  ),
                  Container(
                    //color: Colors.amberAccent,
                    margin: const EdgeInsets.only(left: 110),
                    child: TextButton(
                      onPressed: () {},
                      child: Text(
                        'PayPal',
                        style: _textStyle(bold: false, size: 18, numColor: 1),
                      ),
                    ),
                  ),
                  Container(
                    //color: Colors.amberAccent,
                    margin: const EdgeInsets.only(left: 100),
                    child: const Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: ColorSelect.black,
                      size: 20,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      )),
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
