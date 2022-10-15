import 'package:firebase_core/firebase_core.dart';

import 'screens/login.dart';
import 'package:flutter/material.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
 await Firebase.initializeApp();
  runApp( MyApp());
}

class MyApp extends StatefulWidget {
  

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  MaterialColor materialColor=Colors.blue;

  void changeColor(bool signIn){
    setState(() {
      if(signIn){
        materialColor=Colors.orange;
      }else{
        materialColor=Colors.blue;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Firebase SignIn',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        primarySwatch: materialColor,
      ),
      home: LogIn(changeColor),
    );
  }
}


