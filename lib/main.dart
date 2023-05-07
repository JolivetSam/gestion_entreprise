import 'package:flutter/material.dart';
import 'package:gestion_entreprise/pages/Entreprise.dart';
import 'package:gestion_entreprise/pages/ajoutEntreprise.dart';
import 'package:gestion_entreprise/pages/detailspage.dart';
import 'package:gestion_entreprise/pages/homePage.dart';
import 'package:gestion_entreprise/pages/splashScreen.dart';


void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Gestion d'entreprise",
      home: HomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
