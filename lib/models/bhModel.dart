class Hole {
  //int id
  final int? id;
  final String name;
  final String mass;
  final String description;
  final String image;

  Hole(
      {this.id,
      required this.name,
      required this.mass,
      required this.description,
      required this.image});

  factory Hole.fromMap(Map<String, dynamic> json) => Hole(
      id: json['id'],
      name: json['name'],
      mass: json['mass'],
      description: json['description'],
      image: json['image']);

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'mass': mass,
      'description': description,
      'image': image
    };
  }
}