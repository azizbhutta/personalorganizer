import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'dart:io' as io;
import '../Models/friend_model.dart';

class FriendDBHelper {

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
    String path = join(directory.path, 'friend.db');
    var db = await openDatabase(path, version: 1, onCreate: _onCreate );
    return db;
  }

  _onCreate(Database db, int version) async {
    await  db.execute(
        "CREATE TABLE myFriend (id INTEGER PRIMARY KEY AUTOINCREMENT, firstname TEXT NOT NULL, lastname TEXT NOT NULL, address TEXT NOT NULL ,age INTEGER NOT NULL, photoname STRING NOT NULL, gender STRING NOT NULL)",

    );
  }


  Future<FriendModel> insert(FriendModel friendModel) async {
    var dbClient = await db;
    await dbClient!.insert('myFriend', friendModel.toMap());
    return friendModel;
  }


  Future<List<FriendModel>> get() async {
    var dbClient = await db;

    final List<Map<String, Object?>> queryResult = await dbClient!.query('myFriend' );
    return queryResult.map((e) => FriendModel.fromMap(e)).toList();

  }

  // Deleting Data From Database
  Future<int> delete(int id) async{
    var dbClient = await db;
    return await dbClient!.delete(
        'myFriend',
        where: 'id = ?',
        whereArgs: [id]
    );
  }

  // Update Data In Database
  Future<int> update(FriendModel friendModel) async{
    var dbClient = await db;
    return await dbClient!.update(
        "myFriend",
        friendModel.toMap(),
        where: 'id = ?',
        whereArgs: [friendModel.id]
    );
  }
}