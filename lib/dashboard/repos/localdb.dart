import 'package:auth/dashboard/models/product_model.dart';
import 'package:sqflite/sqflite.dart';
class DatabaseRepo {
  late Database myObjectDB;
  Future<void> initDB() async {
    myObjectDB = await openDatabase(
      (await getDatabasesPath()) + '/productDB.db',
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
CREATE TABLE product (
             id INTEGER PRIMARY KEY AUTOINCREMENT,
             name TEXT NOT NULL,
             description TEXT, 
             image BLOB,
             quantity INTEGER,
             availableQuantity INTEGER,
             favorite INTEGER,
             cart INTEGER
              )''');
      },
    );
  }

  Future<List<ProductModel>> fetchProducts() async {
    print((await myObjectDB.getVersion()).toString());
    return (await myObjectDB.query('product')).map((e) => ProductModel.fromJson(e)).toList();
  }}