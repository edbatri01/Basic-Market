import 'dart:ffi';

import 'package:basic_market/src/styles/colors_view.dart';
import 'package:flutter/material.dart';

class PaymentMethods extends StatefulWidget {
  const PaymentMethods({Key? key}) : super(key: key);

  @override
  _PaymentMethodsState createState() => _PaymentMethodsState();
}

class _PaymentMethodsState extends State<PaymentMethods>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _tabController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        controller: _scrollController,
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            SliverAppBar(
              title: Row(
                children: [
                  IconButton(
                    onPressed: () => {Navigator.pop(context)},
                    icon: const Icon(
                      Icons.arrow_back_ios_new_rounded,
                      color: ColorSelect.black,
                      size: 30,
                    ),
                  ),
                  Text(
                    'Metodos de pago',
                    style: _textStyle(bold: false, size: 25, numColor: 1),
                  ),
                ],
              ),
              backgroundColor: ColorSelect.white,
              pinned: true,
              floating: true,
              forceElevated: innerBoxIsScrolled,
              bottom: TabBar(
                labelStyle: _textStyle(bold: true, size: 17, numColor: 1),
                labelColor: ColorSelect.black,
                unselectedLabelColor: ColorSelect.grey1,
                indicatorColor: ColorSelect.black,
                tabs: const [
                  Tab(
                    text: 'Usar',
                  ),
                  Tab(
                    text: 'Editar',
                  )
                ],
                controller: _tabController,
              ),
            )
          ];
        },
        body: TabBarView(
          children: const [
            Icon(Icons.access_alarm_outlined),
            Icon(Icons.add_card)
          ],
          controller: _tabController,
        ),
      ),
      bottomSheet: Container(
        //color: Colors.red,
        //margin: const EdgeInsets.only(left: 95, right: 80, bottom: 13),
        margin: const EdgeInsets.only(left: 45, bottom: 15),
        height: 50,
        width: MediaQuery.of(context).size.width * 0.8,
        child: ElevatedButton(
          onPressed: () {},
          child: Text(
            'Agregar nuevo método de pago',
            style: _textStyle(bold: false, size: 18, numColor: 5),
          ),
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(ColorSelect.blue1),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)))),
        ),
      ),
    );
  }

  TextStyle _textStyle(
      {required bool bold, required double size, required int numColor}) {
    return TextStyle(
        fontWeight: bold == true ? FontWeight.bold : FontWeight.normal,
        color: numColor == 1
            ? ColorSelect.black
            : numColor == 2
                ? ColorSelect.grey1
                : numColor == 3
                    ? ColorSelect.grey2
                    : numColor == 4
                        ? ColorSelect.grey3
                        : numColor == 5
                            ? ColorSelect.white
                            : numColor == 6
                                ? ColorSelect.blueFacebook
                                : numColor == 7
                                    ? ColorSelect.black2
                                    : ColorSelect.orange,
        fontSize: size,
        fontFamily: 'Hack',
        decoration:
            numColor == 8 ? TextDecoration.underline : TextDecoration.none);
  }
}
