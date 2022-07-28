import 'package:basic_market/src/styles/colors_view.dart';
import 'package:flutter/material.dart';

class Categories extends StatelessWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
        direction: Axis.horizontal,
        spacing: 5.0,
        children: List.generate(9, (index) {
          return Column(
            children: [
              Container(
                height: 50,
                width: MediaQuery.of(context).size.width * 0.2,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: ColorSelect.grey1,
                ),
                child: Image.asset('assets/images/car2.png'),
              ),
              Text(
                'Jugueteria y deportes',
                style: _textStyle(bold: true, size: 12, numColor: 3),
              )
            ],
          );
        }));
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
