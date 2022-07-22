import 'package:flutter/material.dart';
import 'package:basic_market/src/styles/colors_view.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:basic_market/src/widgets/bottomnavigation.dart';
import 'package:basic_market/src/widgets/detalles_productos.dart';

import 'package:basic_market/src/models/list_details.dart';
import 'package:http/http.dart' as http;

class lista_detalles extends StatefulWidget {
  lista_detalles({Key? key}) : super(key: key);

  @override
  State<lista_detalles> createState() => _lista_detallesState();
}

class _lista_detallesState extends State<lista_detalles> {
  bool _activo = false;
  late TextEditingController _controller;
  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: 'Fiesta enero');
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
  Future <List<ListDetails>> getlista() async{
    final resp = await http.get(Uri.http("192.168.89.81:3000","/list-details/2"));
    return listDetailsFromJson(resp.body);
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
              //Navigation.pop();
            },
          ),
        ),
        title: const Text(
          'Lista',
          style: TextStyle(
            color: ColorSelect.grey2,
          ),
        ),
        actions: <Widget>[
          Container(
            margin: const EdgeInsets.all(5),
            padding: const EdgeInsets.all(0),
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: ColorSelect.blue1),
            child: IconButton(
              icon: SvgPicture.asset(
                'assets/icons/search.svg',
                height: 50,
                width: 50,
              ),
              //tooltip: 'Go to the next page',
              onPressed: () {},
            ),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: Size(double.infinity, 40),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: TextButton(
              child: Row(
                children: [
                  Icon(Icons.location_on, size: 15),
                  Text("Tu destino")
                ],
              ),
              onPressed: null,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  width: 200,
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
                            title:  const Text('Se actualizo el nombre'),
                            content: Text(
                                '$value',style: TextStyle(color: ColorSelect.black)),
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
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: FutureBuilder(
                        future: getlista(),
                        builder: (BuildContext context,
                            AsyncSnapshot<List> snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const CircularProgressIndicator();
                          } else {
                            return detalles_productos(snapshot.data!);
                          }
                        }),
            ),
            
          ],
        ),
      ),
      bottomNavigationBar: bottom_navigation(),
    );
  }
}
