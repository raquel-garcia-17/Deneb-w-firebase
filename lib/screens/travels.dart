import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:deneb/screens/homeScreen.dart';

class TravelScreen extends StatefulWidget {
  const TravelScreen({Key? key}) : super(key: key);

  @override
  State<TravelScreen> createState() => _TravelScreenState();
}

class _TravelScreenState extends State<TravelScreen> {
  final controllerSpeed = TextEditingController();
  final controllerDistance = TextEditingController();
  double time = 0;

  Future<double?> getDefaultValues() async {
    final prefs = await SharedPreferences.getInstance();
    final double distance = prefs.getDouble('Distance') ?? 10000;

    return distance;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Time calculator',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Color.fromARGB(255, 94, 93, 93),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_rounded),
          onPressed: () {
            final route =
                MaterialPageRoute(builder: (context) => const HomeScreen2());
            Navigator.push(context, route);
          },
        ),
      ),
      body: Container(
        color: Colors.white70,
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Form(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextFormField(
                  key: Key("Speed"),
                  controller: controllerSpeed,
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  decoration: InputDecoration(
                    hintText: 'Enter the ship speed',
                    labelText: 'Speed',
                    labelStyle: TextStyle(
                        fontSize: 25,
                        letterSpacing: 1,
                        fontWeight: FontWeight.bold),
                    fillColor: Colors.white,
                    border: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(20.0),
                    ),
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                TextFormField(
                  key: Key("Tip"),
                  controller: controllerDistance,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'distance',
                    labelStyle: TextStyle(
                        fontSize: 25,
                        letterSpacing: 1,
                        fontWeight: FontWeight.bold),
                    fillColor: Colors.white,
                    border: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(20.0),
                    ),
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                Text("Time to reach the planet$time"),
                TextButton(
                    onPressed: () {
                      setState(() {
                        double speed = double.parse(controllerSpeed.text);
                        double distance = double.parse(controllerDistance.text);

                        time = (distance - 0) / speed;
                      });
                    },
                    child: Text("Calculate Time"),
                    style: TextButton.styleFrom(
                        primary: Colors.white,
                        backgroundColor: Colors.purple,
                        onSurface: Colors.grey))
              ],
            ),
          ),
        ),
      ),
    );
  }
}