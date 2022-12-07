import 'dart:io';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import '../models/starModel.dart';
import "dart:io";

class StarshipHelper {
  StarshipHelper._privateConstructor();
  static final StarshipHelper instance = StarshipHelper._privateConstructor();

  static Database? _database;
  //Metodo asincrono que regresa un Future de tipo Database, si la base de datos no ha sido creada llama al metodo _init..., primera vez que se corre se genera luego ya no
  Future<Database> get database async => _database ??= await _initDatase();

  Future<Database> _initDatase() async {
    //specify a location in your phone to store the data base
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    //directorio donde se guardan los archivos
    String path = join(documentsDirectory.path, 'ship.db');
    //si no existe openDatabase crea la base de datos
    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute(
        //single ' tres veces para escribir en multilinea
        '''
      CREATE TABLE ships (
        id INTEGER PRIMARY KEY,
        name TEXT,
        crew_size TEXT,
        description TEXT,
        speed TEXT,
        image TEXT
      )
      
      ''');
  }

  Future<List<Starship>> getShips() async {
    Database db = await instance.database;
    var shipquery = await db.query('ships', orderBy: 'name');

    //si no es empty ? (entonces)... has esto :(else) si no se cumple regresame la lista vacia
    //Ternalia dicen
    List<Starship> shipList = shipquery.isNotEmpty
        ? shipquery.map((e) => Starship.fromMap(e)).toList()
        : [];
    return shipList;
  }

  Future<List<Starship>> getShipinfo(int id) async {
    Database db = await instance.database;
    var shipquery = await db.query('ships', where: 'id = ?', whereArgs: [id]);
    List<Starship> shipList = shipquery.isNotEmpty
        ? shipquery.map((e) => Starship.fromMap(e)).toList()
        : [];
    return shipList;
  }

  Future<int> addShip(Starship ship) async {
    //esperar hasta la conección
    Database db = await instance.database;
    return await db.insert('ships', ship.toMap());
  }

  Future<int> updateShip(Starship ship) async {
    Database db = await instance.database;
    return await db
        .update('ships', ship.toMap(), where: 'id = ?', whereArgs: [ship.id]);
  }
}