

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter/material.dart';


class FirebaseService  {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  DatabaseReference dbRef = FirebaseDatabase.instance.reference().child("Users");

  Future<String?> signInwithGoogle() async {
    try {
      final GoogleSignInAccount? googleSignInAccount =
          await _googleSignIn.signIn();
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount!.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );
      await _auth.signInWithCredential(credential);
    } on FirebaseAuthException catch (e) {
      print(e.message);
      throw e;
    }
  }

  Future<void> signOutFromGoogle() async {
    await _googleSignIn.signOut();
    await _auth.signOut();
  }

  Future<UserCredential> signInWithFacebook() async {
    print('Estoy en el future de facebook');
    final LoginResult result = await FacebookAuth.instance.login();

    final OAuthCredential facebookCredential =
        FacebookAuthProvider.credential(result.accessToken!.token);

    return FirebaseAuth.instance.signInWithCredential(facebookCredential);
    //   try {
    //   final LoginResult result = await FacebookAuth.instance.login();
    // switch (result.status) {
    //   case LoginStatus.success:
    //     final AuthCredential facebookCredential =
    //         FacebookAuthProvider.credential(result.accessToken!.token);
    //     final userCredential =
    //         await _auth.signInWithCredential(facebookCredential);
    //     return Resource(status: Status.Success);
    //   case LoginStatus.cancelled:
    //     return Resource(status: Status.Cancelled);
    //   case LoginStatus.failed:
    //     return Resource(status: Status.Error);
    //   default:
    //     return null;
    //   }
    //   } on FirebaseAuthException catch (e) {
    //   throw e;
    // }
  }

  Future<void> signOutFromFacebook() async {
    await FacebookAuth.instance.logOut();
    await _auth.signOut();
  }

  Future<bool> signInFromFb(String email, String password)async {
     
        _auth.signInWithEmailAndPassword(
            email: email, password: password)
        .then((result) {
      dbRef.child(result.user!.uid).set({
        "email": email,
      }).then((res) {
        return true;
      });
    }).catchError((err) {
      return false;
    });
    return false;
  }

  Future<void> signOutFromFireb() async {
    await _auth.signOut();
  }

  Future<void> registerFromFirebase(String email, String password)async {
        _auth.createUserWithEmailAndPassword(
            email: email, password: password)
        .then((result) {
      dbRef.child(result.user!.uid).set({
        "email": email,
      }).then((res) {
        
      });
    }).catchError((err) {
      print(err);
    });
    
  }
}
