import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_signin/models/auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:lottie/lottie.dart';

class LogIn extends StatefulWidget {
  Function changeColor;
  LogIn(this.changeColor);
  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  bool _isLogin = false;

  final auth = Auth();
  String asset="login";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("SignIn")),
      body: Center(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              child: Lottie.asset("assets/$asset.json"),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  asset='loading';
                });
                _isLogin
                    ? auth.signOut().then((value) {
                        widget.changeColor(false);
                        setState(() {
                          asset='login';
                          _isLogin = !_isLogin;
                        });
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Successfuly signOut !",textAlign: TextAlign.center,))
                        );
                      }).catchError((_) {
                        setState(() {
                          asset='error';
                        });
                        print("ERROR !");
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Some Error Occur !",textAlign: TextAlign.center,))
                        );
                      })
                    : auth.signIn().then((value) {
                      widget.changeColor(true);
                        setState(() {
                         asset='success';
                          _isLogin = !_isLogin;
                        });
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Successfuly signIn !",textAlign: TextAlign.center,))
                        );
                      }).catchError((_) {
                        setState(() {
                          asset='error';
                        });
                        print("ERROR !");
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Some Error Occur !",textAlign: TextAlign.center,))
                        );
                      });
              },
              child: _isLogin ? Text("LogOut") : Text("LogIn"),
            )
          ],
        ),
      ),
    );
  }
}
