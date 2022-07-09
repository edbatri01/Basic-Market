import 'package:basic_market/src/pages/login/login.dart';
import 'package:basic_market/src/styles/colors_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../services/firebase_service.dart';
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
  var passwordconfirmController = TextEditingController();
  bool _isHide = true;
  bool _isHide2 = true;
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
          onPressed: () => {Navigator.pop(context)},
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
        width: MediaQuery.of(context).size.width,
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
                  //width: 200,
                  height: 80,
                ),
                //const Padding(padding: EdgeInsets.only(top: 10)),
                Text(
                  'Registro',
                  style: _textStyle(bold: false, size: 30, numColor: 1),
                )
              ],
            ),
            Container(
              //color: Colors.amber,
              margin: const EdgeInsets.only(top: 10, left: 25, right: 25),
              width: MediaQuery.of(context).size.width * 0.85,
              height: 272,
              child: Column(
                children: [
                  _textField(field: 'Correo electrónico'),
                  Container(
                      margin: const EdgeInsets.only(top: 17),
                      child: _textFieldPassword(field: 'Contraseña')),
                  Container(
                      margin: const EdgeInsets.only(top: 17),
                      child: _textFieldPasswordConfirm(
                          field: 'Confirmar contraseña')),
                  //const Padding(padding: EdgeInsets.only(top: 25)),
                  Container(
                    margin: const EdgeInsets.only(top: 25),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 40,
                      child: ElevatedButton(
                        onPressed: () async {
                          if (emailAddressController.text.isNotEmpty &&
                              passwordController.text.isNotEmpty &&
                              passwordconfirmController.text.isEmpty) {
                            if (passwordController.text ==
                                passwordconfirmController.text) {
                              bool res = await service.signInFromFb(
                                  emailAddressController.text,
                                  passwordController.text);
                              if (res) {
                                User? user = FirebaseAuth.instance.currentUser;
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: const Text('Exito'),
                                      content: Text(
                                          'Usuario creado con exito ' "\n" +
                                              user!.email.toString()),
                                      actions: [
                                        TextButton(
                                            onPressed: () async {
                                              await service.signOutFromFireb();
                                              Navigator.of(context,
                                                      rootNavigator: true)
                                                  .pop();
                                            },
                                            child: const Text('Ok'))
                                      ],
                                    );
                                  },
                                );
                              } else {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: const Text('Algo anda mal'),
                                      content: const Text(
                                          'Las contraseñas no coinciden'),
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
                                  },
                                );
                              }
                            } else {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: const Text('Error'),
                                    content: const Text(
                                        'Las contraseñas no coinciden'),
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
                                },
                              );
                            }
                          } else {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: const Text('Error'),
                                  content: const Text('Campos vacios'),
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
                              },
                            );
                          }
                        },
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(ColorSelect.orange),
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(3)))),
                        child: Text("Crear cuenta",
                            style:
                                _textStyle(bold: false, size: 25, numColor: 5)),
                      ),
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
              margin: const EdgeInsets.only(top: 15),
              child: Column(
                children: [
                  Text(
                    'O ingrese con',
                    style: _textStyle(bold: false, size: 20, numColor: 3),
                  ),
                  //const Padding(padding: EdgeInsets.only(top: 15)),
                  Container(
                    margin: const EdgeInsets.only(top: 15),
                    //color: Colors.green,
                    width: MediaQuery.of(context).size.width * 0.4,
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
                        child: Container(
                          margin: const EdgeInsets.only(left: 12),
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
                  //const Padding(padding: EdgeInsets.only(top: 10)),
                  Container(
                    margin: const EdgeInsets.only(top: 10),
                    width: MediaQuery.of(context).size.width * 0.4,
                    height: 43,
                    //color: Colors.green,
                    child: ElevatedButton(
                      onPressed: () async {
                        try {
                          //print('button facebook');
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
                          Container(
                            margin: const EdgeInsets.only(right: 10),
                            child: Text('Facebook',
                                style: _textStyle(
                                    bold: false, size: 20, numColor: 5)),
                          ),
                        ],
                      ),
                    ),
                  ),

                  Container(
                    margin: const EdgeInsets.only(top: 10),
                    child: SizedBox(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '¿Ya tienes cuenta?',
                            style:
                                _textStyle(bold: false, size: 12, numColor: 3),
                          ),
                          const SizedBox(width: 12),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const Login()));
                            },
                            child: Text(
                              'Ingresar',
                              style: _textStyle(
                                  bold: false, size: 12, numColor: 1),
                            ),
                          )
                        ],
                      ),
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

  TextField _textFieldPassword({required String field}) {
    return TextField(
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
          hintText: field),
    );
  }

  TextField _textFieldPasswordConfirm({required String field}) {
    return TextField(
      style: _textStyle(bold: false, size: 13, numColor: 1),
      obscureText: _isHide2,
      controller: passwordconfirmController,
      decoration: InputDecoration(
          prefixIcon: IconButton(
            icon: Icon(_isHide2 ? Icons.lock_open : Icons.lock_outline),
            onPressed: () {
              setState(() {
                _isHide2 = !_isHide2;
              });
            },
          ),
          //labelText: field,
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
                            : ColorSelect.blueFacebook,
        fontSize: size,
        fontFamily: 'Hack');
  }
}
