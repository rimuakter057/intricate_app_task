import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import '../models/offline_api_model.dart';


class GetDBHelper {
  static Database? _db;

  static Future<Database> _initDB() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'get_api_posts.db');

    return openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE posts (
            userId INTEGER,
            id INTEGER PRIMARY KEY,
            title TEXT,
            body TEXT
          )
        ''');
      },
    );
  }

  static Future<Database> get database async {
    _db ??= await _initDB();
    return _db!;
  }

  static Future<void> insertPosts(List<GetApiModel> posts) async {
    final db = await database;
    await db.delete('posts');
    for (var post in posts) {
      await db.insert('posts', post.toMap(),
          conflictAlgorithm: ConflictAlgorithm.replace);
    }
  }

  static Future<List<GetApiModel>> getPosts() async {
    final db = await database;
    final maps = await db.query('posts');
    return List.generate(maps.length, (i) => GetApiModel.fromMap(maps[i]));
  }
}
