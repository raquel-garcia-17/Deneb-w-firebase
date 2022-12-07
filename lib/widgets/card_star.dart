import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CountryCard extends StatelessWidget {
  final docs;
  const CountryCard({Key? key, this.docs}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dynamic direction = 'starships/' + docs;
    final db = FirebaseFirestore.instance.doc(direction);
    return StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
        stream: db.snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const CircularProgressIndicator();
          }
          final docsnap = snapshot.data!;
          return SizedBox(
            width: 400,
            height: 150,
            child: Card(
              elevation: 0,
              shape: RoundedRectangleBorder(
                  side: BorderSide(color: Color.fromRGBO(255, 183, 77, 1)),
                  borderRadius: const BorderRadius.all(Radius.circular(12))),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    Column(
                      children: [
                        Center(
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: Image(
                                image: NetworkImage(docsnap['image']),
                                width: 150,
                                height: 100,
                              )),
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(docsnap['name'],
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20)),
                          Text("Description: " + docsnap['description']),
                          Text("Max speed: " + docsnap['speed'],
                              maxLines: 1,
                              softWrap: false,
                              overflow: TextOverflow.ellipsis),
                          Text("Crew Size: " + docsnap['crew_size']),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }
}