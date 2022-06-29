import 'package:basic_market/services/firebase_service.dart';
import 'package:basic_market/src/styles/colors_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/src/material/ink_decoration.dart';
// import 'package:flutter/cupertino.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var emailAddressController = TextEditingController();
  var passwordController = TextEditingController();
  bool _isHide = true;

  FirebaseService service = FirebaseService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: ColorSelect.white,
        elevation: 0,
        toolbarHeight: 50,
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
                const Padding(padding: EdgeInsets.only(top: 10)),
                Text(
                  'Iniciar sesión',
                  style: _textStyle(bold: false, size: 30, numColor: 1),
                )
              ],
            ),
            Container(
              //color: Colors.amber,
              margin: const EdgeInsets.only(top: 10, left: 25, right: 25),
              width: double.infinity,
              height: 288,
              child: Column(
                children: [
                  _textField(field: 'Correo electrónico'),
                  const Padding(padding: EdgeInsets.only(top: 12)),
                  _textFieldPassword(field: 'Contraseña'),
                  const Padding(padding: EdgeInsets.only(top: 10)),

                  Container(
                    //width: 140,
                    height: 48,
                    //color: Colors.amberAccent,
                    margin: const EdgeInsets.only(left: 210, top: 1),
                    child: TextButton(
                      onPressed: () {},
                      child: Text(
                        '¿Olvide mi contraseña?',
                        style: _textStyle(bold: true, size: 12, numColor: 1),
                      ),
                    ),
                  ),
                  const Padding(padding: EdgeInsets.only(top: 15)),
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
                      child: Text("Ingregar",
                          style:
                              _textStyle(bold: false, size: 25, numColor: 5)),
                    ),
                  ),
                  //const Padding(padding: EdgeInsets.only(top: 15)),
                ],
              ),
            ),
            Container(
              //color: Colors.amberAccent,
              // width: 250,
              // height: 250,
              //color: Colors.red,
              margin: const EdgeInsets.only(top: 2),
              child: Text(
                'O continue con',
                style: _textStyle(bold: false, size: 20, numColor: 3),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(top: 10),
              child: Column(
                children: [
                  //const Padding(padding: EdgeInsets.only(top: 15)),
                  SizedBox(
                    //color: Colors.green,
                    width: 160,
                    child: InkWell(
                      onTap: () async {
                        try {
                          await service.signInwithGoogle();
                          User? user = FirebaseAuth.instance.currentUser;
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: const Text('Autenticación Exitosa'),
                                  content: Text(
                                    user!.email.toString() +
                                        "\n" +
                                        user.displayName.toString(),
                                    style: _textStyle(
                                        bold: true, size: 20, numColor: 1),
                                  ),
                                  actions: [
                                    TextButton(
                                        onPressed: () async {
                                          await service.signOutFromGoogle();
                                          Navigator.of(context,
                                                  rootNavigator: true)
                                              .pop();
                                        },
                                        child: const Text('Ok'))
                                  ],
                                );
                              });
                        } catch (e) {
                          if (e is FirebaseAuthException) {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: const Text('Algo salio mal'),
                                    content:
                                        const Text('No fue posible autenticar'),
                                    actions: [
                                      TextButton(
                                          onPressed: () {
                                            Navigator.of(context,
                                                    rootNavigator: true)
                                                .pop();
                                          },
                                          child: const Text('Ok'))
                                    ],
                                  );
                                });
                          }
                        }
                      },
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
                    color: Colors.amberAccent,
                    width: 164,
                    height: 45,
                    //color: Colors.green,
                    child: ElevatedButton(
                      onPressed: () async {
                        try {
                          print('button facebook');
                          await service.signInWithFacebook();
                          User? user = FirebaseAuth.instance.currentUser;
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: const Text('Autenticación Exitosa'),
                                  content: Text(
                                    user!.displayName.toString(),
                                    style: _textStyle(
                                        bold: true, size: 20, numColor: 1),
                                  ),
                                  actions: [
                                    TextButton(
                                        onPressed: () async {
                                          await service.signOutFromFacebook();
                                          Navigator.of(context,
                                                  rootNavigator: true)
                                              .pop();
                                        },
                                        child: const Text('Ok'))
                                  ],
                                );
                              });
                        } catch (e) {
                          if (e is FirebaseAuthException) {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: const Text('Algo salio mal'),
                                    content:
                                        const Text('No fue posible autenticar'),
                                    actions: [
                                      TextButton(
                                          onPressed: () {
                                            Navigator.of(context,
                                                    rootNavigator: true)
                                                .pop();
                                          },
                                          child: const Text('Ok'))
                                    ],
                                  );
                                });
                          }
                        }
                      },
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
                          '¿No tienes cuenta?',
                          style: _textStyle(bold: false, size: 12, numColor: 3),
                        ),
                        const SizedBox(width: 12),
                        TextButton(
                            onPressed: () {},
                            child: Text(
                              'Registrate',
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
      //bottomNavigationBar: Container(),
    );
  }

  TextField _textField({required String field}) {
    return TextField(
      //textAlign: TextAlign.end,
      style: _textStyle(bold: false, size: 13, numColor: 1),
      controller: emailAddressController,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.email_outlined),
        border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8))),
        // border: const OutlineInputBorder(
        //borderRadius: BorderRadius.all(Radius.circular(15))),
        hintText: field,
      ),
    );
  }

  SizedBox _textFieldPassword({required String field}) {
    return SizedBox(
      //color: Colors.red,
      height: 53,
      child: TextField(
        style: _textStyle(bold: false, size: 13, numColor: 1),
        obscureText: _isHide,
        controller: passwordController,
        decoration: InputDecoration(
            prefixIcon: IconButton(
              icon: Icon(_isHide ? Icons.lock_open : Icons.lock_outline),
              onPressed: () {
                setState(() {
                  _isHide = !_isHide;
                });
              },
            ),
            border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(8))),
            // suffixIcon: Padding(
            //   padding: const EdgeInsetsDirectional.only(start: 10),
            //   child: Row(
            //     children: [
            //       //const Padding(padding: EdgeInsets.only(left: 5)),
            //       IconButton(
            //         icon: Icon(_isHide ? Icons.lock_open : Icons.lock_outline),
            //         onPressed: () {
            //           setState(
            //             () {
            //               _isHide = !_isHide;
            //             },
            //           );
            //         },
            //       ),
            //       //const Padding(padding: EdgeInsets.only(left: 5)),
            //       Text(field)
            //     ],
            //   ),
            // ),
            hintText: field),
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
