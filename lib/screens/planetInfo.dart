import 'package:flutter/material.dart';
import '../helpers/planet_Helper.dart';
import '../models/planetModel.dart';

class Planetinfo extends StatefulWidget {
  @override
  State<Planetinfo> createState() => _PlanetinfoState();
}

class _PlanetinfoState extends State<Planetinfo> {
  int selectedplanet = 2;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: <Widget>[
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: EdgeInsets.only(top: 40),
                child: ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  child: Icon(
                    Icons.close,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
              ),
            ),
            Stack(
              children: <Widget>[
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    height: 600,
                    width: double.infinity,
                    color: Colors.transparent,
                  ),
                ),
                Center(
                  child: Card(
                    margin: EdgeInsets.only(top: 100),
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    elevation: 7,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Container(
                      width: 290,
                      height: 525,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    // FutureBuilder<List<Planet>>(
                    //     future:
                    //         PlanetHelper.instance.getPlanetinfo(selectedplanet),
                    //     builder: (BuildContext context,
                    //         AsyncSnapshot<List<Planet>> snapshot) {
                    //       if (!snapshot.hasData) {
                    //         return Center(
                    //           child: Container(
                    //             padding: const EdgeInsets.only(top: 10),
                    //             child: const Text("Loading..."),
                    //           ),
                    //         );
                    //       } else {
                    //         return snapshot.data!.isEmpty
                    //             ? Center(
                    //                 child: Container(
                    //                     child: const Text("No planets")))
                    //             : ListView(
                    //                 scrollDirection: Axis.vertical,
                    //                 shrinkWrap: true,
                    //                 children: snapshot.data!.map(
                    //                   (planet) {
                    //                     return Center(
                    //                       child: Card(
                    //                           margin: EdgeInsets.only(top: 100),
                    //                           clipBehavior:
                    //                               Clip.antiAliasWithSaveLayer,
                    //                           elevation: 7,
                    //                           shape: RoundedRectangleBorder(
                    //                               borderRadius:
                    //                                   BorderRadius.circular(
                    //                                       30)),
                    //                           color: Theme.of(context)
                    //                               .primaryColor,
                    //                           child: Container(
                    //                             decoration: BoxDecoration(
                    //                               image: DecorationImage(
                    //                                 image: NetworkImage(
                    //                                     '${planet.image}'),
                    //                               ),
                    //                             ),
                    //                             child: Text('${planet.name}'),
                    //                             height: 180,
                    //                             width: 200,
                    //                           )),
                    //                           ///Here is the body of the card is only for one planet
                    //                     );
                    //                   },
                    //                 ).toList());
                    //       }
                    //     })
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}