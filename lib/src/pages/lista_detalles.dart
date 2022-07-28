import 'package:basic_market/src/pages/bottomnavigationvar/bottom_nativigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:basic_market/src/styles/colors_view.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:basic_market/src/widgets/bottomnavigation.dart';
import 'package:basic_market/src/widgets/detalles_productos.dart';
import 'package:basic_market/src/pages/direcciones_page.dart';

import 'package:basic_market/src/models/list_details.dart';
import 'package:basic_market/src/models/direcciones.dart';
import 'package:http/http.dart' as http;

class lista_detalles extends StatefulWidget {
  lista_detalles(
      {Key? key,
      required this.id,
      required this.lista,
      required this.total,
      required this.cantidad})
      : super(key: key);
  String? id;
  String? lista;
  String? total;
  String? cantidad;
  @override
  State<lista_detalles> createState() => _lista_detallesState(
      id: id!, lista: lista, total: total!, cantidad: cantidad!);
}

class _lista_detallesState extends State<lista_detalles> {
  _lista_detallesState(
      {required this.id,
      required this.lista,
      required this.total,
      required this.cantidad});
  String? id;
  String? lista;
  String? total;
  String? cantidad;
  String? direccion;
  bool _activo = false;
  late TextEditingController _controller;
  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: lista);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void estado() {
    setState(() {
      _activo == false ? _activo = true : _activo = false;
    });
  }

  Future<List<Detallesproductos>> getlista() async {
    final resp = await http.get(Uri.http(
        "listas-lb2-1279206548.us-east-1.elb.amazonaws.com",
        "/list-details/products/$id"));
    print(resp);
    return detallesproductosFromJson(resp.body);
  }

  Future<List<Direcciones>> getDireccion() async {
    const id_direccion = 2;
    final resp = await http.get(Uri.http(
        "listas-lb2-1279206548.us-east-1.elb.amazonaws.com",
        "/list-details/products/$id_direccion"));
    return direccionesFromJson(resp.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: Container(
          child: IconButton(
            color: ColorSelect.grey2,
            icon: SvgPicture.asset('assets/icons/navigate_before.svg'),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        title: const Text(
          'Lista',
          style: TextStyle(
            color: ColorSelect.grey2,
          ),
        ),
        // actions: <Widget>[
        //   Container(
        //     margin: const EdgeInsets.all(5),
        //     padding: const EdgeInsets.all(0),
        //     decoration: const BoxDecoration(
        //         borderRadius: BorderRadius.all(Radius.circular(10)),
        //         color: ColorSelect.blue1),
        //     child: IconButton(
        //       icon: SvgPicture.asset(
        //         'assets/icons/search.svg',
        //         height: 50,
        //         width: 50,
        //       ),
        //       //tooltip: 'Go to the next page',
        //       onPressed: () {},
        //     ),
        //   ),
        // ],
        // bottom: PreferredSize(
        //   preferredSize: const Size(double.infinity, 40),
        //   child: Padding(
        //     padding: EdgeInsets.symmetric(horizontal: 10),
        //     // child: TextButton(
        //     //   child: Row(
        //     //     children: const [
        //     //       Icon(
        //     //         Icons.location_on,
        //     //         size: 15,
        //     //         color: ColorSelect.grey2,
        //     //       ),
        //     //       Text("Direcciones",
        //     //           style: TextStyle(color: ColorSelect.grey2))
        //     //     ],
        //     //   ),
        //     //   onPressed: () {
        //     //     Navigator.push(context,
        //     //         MaterialPageRoute(builder: (_) => direcciones_page()));
        //     //   },
        //     // ),
        //   ),
        // ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      //margin: const EdgeInsets.only(top: 1),
                      color: Colors.amberAccent,
                      width: MediaQuery.of(context).size.width * 0.4,
                      height: 40,
                      child: TextField(
                        enabled: _activo,
                        controller: _controller,
                        decoration: null,
                        style: TextStyle(color: ColorSelect.black),
                        //onTap: (){estado();},
                        onSubmitted: (String value) async {
                          await showDialog<void>(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: const Text('Se actualizo el nombre'),
                                content: Text('$value',
                                    style: TextStyle(color: ColorSelect.black)),
                                actions: <Widget>[
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: const Text('OK'),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                      ),
                    ),
                    //Text("Fiesta enero"),
                    IconButton(
                        onPressed: () {
                          estado();
                        },
                        //iconSize: 50,
                        icon: SvgPicture.asset(
                          'assets/icons/square-edit.svg',
                          height: 30,
                        )),
                  ],
                ),
                Container(
                  color: Colors.red,
                  height: MediaQuery.of(context).size.height * 0.55,
                  width: MediaQuery.of(context).size.width,
                  child: FutureBuilder(
                      future: getlista(),
                      builder:
                          (BuildContext context, AsyncSnapshot<List> snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                              child: CircularProgressIndicator());
                        } else {
                          return detalles_productos(snapshot.data!);
                        }
                      }),
                ),
                Container(
                    child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: Column(
                    children: [
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                const Text("Total:",
                                    style: TextStyle(
                                        color: ColorSelect.grey2,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15)),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(total == "null" ? "0" : "$total",
                                    style: TextStyle(
                                        color: ColorSelect.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18)),
                              ],
                            ),
                            Column(
                              children: [
                                Text("Productos:",
                                    style: TextStyle(
                                        color: ColorSelect.grey2,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15)),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text("$cantidad",
                                    style: TextStyle(
                                        color: ColorSelect.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18)),
                              ],
                            )
                          ]),
                      Container(
                        color: Colors.blueAccent,
                        width: MediaQuery.of(context).size.width,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: ColorSelect.blue2,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(7))),
                          onPressed: () {
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //       builder: (_) => lista_detalles(

                            //           )));
                          },
                          child: Text('Continuar para pagar',
                              style: TextStyle(fontSize: 20)),
                        ),
                      ),
                    ],
                  ),
                ))
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNativigationBarClass(),
    );
  }
}
