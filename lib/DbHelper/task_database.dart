import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'dart:io' as io;
import '../Models/task_model.dart';

class TaskDBHelper {

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
    String path = join(directory.path, 'task.db');
    var db = await openDatabase(path, version: 1, onCreate: _onCreate );
    return db;
  }

  _onCreate(Database db, int version) async {
    await  db.execute(

      "CREATE TABLE myTask (id INTEGER PRIMARY KEY AUTOINCREMENT, taskname TEXT NOT NULL, location TEXT NOT NULL )",


    );
  }


  Future<TaskModel> insert(TaskModel taskModel) async {
    var dbClient = await db;
    await dbClient!.insert('myTask', taskModel.toMap());
    return taskModel;
  }


  Future<List<TaskModel>> get() async {
    var dbClient = await db;

    final List<Map<String, Object?>> queryResult = await dbClient!.query('myTask' );
    return queryResult.map((e) => TaskModel.fromMap(e)).toList();

  }

  // Deleting Data From Database
  Future<int> delete(int id) async{
    var dbClient = await db;
    return await dbClient!.delete(
        'myTask',
        where: 'id = ?',
        whereArgs: [id]
    );
  }

  // Update Data In Database
  Future<int> update(TaskModel taskModel) async{
    var dbClient = await db;
    return await dbClient!.update(
        "myTask",
        taskModel.toMap(),
        where: 'id = ?',
        whereArgs: [taskModel.id]
    );
  }

}