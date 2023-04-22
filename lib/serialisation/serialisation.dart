import 'dart:convert';

import 'package:http/http.dart' as http;

import '../pages/Entreprise.dart';


class Serialisation{
  Future<List<Entreprises>> fetchEntreprise()async{
    http.Response response=await http.get(
      Uri.parse("http://192.168.100.6/projets/entreprise.php")
    );

    if(response.statusCode==200){
      List entrepriseData =jsonDecode(response.body);

      return entrepriseData.map((json)=>Entreprises.fromJson(json)).toList();
    }else{
      throw Exception(
        'erreur'
      );
    }
  }
}

class Entreprises {
  String ? id;
  String ? nom_entreprise;
  String ? adresse;
  String ? description;
  String ? image;

  Entreprises({
   this.id,
    this.nom_entreprise,
    this.adresse,
    this.description,
    this.image
});
  Map<String, dynamic> toMap(){
    return<String, dynamic>{
      'id':id,
      'nom':nom_entreprise,
      'adresse':adresse,
      'description':description,
      'image':image,
    };
  }
  factory Entreprises.fromJson(Map<String, dynamic> map){
    return Entreprises(
      id:map['id']!=null?map['id'] as String:null,
      nom_entreprise:map['nom_entreprise']!=null?map['nom_entreprise'] as String:null,
      adresse:map['adresse']!=null?map['adresse'] as String:null,
      description:map['description']!=null?map['description'] as String:null,
      image:map['image']!=null?map['image'] as String:null,

    );
  }
}