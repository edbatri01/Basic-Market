// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Caroulser extends StatelessWidget {
  var images = [
    'assets/images/letrero1.png',
    'assets/images/letrero2.png',
    'assets/images/letrero3.png'
  ];

  Caroulser({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
        options: CarouselOptions(
          height: 120.0,
          aspectRatio: 16 / 9,
          viewportFraction: 1,
          enableInfiniteScroll: true,
          reverse: false,
          autoPlay: true,
          autoPlayInterval: const Duration(seconds: 3),
          autoPlayAnimationDuration: const Duration(milliseconds: 800),
          autoPlayCurve: Curves.fastOutSlowIn,
          enlargeCenterPage: true,
          //onPageChanged: callbackFunction,
          scrollDirection: Axis.horizontal,
        ),
        items: [
          Image.asset(images[0],
              fit: BoxFit.fill,
              width: MediaQuery.of(context).size.width * 0.8,
              height: 100),
          Image.asset(images[1],
              fit: BoxFit.fill,
              width: MediaQuery.of(context).size.width * 0.8,
              height: 120),
          Image.asset(images[2],
              fit: BoxFit.fill,
              width: MediaQuery.of(context).size.width * 0.8,
              height: 100)
        ]);
  }
}
