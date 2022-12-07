import 'dart:io';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import '../models/bhModel.dart';
import "dart:io";

class HolesHelper {
  HolesHelper._privateConstructor();
  static final HolesHelper instance = HolesHelper._privateConstructor();

  static Database? _database;
  //Metodo asincrono que regresa un Future de tipo Database, si la base de datos no ha sido creada llama al metodo _init..., primera vez que se corre se genera luego ya no
  Future<Database> get database async => _database ??= await _initDatase();

  Future<Database> _initDatase() async {
    //specify a location in your phone to store the data base
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    //directorio donde se guardan los archivos
    String path = join(documentsDirectory.path, 'holes.db');
    //si no existe openDatabase crea la base de datos
    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute(
        //single ' tres veces para escribir en multilinea
        '''
      CREATE TABLE holes (
        id INTEGER PRIMARY KEY,
        name TEXT,
        mass TEXT,
        size TEXT,
        description TEXT,
        image TEXT
      )
      
      ''');
  }

  Future<List<Hole>> getHoles() async {
    Database db = await instance.database;
    var holequery = await db.query('holes', orderBy: 'name');

    //si no es empty ? (entonces)... has esto :(else) si no se cumple regresame la lista vacia
    //Ternalia dicen
    List<Hole> holeList = holequery.isNotEmpty
        ? holequery.map((e) => Hole.fromMap(e)).toList()
        : [];
    return holeList;
  }

  Future<List<Hole>> getHoleinfo(int id) async {
    Database db = await instance.database;
    var holequery = await db.query('holes', where: 'id = ?', whereArgs: [id]);
    List<Hole> holeList = holequery.isNotEmpty
        ? holequery.map((e) => Hole.fromMap(e)).toList()
        : [];
    return holeList;
  }

  Future<int> addHole(Hole hole) async {
    //esperar hasta la conección
    Database db = await instance.database;
    return await db.insert('holes', hole.toMap());
  }

  Future<int> updateHole(Hole hole) async {
    Database db = await instance.database;
    return await db
        .update('holes', hole.toMap(), where: 'id = ?', whereArgs: [hole.id]);
  }
}