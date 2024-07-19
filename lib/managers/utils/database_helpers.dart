import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._init();

  static Database? _database;

  DatabaseHelper._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('search_history.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = dbPath + filePath;
    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future<void> _createDB(Database db, int version) async {
    const idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    const textType = 'TEXT NOT NULL';

    await db.execute('''
      CREATE TABLE search_history (
        id $idType,
        query $textType
      )
    ''');
  }

  Future<void> insertQuery(String query) async {
    final db = await instance.database;

    final searchHistory = await getSearchHistory();
    if (!searchHistory.contains(query)) {
      await db.insert('search_history', {'query': query});
    }
  }

  Future<List<String>> getSearchHistory() async {
    final db = await instance.database;
    final result = await db.query('search_history', orderBy: 'id DESC');
    return result.map((json) => json['query'] as String).toList();
  }

  Future<void> deleteSearchHistoryItem(String query) async {
    final db = await instance.database;
    await db.delete('search_history', where: 'query = ?', whereArgs: [query]);
  }

  Future<void> close() async {
    final db = await instance.database;
    db.close();
  }
}
