import 'package:flutter/material.dart';
import 'package:basic_market/src/styles/colors_view.dart';
import 'package:basic_market/src/pages/listas_pages.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart' as http;
import 'package:cached_network_image/cached_network_image.dart';
import 'dart:convert';


class detalles_productos extends StatefulWidget {
  detalles_productos(this.lista);
  final List<dynamic> lista;
  
  @override
  State<detalles_productos> createState() => _detalles_productosState();
}

class _detalles_productosState extends State<detalles_productos> {
      int _cantidad = 1;
      bool activo=false;
  @override
  void initState() {
    super.initState();
    
  }
   void estado(_cantidad, precio) {
    double _subt=0;
    return _subt =_cantidad*precio;
  }
  Future  delete(id) async{
    final resp = await http.delete(Uri.http("listas-lb2-1279206548.us-east-1.elb.amazonaws.com","/list-details/delete/$id"));
     if (resp.statusCode == 200){
    Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => listas_page()),
  );
     }
  }
  Future update(url,id,cantidad) async {
  
  final respuesta = await http.put(
    Uri.parse(url+"$id"),
    headers: {"Content-Type": "application/json"},
    body: cantidad
  );
  if (respuesta.statusCode == 200){
    Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => listas_page()),
  );
    }
  
 
}
  @override
  Widget build(BuildContext context) {
      
    return ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: widget.lista.length,
      itemBuilder: (BuildContext context, int index) {
      return Container(
        height: 180,
        //padding: EdgeInsets.all(5),
        child: Card(
          elevation: 5,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: Row(
              children: [
                Center(
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(bottom: 5),
                        padding: EdgeInsets.all(3),
                        child: 
                       
                        Text(widget.lista[index].tienda.toString(),
                            style:const TextStyle(color: ColorSelect.blue2)),
                        decoration: BoxDecoration(
                            border: Border.all(color: ColorSelect.blue2),
                            borderRadius:
                              const  BorderRadius.all(Radius.circular(5))),
                      ),
                      CachedNetworkImage(
                        imageUrl:"https://www.lala.com.mx/storage/app/uploads/public/619/53e/171/61953e17101d4577539015.png",
                        width: 100,
                        placeholder: (context, url) => Center(child: CircularProgressIndicator()),
                        errorWidget: (context, url, error) => Center(child: Icon(Icons.error)),
                ),
                    ],
                  ),
                ),
                Container(
    
                  child: Expanded(
                    child: Column(children: [
                      Expanded(
                        child: Row(
                          children: [
                            Container(
                              width: 100,
                              child: Text(widget.lista[index].name.toString(),
                                  textAlign: TextAlign.center),
                            ),
                            Expanded(
    
                              child: Padding(
                                padding: const EdgeInsets.only(left: 15),
                                child: Column(
                                  
                                  children: [
                                    Expanded(
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            height: 31,
                                            width: 40,
                                            decoration: const BoxDecoration(
                                                borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(8),
                                                  bottomLeft: Radius.circular(8),
                                                ),
                                                color: ColorSelect.grey1),
                                            child: IconButton(
                                                onPressed: () {
                                                  setState(() {
                                                    _cantidad ==1? _cantidad=1:
                                                    _cantidad -= 1;
                                                  });
                                                },
                                                iconSize: 18,
                                                icon: Icon(Icons.remove)),
                                          ),
                                          Container(
                                            height: 31,
                                            width: 40,
                                            decoration:const BoxDecoration(
                  
                                                color: ColorSelect.grey1),
                                            child: Center(child: Text( activo==false? widget.lista[index].cantidad.toString():"$_cantidad"))
                                            ),
                                          Container(
                                            height: 31,
                                            width: 40,
                                            decoration:const BoxDecoration(
                                                borderRadius: BorderRadius.only(
                                                  topRight: Radius.circular(8),
                                                  bottomRight: Radius.circular(8),
                                                ),
                                                color: ColorSelect.grey1),
                                            child: IconButton(
                                                onPressed: () {
                                                  setState(() {
                                                    if(activo==false){
                                                    activo=true;
                                                    _cantidad=widget.lista[index].cantidad;
                                                    }
                                                    _cantidad += 1;
                                                  });
                                                },
                                                iconSize: 18,
                                                icon: Icon(Icons.add)),
                                          ),
                                        ],
                                      ),
                                    ),
                                    
                                    Expanded(child: Center(child: Row(
                                      children: [
                                        Text("Subtotal = \$ ",style: TextStyle(fontSize: 15)),
                                        Text((widget.lista[index].cantidad*widget.lista[index].price).toString(),style: TextStyle(fontSize: 15)),
                                         
                                      ],
                                    )))
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              minimumSize: Size(80, 30),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.0)),
                              //padding: EdgeInsets.symmetric(vertical: 2,horizontal:10),
                              elevation: 0,
                              primary: ColorSelect.aquaGreen),
                          onPressed: () {
                            Map json = {
                                         
                                          "cantidad":_cantidad,

                                       };
                                       var cantidad = JsonEncoder().convert(json);
                                      update("listas-lb2-1279206548.us-east-1.elb.amazonaws.com/list-details/update/",widget.lista[index].idListDetails,cantidad);
                          },
                          child: Text('Actualizar'),
                        ),
                        SizedBox(width: 20),
                        OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.0)),
                            minimumSize: Size(80, 30),
                            side:
                                BorderSide(width: 2, color: ColorSelect.black),
                          ),
                          onPressed: () {
                            delete(widget.lista[index].idListDetails);
                          },
                          child: Text('Eliminar',
                              style: TextStyle(color: ColorSelect.black)),
                        )
                      ])
                    ]),
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
