import 'package:basic_market/src/styles/colors_view.dart';
import 'package:flutter/material.dart';

class AddCard extends StatefulWidget {
  const AddCard({Key? key}) : super(key: key);

  @override
  _AddCardState createState() => _AddCardState();
}

class _AddCardState extends State<AddCard> {
  var nameController = TextEditingController();
  var numberCardController = TextEditingController();

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
        title: Text('Agregar tarjeta',
            style: _textStyle(bold: false, size: 20, numColor: 3)),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            //color: Colors.amberAccent,
            margin: const EdgeInsets.all(15),
            //height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                Center(
                  child: Image.asset(
                    'assets/images/card.png',
                    height: 200,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Nombre completo',
                        style: _textStyle(bold: true, size: 15, numColor: 1),
                      ),
                      const Divider(
                        thickness: 1,
                        color: Colors.transparent,
                      ),
                      _textField(field: 'Titular'),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Número de tarjeta',
                        style: _textStyle(bold: true, size: 15, numColor: 1),
                      ),
                      const Divider(
                        thickness: 1,
                        color: Colors.transparent,
                      ),
                      _textFieldNumberCard(field: '1234 - 1234 - 1234 - 1234'),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Expiración',
                            style:
                                _textStyle(bold: true, size: 15, numColor: 1),
                          ),
                          const Divider(
                            thickness: 1,
                            color: Colors.transparent,
                          ),
                          SizedBox(
                            width: 150,
                            child: _textFieldDateExpire(field: 'MM/AA'),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'CVV',
                            style:
                                _textStyle(bold: true, size: 15, numColor: 1),
                          ),
                          const Divider(
                            thickness: 1,
                            color: Colors.transparent,
                          ),
                          SizedBox(
                            width: 150,
                            child: _textFieldCvv(field: '123'),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Container(
                  //color: Colors.red,
                  //margin: const EdgeInsets.only(left: 95, right: 80, bottom: 13),
                  margin: const EdgeInsets.only(left: 10, bottom: 10, top: 20),
                  height: 50,
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      'Agregar tarjeta',
                      style: _textStyle(bold: false, size: 18, numColor: 5),
                    ),
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(ColorSelect.blue1),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)))),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      // bottomSheet: Container(
      //   //color: Colors.red,
      //   //margin: const EdgeInsets.only(left: 95, right: 80, bottom: 13),
      //   margin: const EdgeInsets.only(left: 45, bottom: 15),
      //   height: 50,
      //   width: MediaQuery.of(context).size.width * 0.8,
      //   child: ElevatedButton(
      //     onPressed: () {},
      //     child: Text(
      //       'Agregar tarjeta',
      //       style: _textStyle(bold: false, size: 18, numColor: 5),
      //     ),
      //     style: ButtonStyle(
      //         backgroundColor: MaterialStateProperty.all(ColorSelect.blue1),
      //         shape: MaterialStateProperty.all<RoundedRectangleBorder>(
      //             RoundedRectangleBorder(
      //                 borderRadius: BorderRadius.circular(10)))),
      //   ),
      // ),
    );
  }

  TextField _textField({required String field}) {
    return TextField(
      style: _textStyle(bold: false, size: 13, numColor: 1),
      controller: nameController,
      decoration: InputDecoration(
        prefixIcon: const Icon(
          Icons.abc_sharp,
          size: 30,
        ),
        border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8))),
        hintText: field,
      ),
    );
  }

  TextField _textFieldDateExpire({required String field}) {
    return TextField(
      style: _textStyle(bold: false, size: 13, numColor: 1),
      decoration: InputDecoration(
          border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8))),
          hintText: field),
    );
  }

  TextField _textFieldNumberCard({required String field}) {
    return TextField(
      style: _textStyle(bold: false, size: 13, numColor: 1),
      controller: nameController,
      decoration: InputDecoration(
        prefixIcon: const Icon(
          Icons.credit_card,
          size: 30,
        ),
        border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8))),
        hintText: field,
      ),
    );
  }

  TextField _textFieldCvv({required String field}) {
    return TextField(
      style: _textStyle(bold: false, size: 13, numColor: 1),
      obscureText: true,
      //controller: passwordController,
      decoration: InputDecoration(
          suffixIcon: const Icon(
            Icons.credit_card,
          ),
          border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8))),
          hintText: field),
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
