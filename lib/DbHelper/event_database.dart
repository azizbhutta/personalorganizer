import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'dart:io' as io;
import '../Models/event_model.dart';
import '../Models/friend_model.dart';

class EventDBHelper {

  static Database? _db;
  Future<Database?> get db async {
    if (_db != null) {
      return _db!;
    }
    _db = await initDatabase();
    return _db!;
  }

  initDatabase() async {
    io.Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, 'event.db');
    var db = await openDatabase(path, version: 1, onCreate: _onCreate );
    return db;
  }

  _onCreate(Database db, int version) async {
    await  db.execute(
      "CREATE TABLE myEvent (id INTEGER PRIMARY KEY AUTOINCREMENT, eventname TEXT NOT NULL, location TEXT NOT NULL, date INTEGER NOT NULL )",

    );
  }


  Future<EventModel> insert(EventModel eventModel) async {
    var dbClient = await db;
    await dbClient!.insert('myFriend', eventModel.toMap());
    return eventModel;
  }


  Future<List<EventModel>> getCartListWithUserId() async {
    var dbClient = await db;

    final List<Map<String, Object?>> queryResult = await dbClient!.query('myEvent' );
    return queryResult.map((e) => EventModel.fromMap(e)).toList();

  }

  // Deleting Data From Database
  Future<int> delete(int id) async{
    var dbClient = await db;
    return await dbClient!.delete(
        'myEvent',
        where: 'id = ?',
        whereArgs: [id]
    );
  }

  // Update Data In Database
  Future<int> update(EventModel eventModel) async{
    var dbClient = await db;
    return await dbClient!.update(
        "myEvent",
        eventModel.toMap(),
        where: 'id = ?',
        whereArgs: [eventModel.id]
    );
  }

}