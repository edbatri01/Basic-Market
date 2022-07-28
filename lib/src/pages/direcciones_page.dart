import 'package:flutter/material.dart';
import 'package:basic_market/src/styles/colors_view.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:basic_market/src/widgets/direcciones_list.dart';
import 'package:basic_market/src/widgets/bottomnavigation.dart';
import 'package:basic_market/src/models/direcciones.dart';
import 'package:http/http.dart' as http;

class direcciones_page extends StatefulWidget {
  direcciones_page({Key? key}) : super(key: key);
  
  @override
  State<direcciones_page> createState() => _direcciones_pageState();
}

class _direcciones_pageState extends State<direcciones_page> {
Future <List<Direcciones>> getlista() async{
    final resp = await http.get(Uri.http("listas-lb2-1279206548.us-east-1.elb.amazonaws.com","/user/2"));
    return direccionesFromJson(resp.body);
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
                Navigator.pop(context);
              },
            ),
          ),
          title: const Text(
            'Direcciones de envio',
            style: TextStyle(
              color: ColorSelect.grey2,
            ),
          ),
          
          bottom: const TabBar(
            indicatorColor: ColorSelect.blue2,
            indicatorWeight: 4.0,
            labelColor: ColorSelect.blue2,
            unselectedLabelColor: ColorSelect.grey1,
            tabs: [
              Tab(
                text: 'Direcciones a usar'
                 ),
              Tab(
                child: Text("Editar",style: TextStyle())
                ),
            ],),
        ),
        body: TabBarView(
          children: [
            Column(
              children: [
                Container(
                  height: 550,
                  width: 400,
                  child: FutureBuilder(
                            future: getlista(),
                            builder: (BuildContext context,
                                AsyncSnapshot<List> snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return const CircularProgressIndicator();
                              } else {
                                return direcciones_list(snapshot.data!);
                              }
                            }),
                ),
              ],
            ),
            
              Center(child: Text("Desabilitado")),
              ]
              ),
              //bottomNavigationBar: bottom_navigation(),
      ),
    );
  }
}
