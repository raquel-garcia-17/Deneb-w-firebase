import 'package:deneb/screens/AddPlanet.dart';
import 'package:deneb/screens/Options.dart';
import 'package:flutter/material.dart';
import 'package:deneb/helpers/planet_Helper.dart';
import 'package:deneb/models/planetModel.dart';
import 'package:deneb/PlanetCards/EarthCard.dart';
import 'package:deneb/PlanetCards/MarsCard.dart';
import 'package:deneb/PlanetCards/MercuryCard.dart';
import 'package:deneb/PlanetCards/VenusCard.dart';
import 'package:deneb/PlanetCards/JupiterCard.dart';

class HomeScreen2 extends StatefulWidget {
  const HomeScreen2({Key? key}) : super(key: key);

  @override
  _HomeScreen2State createState() => _HomeScreen2State();
}

class _HomeScreen2State extends State<HomeScreen2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("Deneb"),
          backgroundColor: Color.fromARGB(255, 94, 93, 93),
          actions: [
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: () {
                final route =
                    MaterialPageRoute(builder: (context) => AddPlanet());
                Navigator.push(context, route);
              },
            ),
          ],
          elevation: 0),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/background2.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 25, horizontal: 25),
                child: Text(
                  'System: Epsilon Eridani',
                  style: TextStyle(
                    color: Color.fromARGB(255, 122, 119, 119),
                    fontSize: 30,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            Container(
              height: 485,
              child: ListView(
                scrollDirection: Axis.vertical,
                children: <Widget>[
                  FutureBuilder<List<Planet>>(
                      // future: PlanetHelper.instance.getPlanet(),
                      builder: (BuildContext context,
                          AsyncSnapshot<List<Planet>> snapshot) {
                        if (!snapshot.hasData) {
                          return Center(
                            child: Container(
                              padding: const EdgeInsets.only(top: 10),
                              child: const Text("Loading..."),
                            ),
                          );
                        } else {
                          return snapshot.data!.isEmpty
                              ? Center(
                                  child: Container(
                                      child: const Text("No planets")))
                              : ListView(
                                  scrollDirection: Axis.vertical,
                                  shrinkWrap: true,
                                  children: snapshot.data!.map(
                                    (planet) {
                                      return Center(
                                        child: Card(
                                            color: Color(0xFF443E64),
                                            child: ListTile(
                                              leading: Image.network(
                                                  '${planet.image}'),
                                              title: Text('${planet.name}'),
                                              subtitle: Text(
                                                  '${planet.description} \nSize:${planet.size}km'),
                                            )),
                                      );
                                    },
                                  ).toList());
                        }
                      })
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}