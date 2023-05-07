import 'dart:convert';
import 'package:image_picker/image_picker.dart';
import 'dart:convert';
import 'Entreprise.dart';
import 'homePage.dart';
import 'package:http/http.dart' as http;
import 'package:async/async.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class AjoutEntreprise extends StatefulWidget {
  const AjoutEntreprise({Key? key}) : super(key: key);

  @override
  State<AjoutEntreprise> createState() => _AjoutEntrepriseState();
}

class _AjoutEntrepriseState extends State<AjoutEntreprise> {

  GlobalKey<FormState> keyForm = GlobalKey();
  bool _isLoading=false;

  TextEditingController nom =TextEditingController();
  TextEditingController adresse =TextEditingController();
  TextEditingController description =TextEditingController();

  //les fonctions pour activer le button d'image et récupérer
  void _onsubmit() async {
    if(keyForm.currentState!.validate()){
      http.Response response = await http.post(

        Uri.parse("http://192.168.29.164/projets/ajout_entreprise.php"),
        body:{
          "nom":"${nom.text}",
          "description":"${description.text}",
          "adresse":"${adresse.text}",
          "image_nom":"$image_nom",
          "image":"$bases64"
        },

      );
      if(response.statusCode==200 ){
        final snackBar = SnackBar(
          content: Text("Entreprise enrégistrée"),backgroundColor: Colors.green,
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        Navigator.push(
            context,MaterialPageRoute(builder: (context) => Entreprise())
        );
      }else{
        final snackBar = SnackBar(
          content: Text("Entreprise non enrégistrée"),backgroundColor: Colors.teal,
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    /**
     * if(jsonDecode(response.body)["code"]!="0"){
        final snackBar = SnackBar(
        content: Text("Entreprise enrégistrée"),backgroundColor: Colors.green,
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        Navigator.push(
        context,MaterialPageRoute(builder: (context) => HomePage())
        );
        }else{
        final snackBar = SnackBar(content: Text("Echec d'enrégistrement"),backgroundColor: Colors.red,);
        }
     */


      //icon de chergement du boutton ajouter
      setState(() => _isLoading = true);
      Future.delayed(
          Duration(seconds: 3),
              ()=>setState(
                ()=>_isLoading = false,
          )
      );
    }
  }
  String file = "";
  String bases64 ="",
      image_nom="";

  ImagePicker image = ImagePicker();

  getgall() async{
    var img= await image.pickImage(source: ImageSource.gallery, imageQuality: 15);
    file = img!.path;
    image_nom=img.name;
    bases64=base64Encode(await img.readAsBytes());

    setState(() {});
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: keyForm,
          child: Container(
            child: Column(
              children: [
                Container(
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.teal,
                    borderRadius: BorderRadius.only(bottomRight: Radius.circular(40),bottomLeft: Radius.circular(40),),
                  ),
                  child: Center(
                    child: Text("AJOUTER UNE ENTREPRISE",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
                  ),
                ),
                //containeur pour recuperer l'image
                SizedBox(height: 20,),
                Container(
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(245, 245, 245, 1.0),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50),
                      bottomLeft: Radius.circular(50),
                      bottomRight: Radius.circular(50),
                    ),
                  ),
                  height: 150,
                  width: 500,
                  child: file == "" ?
                  Icon(Icons.image,size: 50,)
                      :CachedNetworkImage(
                    imageUrl: "$file",
                      placeholder: (context, url) => const CircularProgressIndicator(),
                  ),
                ),
                SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: MaterialButton(
                          onPressed: (){},
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)
                          ),
                          child: Text("Appareil photo",style: TextStyle(color: Colors.white),),
                          color: Colors.teal,
                        ),
                      ),
                      Expanded(
                        child: MaterialButton(
                          onPressed: (){
                            getgall();
                            },
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)
                          ),
                          child: Text("Gallerie",style: TextStyle(color: Colors.white),),
                          color: Colors.teal,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 500,
                  padding: EdgeInsets.all(20),
                  child: Column(
                    children: [
                      TextFormField(
                        controller: nom,
                        validator: (value){
                          if (value == null || value.isEmpty){
                            return "renseignez le champs";
                          }
                        },
                        decoration: InputDecoration(
                          labelText: "Nom de l'entreprise ",
                          border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20)),),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 500,
                  padding: EdgeInsets.all(20),
                  child: Column(
                    children: [
                      TextFormField(
                        controller: adresse,
                        validator: (value){
                          if (value == null || value.isEmpty){
                            return "renseignez le champs";
                          }
                        },
                        decoration: InputDecoration(
                          labelText: " Adresse",
                          border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  width: 500,
                  padding: EdgeInsets.all(20),
                  child: Column(
                    children: [
                      TextFormField(
                        controller: description,
                        validator: (value){
                          if (value == null || value.isEmpty){
                            return "renseignez le champs";
                          }
                        },
                        decoration: InputDecoration(
                          labelText: "Description",
                          border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
                        ),
                      )
                    ],
                  ),
                ),
                //le boutton de validation
                Container(

                  width: 500,
                  height: 100,
                  padding: EdgeInsets.all(30),

                  child:MaterialButton(
                    onPressed: () {
                      _onsubmit();
                    },
                    color: Colors.teal,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)
                    ),
                    child: Text("Ajouter ",style: TextStyle(color: Colors.white,fontSize: 20),
                    ),
                  ),)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
/*
* _isLoading?SizedBox(
                      height: 25,
                      width: 25,
                      child: CircularProgressIndicator(),
                    ):
* */