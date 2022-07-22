import 'package:flutter/material.dart';
import 'package:basic_market/src/styles/colors_view.dart';

class encurso_list extends StatefulWidget {
  encurso_list(this.lista);
  final List<dynamic> lista;

  @override
  State<encurso_list> createState() => _encurso_listState();
}

class _encurso_listState extends State<encurso_list> {
  
  String radioItem="";
  bool active=false;
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
                  children: [Text(widget.lista[index].name.toString(), style: TextStyle(color: ColorSelect.black, fontWeight: FontWeight.bold, fontSize: 20)),
                  Radio<dynamic>(
                    activeColor: ColorSelect.aquaGreen,
                    value: widget.lista[index].name.toString(),
                    groupValue: radioItem,
                    onChanged: (value) {
                      setState((){
                        radioItem= value;
                      });
                      ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Lista $value  seleccionada')));
                    },
                  )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                    children: [
                      Text("Precio total:", style: TextStyle(color: ColorSelect.grey2, fontWeight: FontWeight.bold, fontSize: 15)),
                      Text("\$ 2,321", style: TextStyle(color: ColorSelect.black, fontWeight: FontWeight.bold, fontSize: 20)),
                    ],
                  ),
                  Column(
                    children: [
                      Text("Total de articulos:", style: TextStyle(color: ColorSelect.grey2, fontWeight: FontWeight.bold, fontSize: 15)),
                      Text("21", style: TextStyle(color: ColorSelect.black, fontWeight: FontWeight.bold, fontSize: 20)),
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
                        //   Navigator.push(
                        //   context,
                        //   MaterialPageRoute(builder: (context) => onboard_3()),
                        // );
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
