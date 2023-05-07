import 'dart:async';
import 'Entreprise.dart';
import 'homePage.dart';
import 'package:flutter/material.dart';
import 'package:gestion_entreprise/authentification/login.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void initState(){
    Timer(Duration(seconds: 1), () {
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => Login()), (route) => false);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration:BoxDecoration(
          gradient:LinearGradient(
            colors:[
              Colors.teal,
              Colors.blueAccent,
              Colors.tealAccent,
              Colors.blueAccent
            ],
            begin:Alignment.topLeft,
            end:Alignment.bottomRight,
          ),
        ),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Center(
              child:Text("Welcome",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),),
        ),
      ),
    );
  }
}
