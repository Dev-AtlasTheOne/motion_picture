import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:motion_picture/model/Movie.dart';
import 'package:motion_picture/db/db_movie.dart';

class MovieDetails extends StatefulWidget {
  final int movieId;

  const MovieDetails({super.key, required this.movieId});

  @override
  State<MovieDetails> createState() => _MovieDetails();
}

class _MovieDetails extends State<MovieDetails> {
  late TextEditingController priceController;
  late TextEditingController stockController;
  Movie? movie;
  bool loading = true;

  Future<void> loadMovie() async {
    Movie? result = await DbMovie.getMovieById(widget.movieId);

    if (!mounted) return;

    setState(() {
      movie = result;

      if (result != null) {
        priceController.text = result.price.toString();
        stockController.text = result.stockNumber.toString();
      }

      loading = false;
    });
  }

  @override
  void initState() {
    super.initState();

    priceController = TextEditingController();
    stockController = TextEditingController();

    loadMovie();
  }

  @override
  void dispose() {
    priceController.dispose();
    stockController.dispose();
    super.dispose();
  }

  Future<void> updateMovie() async {
    double? price = double.tryParse(priceController.text);
    int? stock = int.tryParse(stockController.text);

    if (price == null || stock == null || price < 0 || stock < 0) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Informe valores válidos!')));
      return;
    }

    if (movie == null) return;

    movie!.price = price;
    movie!.stockNumber = stock;

    await DbMovie.updateMovie(movie!);

    if (!mounted) return;

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Filme atualizado com sucesso!')),
    );

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    if (loading) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    if (movie == null) {
      return const Scaffold(body: Center(child: Text('Filme não encontrado!')));
    }
    return Scaffold(
      appBar: AppBar(title: const Text('Detalhes do Filme')),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: ListView(
          children: [
            const Icon(Icons.movie, size: 100),

            const SizedBox(height: 20),

            Text(
              movie?.title ?? 'Carregando...',
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 30),

            const Text('Preço', style: TextStyle(fontWeight: FontWeight.bold)),

            TextField(
              controller: priceController,
              keyboardType: const TextInputType.numberWithOptions(
                decimal: true,
              ),
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*')),
              ],
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                prefixText: 'R\$ ',
              ),
            ),

            const SizedBox(height: 20),

            const Text(
              'Quantidade em estoque',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),

            TextField(
              controller: stockController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                suffixText: 'unidades',
              ),
            ),

            const SizedBox(height: 30),

            ElevatedButton.icon(
              onPressed: updateMovie,
              icon: const Icon(Icons.save),
              label: const Text('Salvar alterações'),
            ),
          ],
        ),
      ),
    );
  }
}
