import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class SqlDb {
  static Database? _db;

  Future<Database?> get db async {
    if (_db == null) {
      _db = await intialDb();
      return _db;
    } else {
      return _db;
    }
  }

  String dbName = "notes_app";

  intialDb() async {
    String databasePath = await getDatabasesPath();
    String path = join(databasePath, dbName);
    Database myDb = await openDatabase(path,
        onCreate: _onCreate, version: 1, onUpgrade: _onUpgrade);
    return myDb;
  }

  _onUpgrade(Database db, int oldVersion, int newVersion) async {
    await db.execute("ALTER TABLE notes ADD COLUMN");
    print("onUpgrade =====================================");
  }

  _onCreate(Database db, int version) async {
    Batch batch = db.batch();

    batch.execute('''
  CREATE TABLE "notes" (
    "id" INTEGER  NOT NULL PRIMARY KEY  AUTOINCREMENT, 
    "title" TEXT NOT NULL,
    "content" TEXT NOT NULL,
    "dateTimeCreated" TEXT NOT NULL
  )
 ''');

    await batch.commit();
    // لو لم نستخدم الباتش سنظطر لكتابة await في كل جدول جديد يتم انشاؤه وهذا غير منطقي

    print(" onCreate =====================================");
  }

  // SELECT
  readData(String table) async {
    Database? myDb = await db;
    List<Map> response = await myDb!.query(table);
    return response;
  }

  // INSERT
  insertData(String table, Map<String, Object?> values) async {
    Database? myDb = await db;
    int response = await myDb!.insert(table, values);
    return response;
  }

  // UPDATE
  updateData(String table, Map<String, Object?> values, String where) async {
    Database? myDb = await db;
    int response = await myDb!.update(table, values, where: where);
    return response;
  }

  // DELETE
  deleteData(String table, String where) async {
    Database? myDb = await db;
    int response = await myDb!.delete(table, where: where);
    return response;
  }

  // DELETE ALL
  deleteAllData(String table) async {
    Database? myDb = await db;
    int response = await myDb!.delete(table);
    return response;
  }

// DELETE Database
  deleteDb() async {
    String databasePath = await getDatabasesPath();
    String path = join(databasePath, dbName);
    await deleteDatabase(path);

    print("DELETE DATABASE==========");
  }
}

/*
* getDatabasesPath() عبارة عن
* join() عبارة عن
* openDatabase() عبارة عن
* oonCreate()  عبارة عن دالة تنشئ الجداول
*execute ()   عبارة عن دالة تكتب بداخلها الجداول
*Batch  عبارة عن امر يقوم بعدة عمليات وتنفيذهم مرة واحدة فقط، من اجل عدم التكرار
*
*
* */
