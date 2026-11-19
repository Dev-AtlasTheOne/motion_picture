import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:motion_picture/components/appBar.dart';
import 'package:motion_picture/db/db_movie.dart';
import 'package:motion_picture/model/Movie.dart';

class MovieAdd extends StatefulWidget {
  const MovieAdd({super.key});

  @override
  State<MovieAdd> createState() => _MovieAdd();
}

class _MovieAdd extends State<MovieAdd> {
  final titleController = TextEditingController();
  final priceController = TextEditingController();
  final stockController = TextEditingController();

  Future<void> saveMovie() async {
    if (titleController.text.trim().isEmpty) {
      return;
    }

    Movie movie = Movie(
      title: titleController.text.trim(),
      price: double.tryParse(priceController.text) ?? 0,
      stockNumber: int.tryParse(stockController.text) ?? 0,
    );

    Movie? result = await DbMovie.insertMovie(movie);

    if (!mounted) return;

    if (result == null) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Filme já cadastrado!')));
      return;
    }

    Navigator.pop(context, true);
  }

  @override
  void dispose() {
    titleController.dispose();
    priceController.dispose();
    stockController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Bar("A D I C I O N A R - F I L M E"),
      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: const InputDecoration(labelText: 'Titulo'),
            ),

            TextField(
              controller: priceController,
              keyboardType: const TextInputType.numberWithOptions(
                decimal: true,
              ),
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*')),
              ],
              decoration: const InputDecoration(labelText: 'Preço'),
            ),

            TextField(
              controller: stockController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Estoque'),
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: saveMovie,
              child: const Text('Salvar Filme'),
            ),
          ],
        ),
      ),
    );
  }
}
