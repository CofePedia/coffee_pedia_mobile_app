import 'dart:async';
import 'dart:io';

import 'package:coffepedia/data/models/basket.dart';
import 'package:coffepedia/data/models/gettoken_database.dart';
import 'package:coffepedia/data/models/login_data_user.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseProvider {
  static final DatabaseProvider dbProvider = DatabaseProvider();

  static final userTable = 'userTable';
  static final columnIdUser = 'id';
  static final columnTokenUser = 'token';

  static final basketTable = 'basketTable';
  static final columnIdBasket = 'id';
  static final columnProductIdBasket = 'product_id';
  static final columnQuantityBasket = 'quantity';
  static final columnPriceBasket = 'price';
  static final columnPriceBeforeDiscountBasket = 'price_before_discount';
  static final columnNameBasket = 'name';
  static final columnVendorBasket = 'vendor';
  static final columnImageBasket = 'image';
  static final columnStockBasket = 'stock';
  // static final wishesTable = 'wishesTable';
  // static final columnIdWishes = 'id';
  // static final columnProductIdWishes = 'product_id';

  Database? _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }
    _database = await createDatabase();
    return _database!;
  }

  Future<Database> createDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "User.db");

    var database = await openDatabase(
      path,
      version: 6,
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
        "$columnIdUser INTEGER PRIMARY KEY, "
        "$columnTokenUser TEXT "
        ")");
    await database.execute("CREATE TABLE $basketTable ("
        /*"$columnIdBasket INTEGER PRIMARY KEY autoincrement, "*/
        "$columnProductIdBasket integer PRIMARY KEY, "
        "$columnQuantityBasket integer, "
        "$columnPriceBasket TEXT, "
        "$columnStockBasket integer, "
        "$columnNameBasket TEXT, "
        "$columnVendorBasket TEXT, "
        "$columnImageBasket TEXT, "
        "$columnPriceBeforeDiscountBasket integer "
        ")");
    // await database.execute("CREATE TABLE $wishesTable ("
    //     "$columnIdWishes INTEGER PRIMARY KEY autoincrement, "
    //     "$columnProductIdWishes integer "
    //     ")");
  }
}

class UserDao {
  final dbProvider = DatabaseProvider.dbProvider;

  Future<int> createUser(
    LoginData user,
  ) async {
    final db = await dbProvider.database;
    var result = db
        .insert(DatabaseProvider.userTable, {"id": "15", "token": user.token});
    getUserToken();
    return result;
  }

  Future<int> deleteUser() async {
    final db = await dbProvider.database;
    var result = await db.delete(
      DatabaseProvider.userTable,
      // where: "id = 0",
      // whereArgs: [id],
    );
    return result;
  }

  Future<int> updateUser(int id, LoginDataUser user) async {
    final db = await dbProvider.database;
    var result = await db.update(DatabaseProvider.userTable, user.toJson(),
        where: "id = ?", whereArgs: [id]);
    return result;
  }

  Future<bool> checkUser(String token) async {
    final db = await dbProvider.database;
    try {
      List<Map> users = await db.query(DatabaseProvider.userTable,
          where: 'token = ?', whereArgs: [token]);
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
      List<Map> users = await db
          .query(DatabaseProvider.userTable, where: 'id = ?', whereArgs: [id]);
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
      var res = await db.rawQuery(
          "SELECT token FROM ${DatabaseProvider.userTable} WHERE id=15");
      return res.isNotEmpty ? GetTokenDatabase.fromJson(res.first) : null;
    } catch (err) {
      return null;
    }
  }

  //BASKET ...
  Future<int> addProductInLocalBasket(BasketLocal basketLocal) async {
    final db = await dbProvider.database;
    // row to insert
    Map<String, dynamic> row = {
      DatabaseProvider.columnProductIdBasket: basketLocal.productId,
      DatabaseProvider.columnQuantityBasket: basketLocal.quantity,
      DatabaseProvider.columnPriceBasket: basketLocal.price,
      DatabaseProvider.columnStockBasket: basketLocal.stock,
      DatabaseProvider.columnNameBasket: basketLocal.name,
      DatabaseProvider.columnVendorBasket: basketLocal.vendor,
      DatabaseProvider.columnImageBasket: basketLocal.image,
      DatabaseProvider.columnPriceBeforeDiscountBasket:
          basketLocal.priceBeforeDiscount,
    };
    // do the insert and get the id of the inserted row
    int id = await db.insert(DatabaseProvider.basketTable, row);
    // show the results: print all rows in the db
    print('Local Basket ${await db.query(DatabaseProvider.basketTable)}');
    return id;
  }

