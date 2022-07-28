import 'package:flutter/material.dart';
import 'package:basic_market/src/styles/colors_view.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:basic_market/src/widgets/encurso_list.dart';
import 'package:basic_market/src/widgets/bottomnavigation.dart';
import 'package:basic_market/src/pages/listas_pages.dart';
import 'dart:convert';
import 'package:basic_market/src/models/listas.dart';
import 'package:http/http.dart' as http;

class listas_page extends StatefulWidget {
  listas_page({Key? key}) : super(key: key);

  @override
  State<listas_page> createState() => _listas_pageState();
}

class _listas_pageState extends State<listas_page> {
  Future<List<Listas>> getlista() async {
    const id = 2;
    final resp =await http.get(Uri.http("listas-lb2-1279206548.us-east-1.elb.amazonaws.com", "/list/user/$id"));
    return listasFromJson(resp.body);
  }
  Future<List<Listas>> getactivo() async {
    const id = 2;
    final resp =await http.get(Uri.http("listas-lb2-1279206548.us-east-1.elb.amazonaws.com", "/list/user-active/$id"));
    return listasFromJson(resp.body);
  }
Future lista_new(url,lista) async {
  const id = 2;
  final resp =await http.put(Uri.http("listas-lb2-1279206548.us-east-1.elb.amazonaws.com", "/list/inactivo/$id"));
    if(resp.statusCode==200){
      final respuesta = await http.post(
    Uri.parse(url),
    headers: {"Content-Type": "application/json"},
    body: lista
  );
  if (respuesta.statusCode == 201){
    Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => listas_page()),
  );
    }
  
  }
}
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
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
            'Listas de compras',
            style: TextStyle(
              color: ColorSelect.grey2,
            ),
          ),
          // actions: <Widget>[
          //   Container(
          //     margin: const EdgeInsets.all(5),
          //     padding:const EdgeInsets.all(0),
          //     decoration: const BoxDecoration(
          //         borderRadius: BorderRadius.all(Radius.circular(10)),
          //         color:  ColorSelect.blue1),
          //     child: IconButton(
          //       icon: SvgPicture.asset(
          //         'assets/icons/search.svg',
          //         height: 50,
          //         width: 50,
          //       ),
          //       tooltip: 'Go to the next page',
          //       onPressed: () {},
          //     ),
          //   ),
          // ],
          bottom: const TabBar(
            indicatorColor: ColorSelect.blue2,
            indicatorWeight: 4.0,
            labelColor: ColorSelect.blue2,
            unselectedLabelColor: ColorSelect.grey1,
            tabs: [
              Tab(text: 'En curso'),
              Tab(child: Text("Completados", style: TextStyle())),
            ],
          ),
        ),
        body: TabBarView(children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: 160,
                  child: FutureBuilder(
                      future: getactivo(),
                      builder:
                          (BuildContext context, AsyncSnapshot<List> snapshot) {
                        if (snapshot.connectionState == ConnectionState.waiting) {
                          return const Center(child: CircularProgressIndicator());
                        } else {
                          return encurso_list(snapshot.data!);
                        }
                      }),
                ),
                Container(
                  height: 355,
                  child: FutureBuilder(
                      future: getlista(),
                      builder:
                          (BuildContext context, AsyncSnapshot<List> snapshot) {
                        if (snapshot.connectionState == ConnectionState.waiting) {
                          return const CircularProgressIndicator();
                        } else {
                          return encurso_list(snapshot.data!);
                        }
                      }),
                ),
                Center(
                  child: Container(
                    width: 380,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: ColorSelect.blue2,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))),
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: const Text('Nueva lista'),
                                content: Container(
                                  height:40,
                                  child: TextField(
                                     controller: _controller,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                    ),
                                    style: TextStyle(color: ColorSelect.black, fontSize: 18)
                                  ),
                                ),
                                actions: <Widget>[
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.pop(context, 'Cancelar'),
                                    child: const Text('Cancelar'),
                                  ),
                                  TextButton(
                                    onPressed: (){
                                        Map json = {
                                          "name":_controller.text,
                                          "user_id":2,
                                          "activo":1
                                       };
                                       var lista = JsonEncoder().convert(json);
                                       lista_new("http://listas-lb2-1279206548.us-east-1.elb.amazonaws.com/list/new",lista);
                                    },
                                    child: const Text('OK'),
                                  ),
                                ],
                              );
                            });
                      },
                      child: Text('Nueva lista de compra',
                          style: TextStyle(fontSize: 15)),
                    ),
                  ),
                )
              ],
            ),
          ),
          Center(child: Text("Desabilitado")),
        ]),
        bottomNavigationBar: bottom_navigation(),
      ),
    );
  }
}
