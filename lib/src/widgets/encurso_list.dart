import 'package:flutter/material.dart';
import 'package:basic_market/src/styles/colors_view.dart';
import 'package:basic_market/src/pages/lista_detalles.dart';
import 'package:basic_market/src/pages/listas_pages.dart';
import 'package:http/http.dart' as http;
class encurso_list extends StatefulWidget {
  encurso_list(this.lista);
  final List<dynamic> lista;

  @override
  State<encurso_list> createState() => _encurso_listState();
}

class _encurso_listState extends State<encurso_list> {
  
  String radioItem="";
  bool active=false;
  Future update(id) async {
  const id = 2;
  final resp =await http.put(Uri.http("listas-lb2-1279206548.us-east-1.elb.amazonaws.com", "/list/inactivo/$id"));
    if(resp.statusCode==200){
      final respuesta =await http.put(Uri.http("listas-lb2-1279206548.us-east-1.elb.amazonaws.com", "/list/activo/$id"));
      if (respuesta.statusCode == 200){
        Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => listas_page()),
          );
      }
  
  }
}
   
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: widget.lista.length,
      itemBuilder: (BuildContext context, int index) {
      return Card(
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Container(
            height: 150,
            width: 320,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  Text(widget.lista[index].name.toString(), style: TextStyle(color: ColorSelect.black, fontWeight: FontWeight.bold, fontSize: 20)),
                  Row(
                    children: [
                      widget.lista[index].activo.toString()=="1"? 
                    Container(
                      padding:const EdgeInsets.symmetric(horizontal: 10),
                       decoration:const BoxDecoration(
                  color: ColorSelect.grey1,
                  borderRadius:  BorderRadius.all(Radius.circular(5))),
                        child:
                       const Text("Activo",style: TextStyle(color:Colors.white)),
                    )
                    : Container(),
                  Radio<dynamic>(
                    activeColor: ColorSelect.aquaGreen,
                    value: widget.lista[index].name.toString(),
                    groupValue: radioItem,
                    onChanged: (value) {
                      setState((){
                        radioItem= value;
                        update(widget.lista[index].idlistProducts);
                      });
                      ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Lista $value  seleccionada')));
                    },
                  )
                    ],
                  )
                  
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                    children: [
                      Text("Precio total:", style: TextStyle(color: ColorSelect.grey2, fontWeight: FontWeight.bold, fontSize: 15)),
                      Row(
                        children: [
                          Text("\$", style: TextStyle(color: ColorSelect.black, fontWeight: FontWeight.bold, fontSize: 20)),
                          Text(widget.lista[index].precioLista==null?
                          "0":widget.lista[index].precioLista.toString()
                          , style: TextStyle(color: ColorSelect.black, fontWeight: FontWeight.bold, fontSize: 20)),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text("Total de articulos:", style: TextStyle(color: ColorSelect.grey2, fontWeight: FontWeight.bold, fontSize: 15)),
                      Text(widget.lista[index].productosC.toString(), style: TextStyle(color: ColorSelect.black, fontWeight: FontWeight.bold, fontSize: 20)),
                    ],
                  ),
                  ],
                ),
                
                Center(
                  child: Container(
                    margin: EdgeInsets.only(top: 10),
                    height: 35,
                    width: 250,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          
                          primary: ColorSelect.blue2,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(7))
                          ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => lista_detalles(
                                  id:widget.lista[index].idlistProducts.toString(),
                                  lista:widget.lista[index].name.toString(),
                                  total:widget.lista[index].precioLista.toString(),
                                  cantidad: widget.lista[index].productosC.toString(),
                                  )));
                      },
                      child: Text('Ver lista',style: TextStyle(fontSize:18)),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );}
    );
   
  }
}
