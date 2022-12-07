import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:deneb/models/starModel.dart';
import 'package:flutter/material.dart';
import 'package:deneb/widgets/card_star.dart';

import 'homeScreen.dart';

class ShipScreen extends StatelessWidget {
  ShipScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final db = FirebaseFirestore.instance;
    final doc1 = db.doc("/starships/s1");
    final doc2 = db.doc("/starships/s2");

    return Scaffold(
        appBar: AppBar(
          title: const Text("Starships"),
          backgroundColor: Color.fromRGBO(255, 183, 77, 1),
          toolbarHeight: 75,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_rounded,
            ),
            iconSize: 30,
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => HomeScreen2()));
            },
          ),
        ),
        body: ListView(
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          children: [
            //CountryCard(docs:doc1),
            //CountryCard(docs:doc2),
            //CountryCard(docs:doc3),
            //CountryCard(docs:doc4),
            //CountryCard(docs:doc5)
            StreamBuilder(
              stream: readData(),
              builder: ((context, snapshot) {
                if (snapshot.hasError) {
                  return Text(
                      'Something went wrong! ${snapshot.connectionState}');
                } else if (snapshot.hasData) {
                  final starship = snapshot.data!;

                  return ListView(
                      //   children: starship.map(buildCountry).toList(),
                      );
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              }),
            )
          ],
        ));
  }
}

Widget buildCountry(Starship starship) =>
//CountryCard(image: starship.flag, name: starship.name, description: starship.description, continent: starship.continent, stores: starship.speed
    ListTile(
      title: Text(starship.name),
    );
//);

Future create({required String name}) async {
  final docStarship = FirebaseFirestore.instance.collection('starships').doc();

  final starship = Starship(
      id: docStarship.id,
      name: name,
      crew_size: 'crew_size',
      description: 'description',
      speed: 'sspeed',
      image: 'image');

  final json = starship.toMap();

  await docStarship.set(json);
}

Stream<List<Starship>> readData() => FirebaseFirestore.instance
    .collection('starships')
    .snapshots()
    .map((snapshots) =>
        snapshots.docs.map((doc) => Starship.fromMap(doc.data())).toList());