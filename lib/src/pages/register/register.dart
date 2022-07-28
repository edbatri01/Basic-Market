import 'package:basic_market/src/pages/login/login.dart';
import 'package:basic_market/src/styles/colors_view.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:email_validator/email_validator.dart';
import '../../../services/firebase_service.dart';
import '../home/home.dart';
import 'dart:core';
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
  final FirebaseAuth _auth = FirebaseAuth.instance;
  DatabaseReference dbRef = FirebaseDatabase.instance.ref().child("Users");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //resizeToAvoidBottomInset: false,
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
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          reverse: true,
          //physics: const ClampingScrollPhysics(),
          child: SizedBox(
            //margin: const EdgeInsets.only(top: 1),
            //color: ColorSelect.blue1,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            //color: Colors.amberAccent,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 75),
                  child: Column(
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
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    //color: Colors.amber,
                    margin: const EdgeInsets.only(top: 10, left: 25, right: 25),
                    width: MediaQuery.of(context).size.width * 0.85,
                    height: MediaQuery.of(context).size.height,
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
                                    passwordconfirmController.text.isNotEmpty) {
                                  if (passwordController.text ==
                                      passwordconfirmController.text) {
                                    bool flag = EmailValidator.validate(
                                        emailAddressController.text);
                                    if (flag == true) {
                                      registerToFb();
                                      User? user =
                                          FirebaseAuth.instance.currentUser;
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const Login()));
                                    } else {
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            title:
                                                const Text('Email no valido'),
                                            content: Text(
                                              'Email no valido',
                                              style: _textStyle(
                                                  bold: true,
                                                  size: 20,
                                                  numColor: 1),
                                            ),
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
                                          content: Text(
                                              'Las contraseñas no coinciden',
                                              style: _textStyle(
                                                  bold: true,
                                                  size: 20,
                                                  numColor: 1)),
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
                                        content: Text(
                                          'Campos vacios',
                                          style: _textStyle(
                                              bold: true,
                                              size: 15,
                                              numColor: 1),
                                        ),
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
                                  backgroundColor: MaterialStateProperty.all(
                                      ColorSelect.orange),
                                  shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(3)))),
                              child: Text("Crear cuenta",
                                  style: _textStyle(
                                      bold: false, size: 25, numColor: 5)),
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 30),
                          child: Text(
                            'O continue con',
                            style:
                                _textStyle(bold: false, size: 20, numColor: 3),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  //color: Colors.red,
                  margin: const EdgeInsets.only(bottom: 1),
                  child: Column(
                    children: [
                      // Text(
                      //   'O continue con',
                      //   style: _textStyle(bold: false, size: 20, numColor: 3),
                      // ),
                      //const Padding(padding: EdgeInsets.only(top: 15)),
                      Container(
                        // color: Colors.amberAccent,
                        decoration: BoxDecoration(
                            border: Border.all(
                                width: 1.0, color: ColorSelect.grey1)),
                        child: SizedBox(
                          //color: Colors.green,
                          width: MediaQuery.of(context).size.width * 0.5,
                          height: 43,

                          child: InkWell(
                            onTap: () async {
                              try {
                                await service.signInwithGoogle();
                                User? user = FirebaseAuth.instance.currentUser;
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const Home(),
                                        settings: RouteSettings(arguments: {
                                          'id': user!.uid,
                                          'name': user.displayName
                                        })));
                              } catch (e) {
                                if (e is FirebaseAuthException) {
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title: const Text('Algo salio mal'),
                                          content: const Text(
                                              'No fue posible autenticar'),
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
                                margin: const EdgeInsets.only(left: 18),
                                child: Wrap(
                                  crossAxisAlignment: WrapCrossAlignment.center,
                                  children: [
                                    Image.asset(
                                      'assets/images/google-r.png',
                                      width: 35,
                                      height: 35,
                                    ), // <-- Use 'Image.asset(...)' here
                                    const SizedBox(width: 30),
                                    Text('Google',
                                        style: _textStyle(
                                            bold: false,
                                            size: 20,
                                            numColor: 1)),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      //const Padding(padding: EdgeInsets.only(top: 10)),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        child: SizedBox(
                          //color: Colors.amberAccent,
                          width: MediaQuery.of(context).size.width * 0.5,
                          height: 43,
                          //color: Colors.green,
                          child: ElevatedButton(
                            onPressed: () async {
                              try {
                                await service.signInWithFacebook();
                                User? user = FirebaseAuth.instance.currentUser;
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const Home(),
                                        settings: RouteSettings(arguments: {
                                          'id': user!.uid,
                                          'name': user.displayName
                                        })));
                              } catch (e) {
                                if (e is FirebaseAuthException) {
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title: const Text('Algo salio mal'),
                                          content: Text(
                                            'No fue posible autenticar',
                                            style: _textStyle(
                                                bold: true,
                                                size: 20,
                                                numColor: 1),
                                          ),
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
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(3)))),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(left: 10),
                                  child: Image.asset(
                                    'assets/images/facebook.png',
                                    //alignment: Alignment.topRight,
                                    width: 35,
                                    height: 35,
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(left: 20),
                                  child: Text('Facebook',
                                      style: _textStyle(
                                          bold: false, size: 20, numColor: 5)),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      //const Padding(padding: EdgeInsets.only(top: 10)),
                      SizedBox(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '¿Ya tienes cuenta?',
                              style: _textStyle(
                                  bold: false, size: 15, numColor: 3),
                            ),
                            const SizedBox(width: 12),
                            TextButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const Login()));
                                },
                                child: Text(
                                  'Ingresar',
                                  style: _textStyle(
                                      bold: false, size: 15, numColor: 1),
                                ))
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
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

  void registerToFb() {
    var emailAddress = emailAddressController.text;
    var password = passwordController.text;
    if (emailAddress != null && password != null) {
      _auth
          .createUserWithEmailAndPassword(
              email: emailAddressController.text,
              password: passwordController.text)
          .then((result) {
        dbRef.child(result.user!.uid).set({
          "email": emailAddressController.text,
        }).then((res) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => Home()),
          );
        });
      }).catchError((err) {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text(
                  "Error",
                ),
                content: Text(
                  err.message,
                  style: _textStyle(bold: true, size: 15, numColor: 1),
                ),
                actions: [
                  TextButton(
                    child: Text("Ok"),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  )
                ],
              );
            });
      });
    }
  }
}
