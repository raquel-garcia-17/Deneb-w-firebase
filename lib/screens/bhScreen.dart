import 'package:deneb/screens/AddPlanet.dart';
import 'package:flutter/material.dart';
import 'package:deneb/PlanetCards/SagitarioABH.dart';
import 'package:deneb/PlanetCards/S5-0014+81BH.dart';
import 'package:deneb/screens/homeScreen.dart';

class BlackhScreen extends StatefulWidget {
  const BlackhScreen({Key? key}) : super(key: key);

  @override
  _BlackhScreenState createState() => _BlackhScreenState();
}

class _BlackhScreenState extends State<BlackhScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("Deneb"),
          backgroundColor: const Color.fromARGB(143, 61, 61, 61),
          actions: [
            // IconButton(
            //   icon: const Icon(Icons.add),
            //   onPressed: () {
            //     final route =
            //         MaterialPageRoute(builder: (context) => AddPlanet());
            //     Navigator.push(context, route);
            //   },
            // ),
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
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 50, horizontal: 25),
                child: Text(
                  'Black holes',
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
                  SagitarioABH(),
                  S5001481BH(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}