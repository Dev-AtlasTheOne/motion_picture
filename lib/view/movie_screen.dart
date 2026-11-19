
import 'package:flutter/material.dart';
import 'package:motion_picture/components/appBar.dart';
import 'package:motion_picture/db/db_movie.dart';
import 'package:motion_picture/model/Movie.dart';
import 'package:motion_picture/view/movie_add.dart';
import 'package:motion_picture/view/movie_detail.dart';

class MovieScreen extends StatefulWidget {
  const MovieScreen({super.key});

  @override
  State<MovieScreen> createState() => _MovieScreen();
}

class _MovieScreen extends State<MovieScreen> {
  List<Movie> movies = [];

  @override
  void initState() {
    super.initState();
    loadMovies();
  }

  Future<void> loadMovies() async {
    List<Movie> lista = await DbMovie.searchAllMovies();

    if (!mounted) return;

    setState(() {
      movies = lista;
    });
  }

  Future<void> removeMovie(Movie movie) async {
    await DbMovie.removeMovie(movie);
    await loadMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Bar("F I L M E S"),

      body: movies.isEmpty
          ? const Center(child: Text('Nenhum filme registrado'))
          : ListView.builder(
              itemCount: movies.length,
              itemBuilder: (context, index) {
                Movie movie = movies[index];

                return Card(
                  child: ListTile(
                    leading: const Icon(Icons.movie, size: 35),

                    title: Text(movie.title),

                    onTap: () async {
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              MovieDetails(movieId: movie.id!)
                        ),
                      );

                      loadMovies();
                    },

                    trailing: IconButton(
                      icon: const Icon(
                        Icons.delete,
                        color: Colors.red,
                      ),
                      onPressed: () {
                        removeMovie(movie);
                      },
                    ),
                  ),
                );
              },
            ),

      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const MovieAdd(),
            ),
          );

          loadMovies();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
