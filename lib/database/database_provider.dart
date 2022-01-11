import 'dart:async';
import 'dart:io';

import 'package:coffepedia/data/models/gettoken_database.dart';
import 'package:coffepedia/data/models/login_data_user.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

final userTable = 'userTable';

class DatabaseProvider {
  static final DatabaseProvider dbProvider = DatabaseProvider();

  Database? _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }
    _database = await createDatabase();
    return _database!;
  }

  createDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "User.db");

    var database = await openDatabase(
      path,
      version: 1,
      onCreate: initDB,
      onUpgrade: onUpgrade,
    );
    return database;
  }

  void onUpgrade(
    Database database,
    int oldVersion,
    int newVersion,
  ) {
    if (newVersion > oldVersion) {}
  }

  void initDB(Database database, int version) async {
    await database.execute("CREATE TABLE $userTable ("
        "id INTEGER PRIMARY KEY, "
        "token TEXT "
        ")");
  }
}

class UserDao {
  final dbProvider = DatabaseProvider.dbProvider;

  Future<int> createUser(LoginData user) async {
    final db = await dbProvider.database;
    var result = db.insert(userTable, {"id": "0", "token": user.token});
    getUserToken();
    return result;
  }

  Future<int> deleteUser(int id) async {
    final db = await dbProvider.database;
    var result = await db.delete(userTable);
    return result;
  }

  Future<int> updateUser(int id, LoginDataUser user) async {
    final db = await dbProvider.database;
    var result = await db
        .update(userTable, user.toJson(), where: "id = ?", whereArgs: [id]);
    return result;
  }

  Future<bool> checkUser(String token) async {
    final db = await dbProvider.database;
    try {
      List<Map> users =
          await db.query(userTable, where: 'token = ?', whereArgs: [token]);
      if (users.length > 0) {
        return true;
      } else {
        return false;
      }
    } catch (error) {
      return false;
    }
  }

  Future<bool> checkSavedToken(int id) async {
    final db = await dbProvider.database;
    try {
      List<Map> users =
          await db.query(userTable, where: 'id = ?', whereArgs: [id]);
      if (users.length > 0) {
        return true;
      } else {
        return false;
      }
    } catch (error) {
      return false;
    }
  }

  Future<GetTokenDatabase?> getUserToken() async {
    final db = await dbProvider.database;
    try {
      var res = await db.rawQuery("SELECT token FROM $userTable WHERE id=0");
      return res.isNotEmpty ? GetTokenDatabase.fromJson(res.first) : null;
    } catch (err) {
      return null;
    }
  }
}
