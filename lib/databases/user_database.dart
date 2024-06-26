import 'package:get/get.dart';
import 'package:habit_app/model/user_model.dart';
import 'package:sqflite/sqflite.dart' as sql;

class UserDatabase extends GetxController implements GetxService{
  static Future<void> createTables(sql.Database database) async {
    await database.execute("""CREATE TABLE user(
        id TEXT PRIMARY KEY NOT NULL,
        userName TEXT,
        user_id TEXT,
        email TEXT,
        totalWorkHours INTEGER,
        profilePhoto TEXT,
        taskCompleted INTEGER,
        createdAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
      )
      """);
  }

  static Future<sql.Database> db() async {
    return sql.openDatabase(
      'userCache.db',
      version: 1,
      onCreate: (sql.Database database, int version) async {
        await createTables(database);
      },
    );
  }

  Future<Map<String, dynamic>> createItem(
      {required String email,
      required String userName,
      required String profilePhoto,
      required int taskCompleted,
      required int totalWorkHours,
      required String user_id}) async {
    final db = await UserDatabase.db();
    final UserModel tipsModel = UserModel(
      id: user_id,
      email: email,
      profilePhoto: profilePhoto,
      taskCompleted: taskCompleted,
      totalWorkHours: totalWorkHours,
      userName: userName,
      user_id: user_id,
    );

    final data = tipsModel.toMap();
    final id = await db.insert('user', data,
        conflictAlgorithm: sql.ConflictAlgorithm.replace);

    return data;
  }

  Future<List<UserModel>> getItems() async {
    final db = await UserDatabase.db();

    final List<Map<String, dynamic>> maps =
        await db.query('user', orderBy: "id");
    final data =
        List<UserModel>.from(maps.map((map) => UserModel.fromMap(map)));
    // tipsList = data;

    // Convert List<Map<String, dynamic>> to List<TipsModel>
    return data;
  }


  // Future<int> updateItem(UserModel user) async {
  //   final db = await UserDatabase.db();
  //   return await db.update(
  //     'user',
  //     user.toMap(),
  //     where: "id = ?",
  //     whereArgs: [user.id],
  //   );
  // }

  Future<UserModel> updateItem(UserModel user) async {
    final db = await UserDatabase.db();

    // Update the user in the database
    await db.update(
      'user',
      user.toMap(),
      where: "id = ?",
      whereArgs: [user.id],
    );

    // Retrieve the updated user
    final List<Map<String, dynamic>> maps = await db.query(
      'user',
      where: "id = ?",
      whereArgs: [user.id],
      limit: 1,
    );

    if (maps.isNotEmpty) {
      return UserModel.fromMap(maps.first);
    } else {
      throw Exception('Failed to update user with id ${user.id}');
    }
  }



  Future<List<UserModel>> getItem(String id) async {
    final db = await UserDatabase.db();
    final List<Map<String, dynamic>> maps =
        await db.query('user', where: "id = ?", whereArgs: [id], limit: 1);
    final data =
        List<UserModel>.from(maps.map((map) => UserModel.fromMap(map)));

    return data;
  }
}
