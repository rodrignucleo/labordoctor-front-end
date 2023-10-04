// import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

const String livrosTableName = 'livro';
const String listasTableName = 'listas';
const String relacaoTableName = 'relacao';

class DatabaseSqflite {
  static Future<Database> openDb() async {
    // quando precisar eliminar o banco de dados
    // utilize esta linha comentada
    // await deleteDatabase(join(await getDatabasesPath(), 'persistencia.db'));

    final db = await openDatabase(
      'persistencia.db',
      version: 1,
      onCreate: (db, version) {
        return createTables(db);
      },
    );
    return db;
  }

// criando as tabelas
  static Future<void> createTables(Database db) async {
    await db.execute('''
      CREATE TABLE $livrosTableName (
        livroId INTEGER PRIMARY KEY AUTOINCREMENT,
        titulo TEXT,
        autor TEXT,
        genero TEXT,
        avaliacao DOUBLE
      );
    ''');

    await db.execute('''
      CREATE TABLE $listasTableName (
        listaId INTEGER PRIMARY KEY AUTOINCREMENT,
        nome TEXT,
        descricao TEXT
      )
    ''');

    await db.execute('''
      CREATE TABLE $relacaoTableName (
        listaId INTEGER,
        livroId INTEGER,
        titulo TEXT,
        autor TEXT,
        genero TEXT,
        avaliacao DOUBLE
      )
    ''');
  }
}
