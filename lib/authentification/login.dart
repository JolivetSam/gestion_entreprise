import 'package:flutter/material.dart';
import 'package:gestion_entreprise/authentification/register.dart';
import 'package:gestion_entreprise/pages/homePage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:async/async.dart';
import 'dart:convert';



class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  GlobalKey<FormState> keyForm = GlobalKey();
  bool _isLoading=false;
  bool showpass=true;

  TextEditingController email =TextEditingController();
  TextEditingController password =TextEditingController();

  void _onsubmit() async {
    if(keyForm.currentState!.validate()){
      http.Response response = await http.post(

        Uri.parse("http://192.168.100.6/projets/login_users.php"),
        body:{
          "email":"${email.text}",
          "password":"${password.text}",
        },

      );
      //la connexion et les vérif
      if(response.statusCode==200 ){
        final token= SharedPreferences.getInstance();
        //if(response.body!="0"){
          print (response.body[0][0]);
          print (response.body[1]);
        //}
          final success=response.body[0][0];
          if(success=="1"){
            final snackBar = SnackBar(
              content: Text("Connecté"),backgroundColor: Colors.green,
            );
            ScaffoldMessenger.of(context).showSnackBar(snackBar);

            Navigator.push(context,MaterialPageRoute(builder: (context) => HomePage()));
          }else{
            final snackBar = SnackBar(
              content: Text("Accès refusé"),backgroundColor: Colors.red,
            );
            ScaffoldMessenger.of(context).showSnackBar(snackBar);

          }

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
                    child: Text("Connexion",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
                  ),
                ),
                SizedBox(height: 20,),
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
                          labelText: "Votre adresse mail",
                          prefixIcon: Icon(Icons.mail),
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
                        controller: password,
                        obscureText: showpass,
                        validator: (value){
                          if (value == null || value.isEmpty){
                            return "renseignez le champs";
                          }
                        },
                        decoration: InputDecoration(
                          labelText: " Mot de passe",
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
                      borderRadius: BorderRadius.circular(20),
                    ),
                      onPressed: (){
                        _onsubmit();
                      },
                      color: Colors.teal,
                      child: Text("Connexion", style: TextStyle(color: Colors.white,fontSize: 16),)
                  ),
                ),
                Divider(height: 29,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Pas encore de compte ? "),
                    GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Register()));
                        },
                        child: Text(" S'enregistrer",style: TextStyle(color: Colors.blue),)
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
