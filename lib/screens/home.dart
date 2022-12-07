import 'package:deneb/screens/AddPlanet.dart';
import 'package:deneb/models/planetModel.dart';
import 'package:deneb/helpers/planet_Helper.dart';
import 'package:deneb/screens/AddSystem.dart';
import 'package:deneb/screens/bhScreen.dart';
import 'package:flutter/material.dart';
import 'package:deneb/PlanetCards/EarthCard.dart';
import 'package:deneb/PlanetCards/MarsCard.dart';
import 'package:deneb/PlanetCards/MercuryCard.dart';
import 'package:deneb/PlanetCards/VenusCard.dart';
import 'package:deneb/PlanetCards/JupiterCard.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("Deneb"),
          backgroundColor: const Color.fromARGB(143, 61, 61, 61),
          actions: [
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: () {
                final route =
                    MaterialPageRoute(builder: (context) => AddPlanet());
                Navigator.push(context, route);
              },
            ),
            IconButton(
              icon: const Icon(Icons.heat_pump_outlined),
              onPressed: () {
                final route =
                    MaterialPageRoute(builder: (context) => BlackhScreen());
                Navigator.push(context, route);
              },
              ),
          ],
          elevation: 0),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: const DecorationImage(
            image: const AssetImage('assets/images/background.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const Align(
              alignment: Alignment.topLeft,
              child: const Padding(
                padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 25),
                child: Text(
                  'Solar System',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 45,
                    fontWeight: FontWeight.w900,
                    shadows: <Shadow>[
                      Shadow(
                        offset: const Offset(5.0, 5.0),
                        blurRadius: 3.0,
                        color: const Color.fromARGB(228, 0, 0, 0),
                      ),
                      Shadow(
                        offset: Offset(6.0, 6.0),
                        blurRadius: 9.0,
                        color: Color.fromARGB(125, 0, 0, 0),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              height: 485,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  const MercuryCard(),
                  const VenusCard(),
                  const EarthCard(),
                  const MarsCard(),
                  JupiterCard(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}