import 'package:flutter/material.dart';
import 'package:basic_market/src/styles/colors_view.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:basic_market/src/widgets/encurso_list.dart';
import 'package:basic_market/src/widgets/bottomnavigation.dart';
import 'package:basic_market/src/models/listas.dart';
import 'package:http/http.dart' as http;

class listas_page extends StatefulWidget {
  listas_page({Key? key}) : super(key: key);
  
  @override
  State<listas_page> createState() => _listas_pageState();
}

class _listas_pageState extends State<listas_page> {
Future <List<Listas>> getlista() async{
    final resp = await http.get(Uri.http("192.168.89.81:3000","/list/list/2"));
    return listasFromJson(resp.body);
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
          actions: <Widget>[
            Container(
              margin: const EdgeInsets.all(5),
              padding:const EdgeInsets.all(0),
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color:  ColorSelect.blue1),
              child: IconButton(
                icon: SvgPicture.asset(
                  'assets/icons/search.svg',
                  height: 50,
                  width: 50,
                ),
                tooltip: 'Go to the next page',
                onPressed: () {},
              ),
            ),
          ],
          bottom: const TabBar(
            indicatorColor: ColorSelect.blue2,
            indicatorWeight: 4.0,
            labelColor: ColorSelect.blue2,
            unselectedLabelColor: ColorSelect.grey1,
            tabs: [
              Tab(
                text: 'En curso'
                 ),
              Tab(
                child: Text("Completados",style: TextStyle())
                ),
            ],),
        ),
        body: TabBarView(
          children: [
            Column(
              children: [
                Container(
                  height: 550,
                  child: FutureBuilder(
                            future: getlista(),
                            builder: (BuildContext context,
                                AsyncSnapshot<List> snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return const CircularProgressIndicator();
                              } else {
                                return encurso_list(snapshot.data!);
                              }
                            }),
                ),
              ],
            ),
            
              Center(child: Text("Desabilitado")),
              ]
              ),
              bottomNavigationBar: bottom_navigation(),
      ),
    );
  }
}
