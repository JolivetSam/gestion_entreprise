import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gestion_entreprise/serialisation/Serialisation.dart';

import 'ajoutEntreprise.dart';


class Entreprise extends StatefulWidget {
  const Entreprise({Key? key}) : super(key: key);

  @override

  State<Entreprise> createState() => _EntrepriseState();
}

class _EntrepriseState extends State<Entreprise> {
  final Serialisation  entrepriseData = Serialisation();

  @override
  void initState(){
    entrepriseData.fetchEntreprise();
    super.initState();
  }
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Listes des entreprises',
            style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold
            ),
          ),
          backgroundColor: Colors.redAccent,
        ),
        body: SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height,
              child: FutureBuilder(
                  future: entrepriseData.fetchEntreprise(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return  GridView(
                        padding: EdgeInsets.only(top: 20),
                        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 170, mainAxisExtent: 170),
                        children: snapshot.data!.map((e) => GestureDetector(
                          child: Card(
                            child: Center(
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Expanded(
                                          child: Image(
                                            width: 100,
                                            height: 120,
                                            fit: BoxFit.cover,
                                            image: NetworkImage("http://192.168.100.6/projets/images/${e.image}"),
                                          )
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 10.0),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        padding: EdgeInsets.all(2.0),
                                        child: Text('${e.image}',
                                          maxLines: 1,
                                          style: TextStyle(
                                              overflow: TextOverflow.ellipsis
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          onTap: () {},
                        )
                        ).toList(),
                      );
                    }else{
                      return Center(
                        child: Column(
                          children: [
                            Icon(
                              Icons.error,
                              color: Colors.red,
                              size: 82.0,
                            ),
                            Text(
                              "${snapshot.error}",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      );
                    }
                  }
              ),
            ),
          ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.redAccent,
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => AjoutEntreprise()));
        },
        child: Icon(Icons.add),
      ),
        );
    }
}