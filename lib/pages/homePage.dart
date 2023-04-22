import 'package:flutter/material.dart';
import 'package:gestion_entreprise/pages/Entreprise.dart';

import '../authentification/login.dart';
import 'ajoutEntreprise.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text("Gestion"),
        centerTitle: true,
        backgroundColor: Colors.redAccent,
      ),
      drawer: Drawer(
          child:ListView(
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.redAccent,
                ),
                child: Center(child: Text("Gestion",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.white),)),
              ),
              SizedBox(height: 5,),
              ListTile(
                leading: Icon(Icons.home),
                title: Text("Home"),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
                },
              ),
              ListTile(
                leading: Icon(Icons.group),
                title: Text("Entreprises"),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Entreprise()));
                },
              ),
              SizedBox(height: 30,),
              Divider(height: 30,),
              ListTile(
                leading: Icon(Icons.group),
                title: Text("Deconnexion"),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Login()));
                },
              ),
            ],
          )
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.all(5),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
                            bottomLeft: Radius.circular(2.5),
                            bottomRight: Radius.circular(2.5),
                        )
                      ),
                      padding: EdgeInsets.all(5),
                      width: MediaQuery.of(context).size.width,
                      height: 200,
                      child: Image.network("https://img-0.journaldunet.com/H4q3fBGP-aL08RGrYYQ6fQ6dP2k=/300x/smart/828082c2f96746b8939f893d98befadf/ccmcms-jdn/820651.jpg", fit: BoxFit.cover,),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Stack(
                        children: [
                          Container(
                            child: Positioned(
                              child: Container(
                                  padding: EdgeInsets.all(10),
                                  child: Text("ENTREPRISES DE LA SEMAINE",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.blue,))
                              ),
                            ),
                          ),

                          SizedBox(height: 10,),
                          Positioned(
                            child: Container( decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10),
                                bottomLeft: Radius.circular(10),
                                bottomRight: Radius.circular(10),
                            ),
                              color: Colors.redAccent,),height: 5, width: 200,),left: 0,
                          ),
                        ],
                      ),
                    ],
                  ),
                  ElevatedButton(
                    onPressed: (){},
                    child: Text("Voir plus "),
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.redAccent),
                  ),
                ],
              ),
              SizedBox(height: 15,),
              Expanded(
                child: Container(
                  height: 120,
                  child: ListView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      physics: const ScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: 4,
                      itemExtent: 200,
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          child: Column(
                            children: [
                              Expanded(
                                child: Image.network("https://st3.depositphotos.com/25985398/34343/i/600/depositphotos_343431382-stock-photo-company-managers-hold-a-resume.jpg",fit: BoxFit.cover,),
                              ),
                              SizedBox(height: 5,),
                                  Text("Entreprise test",style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.bold),),
                            ],
                          )
                        );
                      }),
                ),
              ),
              SizedBox(height: 15,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Stack(
                        children: [
                          Container(
                            child: Positioned(
                              child: Container(
                                  padding: EdgeInsets.all(10),
                                  child: Text(" NOS ENTREPRISES ",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.blue,))
                              ),
                            ),
                          ),

                          SizedBox(height: 10,),
                          Positioned(
                            child: Container( decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10),
                                bottomLeft: Radius.circular(10),
                                bottomRight: Radius.circular(10),
                              ),
                              color: Colors.redAccent,),height: 5, width: 200,),left: 0,
                          ),
                        ],
                      ),
                    ],
                  ),
                  ElevatedButton(
                    onPressed: (){},
                    child: Text("Voir plus "),
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.redAccent),
                  ),
                ],
              ),
              Expanded(
                child: Container(
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 170,mainAxisSpacing: 170,crossAxisSpacing: 5),
                    itemCount: 3,
                    itemBuilder: (context, index)=>GestureDetector(
                      child: Container(
                        child: Center(
                          child: Column(
                            children: [
                              Expanded(
                                  child: Image.network("https://st3.depositphotos.com/25985398/34343/i/600/depositphotos_343431382-stock-photo-company-managers-hold-a-resume.jpg")
                              ),
                              Text("ENTREPRISES NAME"),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
