
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class RecipeLocalDataSource {
  static final RecipeLocalDataSource instance = RecipeLocalDataSource._init();
  static Database? db;

  RecipeLocalDataSource._init();

  Future<Database> get database async {
    if (db != null) return db!;
    db = await _initDB('recipe.db');
    return db!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE recipes (
        id TEXT PRIMARY KEY,
        isFavorite INTEGER NOT NULL
      )
    ''');
  }

  Future<void> updateFavoriteStatus(String id, bool isFavorite) async {
    final db = await instance.database;
    await db.insert(
      'recipes',
      {'id': id, 'isFavorite': isFavorite ? 1 : 0},
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<bool> isFavorite(String id) async {
    final db = await instance.database;
    final maps = await db.query(
      'recipes',
      columns: ['isFavorite'],
      where: 'id = ?',
      whereArgs: [id],
    );

    if (maps.isNotEmpty) {
      return maps.first['isFavorite'] == 1;
    } else {
      return false;
    }
  }
}


