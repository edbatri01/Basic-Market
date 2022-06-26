import 'package:basic_market/src/styles/colors_view.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/src/material/ink_decoration.dart';
// import 'package:flutter/cupertino.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  var emailAddressController = TextEditingController();
  var passwordController = TextEditingController();
  bool _isHide = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: ColorSelect.white,
        // elevation: 0,
        // toolbarHeight: 50,
        leading: IconButton(
          onPressed: () => {},
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: ColorSelect.black,
            size: 30,
          ),
        ),
      ),
      body: Container(
        margin: const EdgeInsets.only(top: 1),
        color: ColorSelect.white,
        width: double.infinity,
        //color: Colors.amberAccent,
        child: SafeArea(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Column(
              children: [
                Image.asset(
                  'assets/images/basic_market_logo.png',
                  fit: BoxFit.fill,
                  width: 200,
                  height: 80,
                ),
                const Padding(padding: EdgeInsets.only(top: 15)),
                Text(
                  'Registro',
                  style: _textStyle(bold: false, size: 30, numColor: 1),
                )
              ],
            ),
            Container(
              //color: Colors.amber,
              margin: const EdgeInsets.only(top: 20, left: 25, right: 25),
              width: double.infinity,
              height: 280,
              child: Column(
                children: [
                  _textField(field: 'Correo electrónico'),
                  const Padding(padding: EdgeInsets.only(top: 17)),
                  _textFieldPassword(field: 'Contraseña'),
                  const Padding(padding: EdgeInsets.only(top: 17)),
                  _textFieldPassword(field: 'Confirmar contraseña'),
                  const Padding(padding: EdgeInsets.only(top: 25)),
                  SizedBox(
                    width: double.infinity,
                    height: 40,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(ColorSelect.orange),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(3)))),
                      child: Text("Crear cuenta",
                          style:
                              _textStyle(bold: false, size: 25, numColor: 5)),
                    ),
                  ),
                  //const Padding(padding: EdgeInsets.only(top: 15)),
                ],
              ),
            ),
            Container(
              // width: 250,
              // height: 250,
              //color: Colors.red,
              padding: const EdgeInsets.only(top: 15),
              child: Column(
                children: [
                  Text(
                    'O ingrese con',
                    style: _textStyle(bold: false, size: 20, numColor: 3),
                  ),
                  const Padding(padding: EdgeInsets.only(top: 15)),
                  Container(
                    //color: Colors.green,
                    width: 160,
                    child: InkWell(
                      onTap: () {},
                      child: Ink(
                        color: ColorSelect.white,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 12),
                          child: Wrap(
                            crossAxisAlignment: WrapCrossAlignment.center,
                            children: [
                              Image.asset(
                                'assets/images/google-r.png',
                                width: 35,
                                height: 35,
                              ), // <-- Use 'Image.asset(...)' here
                              const SizedBox(width: 12),
                              Text('Google',
                                  style: _textStyle(
                                      bold: false, size: 20, numColor: 1)),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  const Padding(padding: EdgeInsets.only(top: 10)),
                  Container(
                    width: 164,
                    height: 45,
                    //color: Colors.green,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ButtonStyle(
                          // backgroundColor: MaterialStateProperty.all(
                          //     const Color.fromRGBO(22, 117, 209, 1.0)),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(3)))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Image.asset(
                            'assets/images/facebook.png',
                            //alignment: Alignment.topRight,
                            width: 35,
                            height: 35,
                          ),
                          const Padding(padding: EdgeInsets.only(right: 10)),
                          Text('Facebook',
                              style: _textStyle(
                                  bold: false, size: 20, numColor: 5)),
                        ],
                      ),
                    ),
                  ),
                  const Padding(padding: EdgeInsets.only(top: 10)),
                  SizedBox(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '¿Ya tienes cuenta?',
                          style: _textStyle(bold: false, size: 12, numColor: 3),
                        ),
                        const SizedBox(width: 12),
                        TextButton(
                            onPressed: () {},
                            child: Text(
                              'Ingresar',
                              style: _textStyle(
                                  bold: false, size: 12, numColor: 1),
                            ))
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        )),
      ),
    );
  }

  TextField _textField({required String field}) {
    return TextField(
      textAlign: TextAlign.end,
      style: _textStyle(bold: false, size: 13, numColor: 2),
      controller: emailAddressController,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        suffixIcon: Padding(
          padding: const EdgeInsetsDirectional.only(start: 10),
          child: Row(
            children: [
              const Padding(padding: EdgeInsets.only(left: 10)),
              const Icon(Icons.email_outlined),
              const Padding(padding: EdgeInsets.only(left: 12)),
              Text(field)
            ],
          ),
        ),
        //icon: const Icon(Icons.email_outlined),
        border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8))),
        // border: const OutlineInputBorder(
        //borderRadius: BorderRadius.all(Radius.circular(15))),
        hintText: field,
      ),
    );
  }

  TextField _textFieldPassword({required String field}) {
    return TextField(
      obscureText: _isHide,
      controller: passwordController,
      decoration: InputDecoration(
        //labelText: field,
        border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8))),
        suffixIcon: Padding(
          padding: const EdgeInsetsDirectional.only(start: 10),
          child: Row(
            children: [
              //const Padding(padding: EdgeInsets.only(left: 5)),
              IconButton(
                icon: Icon(_isHide ? Icons.lock_open : Icons.lock_outline),
                onPressed: () {
                  setState(
                    () {
                      _isHide = !_isHide;
                    },
                  );
                },
              ),
              //const Padding(padding: EdgeInsets.only(left: 5)),
              Text(field)
            ],
          ),
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
                            : ColorSelect.blueFacebook,
        fontSize: size,
        fontFamily: 'Hack');
  }
}
