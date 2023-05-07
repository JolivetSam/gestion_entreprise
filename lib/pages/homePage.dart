import 'package:flutter/material.dart';
import 'package:gestion_entreprise/pages/Entreprise.dart';
import 'package:gestion_entreprise/pages/detailspage.dart';
import 'package:google_fonts/google_fonts.dart';
import '../authentification/login.dart';
import 'ajoutEntreprise.dart';
import 'package:gestion_entreprise/serialisation/serialisation.dart';
import 'package:gestion_entreprise/pages/Entreprise.dart';



class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Serialisation  entrepriseData = Serialisation();

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text("Gestion"),
        centerTitle: true,

        backgroundColor: Colors.teal

      ),
      drawer: Drawer(
          child:ListView(
            children: [
             const DrawerHeader(
                decoration:BoxDecoration(
                  gradient:LinearGradient(
                    colors:[
                      Colors.teal,
                      Colors.tealAccent
                    ],
                    begin:Alignment.topLeft,
                    end:Alignment.bottomRight,
                  ),
                ),
                child: Center(child: Text("Gestion",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.white),)),
              ),
              SizedBox(height: 5,),
              ListTile(
                leading: Icon(Icons.home),
                title: Text("Home"),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
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
        child: Padding(
          padding: const EdgeInsets.all(5),
          child: Column(
            children:[
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextField(
                  decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      contentPadding: const EdgeInsets.symmetric(vertical: 10),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: const BorderSide(width: 0.8)
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: const BorderSide(width: 0.8, color: Colors.tealAccent)
                      ),
                      hintText: "Recherches",
                      prefixIcon: const Icon(Icons.search),
                      suffixIcon: IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.clear),
                      ),
                  ),
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
                            bottomLeft: Radius.circular(2.5),
                            bottomRight: Radius.circular(2.5),
                        ),
                      ),
                      //padding: EdgeInsets.all(5),
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
                                  child: Text("ENTREPRISES DE LA SEMAINE",style: GoogleFonts.abel(textStyle: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.blue,)))
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
                              color: Colors.teal,),height: 5, width: 200,),left: 0,
                          ),
                        ],
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: (){

                    },
                    child: Text("Voir plus ",style: GoogleFonts.abel(textStyle: TextStyle(fontSize: 16,color: Colors.blue))),
                  ),
                ],
              ),
              SizedBox(height: 15,),
              Container(
                height: 120,
                child: FutureBuilder(
                  future: entrepriseData.fetchEntreprise(),
                  builder: (context, snapshot){
                    if(!snapshot.hasData){
                      return Center(child: CircularProgressIndicator(),);
                    }else{
                      return ListView.builder(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          physics: const ScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemCount: snapshot.data?.length,
                          itemExtent: 150,
                          itemBuilder: (BuildContext context, int index) {
                            return GestureDetector(
                                child: Column(
                                  children: [
                                    Expanded(
                                      child: InkWell(
                                        onTap: (){
                                          //Navigator.pushNamed(context, MaterialPageRoute(builder: (context)=>DetailsPage();))
                                        },
                                        child: ClipRRect(
                                            borderRadius: BorderRadius.circular(7.0),
                                            child: snapshot.data![index].image == ""? Image.asset("assets/images/entreprise.png"):
                                            Image.network("http://192.168.29.164/projets/images/${snapshot.data![index].image}",fit: BoxFit.cover, )
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 5,),
                                    Text("${snapshot.data![index].nom_entreprise}"),
                                  ],
                                )
                            );
                          });
                    }
                  }
                )
              ),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      Stack(
                        children: [
                          Container(
                            child: Positioned(
                              child: Container(
                                  padding: EdgeInsets.all(10),
                                  child: Text(" TOUTES LES ENTREPRISES ",style: GoogleFonts.abel(textStyle: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.blue,)))
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
                              color: Colors.teal,),height: 5, width: 200,),left: 0,
                          ),
                        ],
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Entreprise()));
                    },
                    child: Text("Voir plus ",style: GoogleFonts.abel(textStyle: TextStyle(fontSize: 16,color: Colors.blue)),),
                  ),
                ],
              ),
              Container(
                height: 200,
                child: FutureBuilder(
                  future: entrepriseData.fetchEntreprise(),
                  builder:(context, snapshot) {
                    if(!snapshot.hasData){
                      return Center(child: CircularProgressIndicator(),);
                    }else{
                      return GridView.builder(
                        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 170,mainAxisSpacing: 150,crossAxisSpacing: 2),
                        itemCount: 3,
                        itemBuilder: (context, index)=>GestureDetector(
                          child: Container(
                            child: Center(
                              child: Column(
                                children: [
                                  Expanded(
                                      child: snapshot.data![index].image == ""? Image.asset("assets/images/entreprise.png"):
                                      Image.network("http://192.168.29.164/projets/images/${snapshot.data![index].image}")
                                  ),
                                  Text("${snapshot.data![index].nom_entreprise}"),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    }
              }
                )
              ),
              Container(
                color: Colors.teal.withOpacity(0.5),
                padding: EdgeInsets.all(15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("© Copyright " , style: TextStyle(fontSize: 10, color: Colors.teal),),
                    Text("Gestion d'entreprise 2.0"),
                  ],
                ),
              ),
            ]
          ),
        ),
      ),
    );
  }
}
