import 'package:flutter/material.dart';
import '../pages/homePage.dart';
import 'login.dart';
import 'dart:convert';
import 'package:image_picker/image_picker.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:async/async.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';


class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  GlobalKey<FormState> keyForm = GlobalKey();
  bool _isLoading=false;
  bool showpass=true;

  TextEditingController nom =TextEditingController();
  TextEditingController prenom =TextEditingController();
  TextEditingController email =TextEditingController();
  TextEditingController password =TextEditingController();
  TextEditingController passwordConfirm =TextEditingController();

  void _onsubmit() async {
    if(keyForm.currentState!.validate()){
      if(password.text==passwordConfirm.text){
      http.Response response = await http.post(

        Uri.parse("http://192.168.29.164/projets/register_users.php"),
        body:{
          "nom":"${nom.text}",
          "prenom":"${prenom.text}",
          "email":"${email.text}",
          "password":"${password.text}",
        },

      );
      if(response.statusCode==200 ){
        final snackBar = SnackBar(
          content: Text("Enrégistré"),backgroundColor: Colors.green,
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        Navigator.push(
            context,MaterialPageRoute(builder: (context) => HomePage())
        );
      }else{
        final snackBar = SnackBar(
          content: Text("Non enrégistrée"),backgroundColor: Colors.red,
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    }else{
        final snackBar = SnackBar(
          content: Text("Mot de passe incorrect"),backgroundColor: Colors.red,
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    }
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
                    child: Text("Enregistrement",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
                  ),
                ),
                //containeur pour recuperer l'image
                SizedBox(height: 20,),
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
                          labelText: "Nom",
                          prefixIcon: Icon(Icons.account_circle) ,
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
                        controller: prenom,
                        validator: (value){
                          if (value == null || value.isEmpty){
                            return "renseignez le champs";
                          }
                        },
                        decoration: InputDecoration(
                          labelText: "Prénom",
                          prefixIcon: Icon(Icons.account_circle) ,
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
                        controller: email,
                        validator: (value){
                          if (value == null || value.isEmpty){
                            return "renseignez le champs";
                          }
                        },
                        decoration: InputDecoration(
                          labelText: "Adresse mail",
                          prefixIcon: Icon(Icons.mail),
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
                        controller: password,
                        obscureText: showpass,
                        validator: (value){
                          if (value == null || value.isEmpty){
                            return "renseignez le champs";
                          }
                        },
                        decoration: InputDecoration(
                          labelText: " Mot de passe",
                          prefixIcon: Icon(Icons.key) ,
                          suffixIcon: IconButton(
                            onPressed: (){
                              setState(() {
                                showpass=!showpass;
                              });
                            },
                            icon: showpass==true?Icon(Icons.visibility):Icon(Icons.visibility_off),
                          ),
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
                        controller: passwordConfirm,
                        obscureText: showpass,
                        validator: (value){
                          if (value == null || value.isEmpty){
                            return "renseignez le champs";
                          }
                        },
                        decoration: InputDecoration(
                          labelText: "Confirmez votre mot de pass",
                          prefixIcon: Icon(Icons.key),
                          suffixIcon: IconButton(
                          onPressed: (){
                            setState(() {
                              showpass=!showpass;
                            });
                          },
                            icon: showpass==true?Icon(Icons.visibility):Icon(Icons.visibility_off),
                          ),
                          border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
                        ),
                      )
                    ],
                  ),
                ),
                //le boutton de validation
                Container(
                  width: 500,
                  padding: EdgeInsets.all(20),
                  child: MaterialButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                      onPressed: (){
                        _onsubmit();
                      },
                      color: Colors.teal,
                      child: Text("S'enrégistrer", style: TextStyle(color: Colors.white, fontSize: 16),)
                  ),
                ),
                Divider(height: 29,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Déjà enrégistré ? "),
                    GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>  Login()));
                        },
                        child: Text(" Se connecter",style: TextStyle(color:Colors.blue,))
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
