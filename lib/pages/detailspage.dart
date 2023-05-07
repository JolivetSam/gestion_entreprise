import 'package:flutter/material.dart';
import 'package:gestion_entreprise/pages/Entreprise.dart';
import 'package:google_fonts/google_fonts.dart';


class DetailsPage extends StatefulWidget {
  final entreprise ;
  final image;
  final description;
  final adresse;

  const DetailsPage({Key? key, this.entreprise, this.image, this.description, this.adresse}) : super(key: key);

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.all(20),
              height: 210,
              width: double.infinity,
              alignment: Alignment.topLeft,
              child: Center(
                child: widget.image == " "? Image(image: AssetImage("assets/images/entreprise.png")):
                 Image(
                       image:  NetworkImage("http://192.168.29.164/projets/images/${widget.image}")
                 ),
                  ),
            ),
            SizedBox(height: 20,),
            Text("${widget.entreprise}",style: GoogleFonts.aBeeZee(textStyle: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),),
            SizedBox(height: 20,),
            Container(
              height: MediaQuery.of(context).size.height / 2,
              decoration: BoxDecoration(
                color: Colors.teal,
                borderRadius: BorderRadius.only(topRight: Radius.circular(20),topLeft: Radius.circular(20))
              ),
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Description :", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                          SizedBox(height: 10,),
                          Row(
                            children:[
                              SizedBox(
                                width:400,
                                child: Text("${widget.description}"
                                  , overflow: TextOverflow.visible, style: GoogleFonts.amita(),),
                              ),
                          ]),
                        ],
                      )
                    ],
                  ),
                  SizedBox(height: 30,),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Contact : jojo@gmail.com",style: GoogleFonts.aBeeZee(textStyle:TextStyle(fontSize: 15, fontWeight: FontWeight.bold,letterSpacing: 2)),),
                        Text("${widget.adresse}", style: GoogleFonts.aBeeZee(textStyle:TextStyle(fontSize: 15, fontWeight: FontWeight.bold,letterSpacing: 2)),),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
