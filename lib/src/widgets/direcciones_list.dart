import 'package:flutter/material.dart';
import 'package:basic_market/src/styles/colors_view.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart' as http;
import 'package:basic_market/src/pages/direcciones_page.dart';

class direcciones_list extends StatefulWidget {
  direcciones_list(this.lista);
  final List<dynamic> lista;

  @override
  State<direcciones_list> createState() => _direcciones_listState();
}

class _direcciones_listState extends State<direcciones_list> {
  
  String radioItem="";
  Future  activo(id,id_user) async{
    await http.put(Uri.http("listas-lb2-1279206548.us-east-1.elb.amazonaws.com","/inactivo/$id_user"));
    await http.put(Uri.http("listas-lb2-1279206548.us-east-1.elb.amazonaws.com","/activo/$id"));
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
            height: 70,
            width: 300,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              SvgPicture.asset('assets/icons/verde_direccion.svg',),  
              Container(
                width: 250,
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  crossAxisAlignment:CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(widget.lista[index].name.toString(), style: TextStyle(color: ColorSelect.black, fontWeight: FontWeight.bold, fontSize: 20)),
                        widget.lista[index].activo.toString()=="activo"? 
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                       decoration: BoxDecoration(
                  color: ColorSelect.grey1,
                  borderRadius: const BorderRadius.all(Radius.circular(5))),
                        child:
                        Text("Activo",style: TextStyle(color:Colors.white)),
                    )
                    : Container(),
                      ],
                    ),
                    SizedBox(height: 10,),
                    Row(children: [
                      Text(widget.lista[index].postal.toString(), style:TextStyle(color: ColorSelect.grey2)),
                      Text(" "),
                      Expanded(child: Text(widget.lista[index].detalles.toString(), style:TextStyle(color: ColorSelect.grey2,overflow: TextOverflow.ellipsis,)))
                    ],)
                  ],
                ),
              ),
              Expanded(
               
                child: Radio<dynamic>(
                  activeColor: ColorSelect.blue2,
                  value: widget.lista[index].name.toString(),
                  groupValue: radioItem,
                  onChanged: (value) {
                    activo(widget.lista[index].idDirecciones.toString(),widget.lista[index].idUser.toString());
                    setState((){
                      radioItem = value;
                    });
                    ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Direccion $value  seleccionada')));
                    //Navigator.push(context, MaterialPageRoute(builder: (context) => direcciones_page()));
                  },
                ),
              )
              ],
            ),
          ),
        ),
      );}
    );
   
  }
}
