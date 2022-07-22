import 'package:flutter/material.dart';
import 'package:basic_market/src/styles/colors_view.dart';
import 'package:basic_market/src/models/list_details.dart';
import 'package:flutter_svg/flutter_svg.dart';


class detalles_productos extends StatefulWidget {
  detalles_productos(this.lista);
  final List<dynamic> lista;
  @override
  State<detalles_productos> createState() => _detalles_productosState();
}

class _detalles_productosState extends State<detalles_productos> {
  int _cantidad = 1;
  //Future <List<ListDetails>> _lista;
  
   void estado(_cantidad, precio) {
    double _subt=0;
    return _subt =_cantidad*precio;
  }
  
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
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
                        child: Text(widget.lista[index].idShop.toString(),
                            style: TextStyle(color: ColorSelect.blue2)),
                        decoration: BoxDecoration(
                            border: Border.all(color: ColorSelect.blue2),
                            borderRadius:
                                BorderRadius.all(Radius.circular(5))),
                      ),
                      Image.network(
                  widget.lista[index].urlImage.toString(),
                  width: 100,
            
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
                              child: Text(widget.lista[index].productName.toString(),
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
                                            decoration: BoxDecoration(
                                                
                                                color: ColorSelect.grey1),
                                            child: Center(child: Text("$_cantidad"))
                                            ),
                                          Container(
                                            height: 31,
                                            width: 40,
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.only(
                                                  topRight: Radius.circular(8),
                                                  bottomRight: Radius.circular(8),
                                                ),
                                                color: ColorSelect.grey1),
                                            child: IconButton(
                                                onPressed: () {
                                                  setState(() {
                                                    _cantidad += 1;
                                                  });
                                                },
                                                iconSize: 18,
                                                icon: Icon(Icons.add)),
                                          ),
                                        ],
                                      ),
                                    ),
                                    
                                    Expanded(child: Center(child: Text("Subtotal = \$ ",style: TextStyle(fontSize: 15))))
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
                          onPressed: () {},
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
                          onPressed: () {},
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
