import 'package:basic_market/services/firebase_service.dart';
import 'package:basic_market/src/pages/home/home.dart';
import 'package:basic_market/src/pages/login/login.dart';
import 'package:basic_market/src/pages/register/register.dart';
import 'package:basic_market/src/styles/colors_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/src/material/ink_decoration.dart';
// import 'package:flutter/cupertino.dart';

class AfterOnBoarding extends StatefulWidget {
  const AfterOnBoarding({Key? key}) : super(key: key);

  @override
  _AfterOnBoarding createState() => _AfterOnBoarding();
}

class _AfterOnBoarding extends State<AfterOnBoarding> {
  FirebaseService service = FirebaseService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: SizedBox(
          //margin: const EdgeInsets.only(top: 40),
          //color: ColorSelect.white,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          //color: Colors.amberAccent,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  margin: const EdgeInsets.only(top: 80),
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/images/basic_market_logo.png',
                        fit: BoxFit.fill,
                        //width: 200,
                        height: 80,
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 10),
                        child: Text(
                          'Vamos a empezar',
                          style: _textStyle(bold: false, size: 30, numColor: 1),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  //color: Colors.red,
                  margin: const EdgeInsets.only(top: 50),
                  child: Column(
                    children: [
                      //const Padding(padding: EdgeInsets.only(top: 15)),
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                                width: 1.0, color: ColorSelect.grey1)),
                        //color: Colors.green,
                        width: MediaQuery.of(context).size.width * 0.75,
                        height: MediaQuery.of(context).size.height * 0.06,
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
                              margin: const EdgeInsets.only(left: 12),
                              child: Wrap(
                                crossAxisAlignment: WrapCrossAlignment.center,
                                children: [
                                  Image.asset(
                                    'assets/images/google-r.png',
                                    //width: 35,
                                    height: 35,
                                  ), // <-- Use 'Image.asset(...)' here
                                  const SizedBox(width: 12),
                                  Text('Continua con Google',
                                      style: _textStyle(
                                          bold: false, size: 20, numColor: 1)),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      // const Padding(padding: EdgeInsets.only(top: 25)),
                      Container(
                        //color: Colors.amberAccent,
                        //padding: const EdgeInsets.only(top: 10),
                        margin: const EdgeInsets.only(top: 25),
                        width: MediaQuery.of(context).size.width * 0.75,
                        height: MediaQuery.of(context).size.height * 0.06,
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
                                          e.toString(),
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
                                      borderRadius: BorderRadius.circular(3)))),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Image.asset(
                                'assets/images/facebook.png',
                                //alignment: Alignment.topRight,
                                //width: 35,
                                height: 35,
                              ),
                              Container(
                                  margin: const EdgeInsets.only(right: 10)),
                              Text('Continua con Facebook',
                                  style: _textStyle(
                                      bold: false, size: 20, numColor: 5)),
                            ],
                          ),
                        ),
                      ),

                      Container(
                        //color: Colors.red,
                        margin: const EdgeInsets.only(top: 60),
                        child: Text(
                          'También puede',
                          textAlign: TextAlign.center,
                          style: _textStyle(bold: true, size: 20, numColor: 3),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                //color: Colors.amber,
                margin: const EdgeInsets.only(top: 25, left: 25, right: 25),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.11,
                child: Column(
                  children: [
                    const Padding(padding: EdgeInsets.only(top: 15)),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Register(),
                          ),
                        );
                      },
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(ColorSelect.orange),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(3)))),
                      child: Text("Registrarse con correo electrónico",
                          style:
                              _textStyle(bold: false, size: 20, numColor: 5)),
                    ),
                    //const Padding(padding: EdgeInsets.only(top: 15)),
                  ],
                ),
              ),
              //const Padding(padding: EdgeInsets.only(top: 50)),
              Container(
                //color: Colors.green,
                width: MediaQuery.of(context).size.width * 0.6,
                height: 35,
                margin: const EdgeInsets.only(top: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '¿Ya tienes cuenta?',
                      style: _textStyle(bold: false, size: 15, numColor: 3),
                    ),
                    const SizedBox(width: 8),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Login()));
                      },
                      child: Text(
                        'Ingresar',
                        style: _textStyle(bold: true, size: 15, numColor: 1),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      //bottomNavigationBar: Container(),
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