  Future deleteFromLocalBasket(int productId) async {
    final db = await dbProvider.database;
    var result = await db.delete(DatabaseProvider.basketTable,
        where: '${DatabaseProvider.columnProductIdBasket} = ?',
        whereArgs: [productId]);
    print(await db.query(DatabaseProvider.basketTable));
    return result;
  }

  Future truncateLocalBasket() async {
    final db = await dbProvider.database;
    var result =
        await db.execute("DELETE FROM ${DatabaseProvider.basketTable}");
    print(await db.query(DatabaseProvider.basketTable));
    print("local basket is empty!!");
    return result;
  }

  Future updateQuantityInLocalBasket(int productId, int quantity) async {
    final db = await dbProvider.database;
    var result = await db.execute("UPDATE ${DatabaseProvider.basketTable} "
        "SET ${DatabaseProvider.columnQuantityBasket} = $quantity "
        "WHERE ${DatabaseProvider.columnProductIdBasket} = $productId");
    print(await db.query(DatabaseProvider.basketTable));
    return result;
  }

  Future incrementQuantityInLocalBasket(int productId) async {
    final db = await dbProvider.database;
    var result = await db.execute("UPDATE ${DatabaseProvider.basketTable} "
        "SET ${DatabaseProvider.columnQuantityBasket} = ${DatabaseProvider.columnQuantityBasket} + 1 "
        "WHERE ${DatabaseProvider.columnProductIdBasket} = $productId");
    print(await db.query(DatabaseProvider.basketTable));
    return result;
  }

  Future decrementQuantityInLocalBasket(int productId) async {
    final db = await dbProvider.database;
    var result = await db.execute("UPDATE ${DatabaseProvider.basketTable} "
        "SET ${DatabaseProvider.columnQuantityBasket} = ${DatabaseProvider.columnQuantityBasket} - 1 "
        "WHERE ${DatabaseProvider.columnProductIdBasket} = $productId");
    print(await db.query(DatabaseProvider.basketTable));
    return result;
  }

  Future<List<BasketLocal>> getAllLocalProductsFromBasket() async {
    final db = await dbProvider.database;
    // do the insert and get the id of the inserted row
    List<Map> result = await db.query(DatabaseProvider.basketTable);

    List<BasketLocal> baskets = [];
    // print the results
    result.forEach((row) {
      baskets.add(BasketLocal(
        productId: row[DatabaseProvider.columnProductIdBasket],
        quantity: row[DatabaseProvider.columnQuantityBasket],
        price: row[DatabaseProvider.columnPriceBasket],
        name: row[DatabaseProvider.columnNameBasket],
        vendor: row[DatabaseProvider.columnVendorBasket],
        image: row[DatabaseProvider.columnImageBasket],
        stock: row[DatabaseProvider.columnStockBasket],
        priceBeforeDiscount:
            row[DatabaseProvider.columnPriceBeforeDiscountBasket],
      ));
    });

    return baskets;
  }
// final data = {
//   basketTable: [
//     {"product_id": 10, "quantity": "img1"},
//     {"id": 11, "name": "img2"}
//   ],
// };
//
// final String dataAsJson = json.encode(data);
//basket...
/* Future<int> addProductInBasket(BasketDataItems basket , String quantity) async {
    final db = await dbProvider.database;
    // row to insert
    Map<String, dynamic> row = {
      DatabaseProvider.columnProductIdBasket  : basket.id.toString(),
      DatabaseProvider.columnQuantityBasket  : quantity
    };
    // do the insert and get the id of the inserted row
    int id = await db.insert(DatabaseProvider.wishesTable, row);
    // show the results: print all rows in the db
    print(await db.query(DatabaseProvider.wishesTable));
    return id;
  }
  Future<int> deleteBasket(int id) async {
    final db = await dbProvider.database;
    var result = await db.delete(DatabaseProvider.basketTable, where: 'id = ?', whereArgs: [id]);
    return result;
  }
  Future<int> updateBasket(BasketDataItems basket) async {
    final db = await dbProvider.database;
    var result = await db.update(DatabaseProvider.basketTable, basket.toJson(),
        where: "id = ?", whereArgs: [basket.id]);
    return result;
  }

*/
}
