import 'dart:convert';
import 'package:motion_picture/model/Movie.dart';
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

  static Future<void> createDB(Database db, int versao) async {
    await db.execute('''
      
      CREATE TABLE Movie (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        title TEXT NOT NULL,
        price INTEGER NOT NULL,
        stockNumber INTEGER NOT NULL,
      )

      ''');
  }

  static Future<bool> movieExists(String movieTitle) async {
    Database db = await banco();

    List<Map<String, dynamic>> dados = await db.query(
      'Movie',
      columns: ['id'],
      where: 'title = ?',
      whereArgs: [movieTitle],
      limit: 1,
    );

    return dados.isNotEmpty;
  }

  static Future<Movie?> insertMovie(Movie movie) async {
    bool existe = await movieExists(movie.title);

    if (existe) {
      return null;
    }

    Database db = await banco();

    Map<String, dynamic> dados = movie.toMap();

    int id = await db.insert('Movie', dados);

    movie.id = id;

    return movie;
  }

  static Future<Movie?> movieAuth(
    String title,
    int price,
    int stockNumber,
  ) async {
    Database db = await banco();

    List<Map<String, dynamic>> dados = await db.query(
      'Movie',
      where: 'title = ?',
      whereArgs: [title],
      limit: 1,
    );

    if (dados.isEmpty) {
      return null;
    }

    return Movie.fromMap(dados.first);
  }

  static Future<List<Movie>> buscarTodosJogadores() async {
    Database db = await banco();

    List<Map<String, dynamic>> dados = await db.query(
      'Movie',
      orderBy: 'title',
    );

    return dados.map(Movie.fromMap).toList();
  }

  static Future<void> updateMovie(Movie movie) async {
    if (movie.id == null) {
      return;
    }

    Database db = await banco();

    await db.update(
      'Movie',
      movie.toMap(),
      where: 'id = ?',
      whereArgs: [movie.id],
    );
  }

  static Future<void> removeMovie(Movie movie) async {
    if (movie.id == null) {
      return;
    }

    Database db = await banco();

    await db.delete('Movie', where: 'id = ?', whereArgs: [movie.id]);
  }
}
