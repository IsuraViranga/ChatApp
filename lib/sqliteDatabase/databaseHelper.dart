import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:chatapp/Model/MessageModel.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  factory DatabaseHelper() => _instance;
  static Database? _database;

  DatabaseHelper._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'messageContainer.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE messageContainer(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            senderId TEXT,
            receiverId TEXT,
            read BOOLEAN NOT NULL CHECK (read IN (0, 1)),
            message TEXT,
            type TEXT,
            time TEXT
          )
        ''');
      },
    );
  }

  Future<void> insertMessage(MessageModel message) async {
    final db = await database;
    await db.insert(
      'messageContainer',
      message.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<MessageModel>> getMessages(String senderId, String receiverId) async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query(
      'messageContainer',
      where: '(senderId = ? AND receiverId = ?) OR (senderId = ? AND receiverId = ?)',
      whereArgs: [senderId, receiverId, receiverId, senderId],
    );
    return List.generate(maps.length, (i) {
      return MessageModel.fromMap(maps[i]);
    });
  }
}
