import 'dart:convert';

import 'package:path/path.dart';
import 'package:crypto/crypto.dart';
import 'package:sqflite/sqflite.dart';

class DbMovie {
  static Database? _db;

  static Future<Database> banco() async {
    if (_db != null) {
      return _db!;
    }

    String pasta = await getDatabasesPath();

    String caminho = join(pasta, 'db_movie.db');

    _db = await openDatabase(caminho, version: 1, onCreate: createDB);

    return _db!;
  }


  static Future<void> createDB(
    Database db,
    int versao,
  ) async {
    await db.execute(
      '''
      CREATE TABLE User (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT NOT NULL,
        senha_hash TEXT NOT NULL,
        email TEXT NOT NULL,
      )
      ''',
    );
  }

  static String gerarHashSenha(
    String senha,
  ) {
    List<int> bytes =
        utf8.encode(senha);

    return sha256
        .convert(bytes)
        .toString();
  }
}
