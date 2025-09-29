import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DbHelper {
  static Database? db;

  /// OPEN DATABASE
  static Future<void> initDB() async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'students.db');
    db = await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) async {
        // When creating the db, create the table
        await db.execute(
          'CREATE TABLE Students (id INTEGER PRIMARY KEY, name TEXT, age INTEGER)',
        );
      },
    );
  }

  ///Get
  static Future<List<Map<String, dynamic>>> getAllStudents() async {
    final result = await db!.rawQuery('SELECT * FROM Students');
    return result;
  }

  /// Add
  static Future<void> addStudent(String name, int age) async {
    await db!.transaction((txt) async {
      await txt.rawInsert('INSERT INTO Students(name, age) VALUES(?, ?)', [
        name,
        age,
      ]);
    });
  }

  /// update
  static Future<void> update({
    String? oldName,
    String? newName,
    int? newAge,
  }) async {
    await db!.transaction((txt) async {
      await txt.rawUpdate(
        'UPDATE Students SET name = ?, age = ? WHERE name = ?',
        [newName, newAge, oldName],
      );
    });
  }
}
