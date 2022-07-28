import 'package:basic_market/src/pages/principal/after_onboarding.dart';
import 'package:flutter/material.dart';

import '../../../services/firebase_service.dart';
import '../home/home.dart';
import 'package:firebase_auth/firebase_auth.dart';

class BottomNativigationBarClass extends StatelessWidget {
  BottomNativigationBarClass({Key? key}) : super(key: key);
  final User? user = FirebaseAuth.instance.currentUser;
  FirebaseService service = FirebaseService();

  @override
  Widget build(BuildContext context) {
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
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Home(),
                        settings: RouteSettings(arguments: {
                          'id': user!.uid,
                          'name': user!.displayName
                        })));
              },
              child: Image.asset(
                'assets/images/home.png',
                width: 40,
                height: 40,
              ),
            ),
            TextButton(
              onPressed: () {},
              child: Image.asset(
                'assets/images/car.png',
                width: 40,
                height: 40,
              ),
            ),
            // TextButton(
            //   onPressed: () {

            //   },
            //   child: Image.asset(
            //     'assets/images/wallet.png',
            //     width: 40,
            //     height: 40,
            //   ),
            // ),
            TextButton(
              onPressed: () {
                service.signOutFromFacebook();
                service.signOutFromFireb();
                service.signOutFromGoogle();
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const AfterOnBoarding()),
                );
              },
              child: Image.asset(
                'assets/images/logout.png',
                width: 50,
                height: 50,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
