// ignore_for_file: depend_on_referenced_packages

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class ClasseDoSqlite {
  static final ClasseDoSqlite _instance = ClasseDoSqlite._internal();

  factory ClasseDoSqlite() {
    return _instance;
  }

  ClasseDoSqlite._internal();

  Database? _database;

  Future<Database> get database async {
    if (_database != null && _database!.isOpen) {
      return _database!;
    }

    _database = await initializeDatabase();
    return _database!;
  }

  Future<Database> initializeDatabase() async {
    final databasesPath = await getDatabasesPath();
    final path = join(databasesPath, 'Registro_de_clientes.db');

    _database = await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute('''
          CREATE TABLE Clientes (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            nome TEXT,
            bairro TEXT,
            descricao TEXT
          )
        ''');
      },
    );

    return _database!;
  }

  Future<void> insertRegistro(
      String nome, String bairro, String descricao) async {
    Database db = await database;

    await db.insert(
      'Clientes',
      {'nome': nome, 'bairro': bairro, 'descricao': descricao},
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Map<String, dynamic>>> getAllRegistros() async {
    Database db = await database;

    return await db.query('Clientes');
  }

  Future<Map<String, dynamic>?> getRegistroById(int id) async {
    Database db = await database;

    List<Map<String, dynamic>> result = await db.query(
      'Clientes',
      where: 'id = ?',
      whereArgs: [id],
    );

    return result.isNotEmpty ? result.first : null;
  }

  Future<void> updateRegistroById(
      int id, String novoNome, String novoBairro, String novaDescricao) async {
    Database db = await database;

    await db.update(
      'Clientes',
      {'nome': novoNome, 'bairro': novoBairro, 'descricao': novaDescricao},
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<void> deleteRegistroById(int id) async {
    Database db = await database;

    await db.delete(
      'Clientes',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
