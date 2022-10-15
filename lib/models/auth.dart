import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Auth {
  String? userName;
  String? email;
  String? imageUrl;
  String? UserID;
  bool isLogin=false;

  GoogleSignIn _googleSignIn=GoogleSignIn();
  Future signIn() async{
    try{
      final signInInfo= await _googleSignIn.signIn();
      if(signInInfo==null){
        throw Exception("Return from signIn");
      }
      final userData= await signInInfo.authentication;
      final credentials= GoogleAuthProvider.credential(
        accessToken: userData.accessToken,
        idToken: userData.idToken,
      );

      await FirebaseAuth.instance.signInWithCredential(credentials);
    }catch(err){
      print(err);
      rethrow;
    }
  }

  Future signOut() async{
    try{
      await _googleSignIn.disconnect();
      FirebaseAuth.instance.signOut();
    }catch(err){

    }
  }
}