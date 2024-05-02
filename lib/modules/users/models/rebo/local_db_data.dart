import 'package:auth/models/bordingmodel.dart';
import 'package:auth/modules/users/models/rebo/parent_data.dart';
import 'package:auth/modules/users/models/entity/usermodel.dart';
import 'package:mailer/mailer.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DataBaseUserRebo extends parentRebo {
  DataBaseUserRebo._init();

  static DataBaseUserRebo? _singletoneObject;
  static late Database _database;
  static Future<DataBaseUserRebo> get instance async {
    if (_singletoneObject == null) {
      await DataBaseUserRebo._init();
      _singletoneObject = DataBaseUserRebo._init();
    }
    return _singletoneObject!;
  }

  static Future<void> _initDtatabase() async {
    //get database path on your device
    final String databasepath = await getDatabasesPath();
    final path = join(databasepath, 'users.db');

    _database = await openDatabase(
      path,
      version: 1,
      onCreate: _createTables,
    );
  }

  static Future<void> _createTables(Database db, _) async {
    await db.execute("""
     CREATE TABLE user (
     id INTEGER PRIMARY KEY AUTOINCREMENT ,
     name TEXT NOT NULL ,
     address TEXT 
     )""");

     await db.execute("""
     CREATE TABLE service (
     id INTEGER PRIMARY KEY AUTOINCREMENT ,
     name TEXT NOT NULL ,
     description TEXT ,
     color TEXT ,

     )""");
  }

  @override
  Future<void> insert({required String name, String? address}) async {
    await _database.insert('user', {'name': name, 'Address': Address});
  }

  @override
  Future<void> delete({required int id}) async {
    await _database.delete('user', where: 'id=?', whereArgs: [id]);
  }

  @override
  Future<List<UserModel>> fetch() async {
    return (await _database.query('user'))
        .map((e) => UserModel.fromJson(e))
        .toList();
  }
}
