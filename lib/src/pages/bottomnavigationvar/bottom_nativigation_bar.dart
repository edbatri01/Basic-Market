import 'package:flutter/material.dart';

class BottomNativigationBarClass extends StatelessWidget {
const BottomNativigationBarClass({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Container(
      height: 80,
      child: Container(
        padding: const EdgeInsets.only(bottom: 5, left: 20, right: 20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
              onPressed: () {
                
              },
              child: Image.asset(
                'assets/images/home.png',
                width: 40,
                height: 40,
              ),
            ),
            TextButton(
              onPressed: () {
                
              },
              child: Image.asset(
                'assets/images/car.png',
                width: 40,
                height: 40,
              ),
            ),
            TextButton(
              onPressed: () {
                
              },
              child: Image.asset(
                'assets/images/wallet.png',
                width: 40,
                height: 40,
              ),
            ),
            TextButton(
              onPressed: () {
                
              },
              child: Image.asset(
                'assets/images/user.png',
                width: 40,
                height: 40,
              ),
            ),
          ],
        ),
      ),
    );
  }
}