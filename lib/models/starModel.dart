import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:convert';

class Starship {
  final String id;
  final String name;
  final String crew_size;
  final String description;
  final String speed;
  final String image;

  Starship(
      {required this.id,
      required this.name,
      required this.crew_size,
      required this.description,
      required this.speed,
      required this.image});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'crew_size': crew_size,
      'description': description,
      'speed': speed,
      'image': image
    };
  }

  factory Starship.fromSnapshot(DocumentSnapshot snap) {
    return Starship(
        id: snap.id,
        name: snap['nome'],
        crew_size: snap['crew_size'],
        description: snap['description'],
        speed: snap['speed'],
        image: snap['image']);
  }

  String toJson() => json.encode(toMap());

  bool get stringify => true;

  List<Object> get props => [id, name, crew_size, description, speed, image];

  factory Starship.fromMap(Map<String, dynamic> json) => Starship(
      id: json['id'],
      name: json['name'],
      crew_size: json['crew_size'],
      description: json['description'],
      speed: json['speed'],
      image: json['image']);

  static List<Starship> starships = [
    Starship(
        id: '01',
        name: 'Millenium Falcón ',
        crew_size: '4',
        description:
            "Han Solo's ship, formerly owned by Lando Calrissian, crewed by Han, Chewbaca, Leia and Luke.",
        speed: '25,000 años luz por día',
        image:
            'https://http2.mlstatic.com/D_NQ_NP_677616-MLM44310003725_122020-O.webp'),
    Starship(
        id: '02',
        name: 'Pillar of autumn',
        crew_size: '1000',
        description:
            'Halcyon-class cruiser used to reach facility 04, commanded by Captain Keys, was destroyed along with the first halo visited by mankind.',
        speed: 'Speed of light',
        image:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQBixhRoLxnzFXZgcky-gqTK7E4Y0M0SpA91w&usqp=CAU'),
    Starship(
        id: '03',
        name: 'nave3',
        crew_size: '12',
        description: 'nave de nuestra',
        speed: 'Speed of light',
        image: 'Here goes an image 8)'),
  ];
}