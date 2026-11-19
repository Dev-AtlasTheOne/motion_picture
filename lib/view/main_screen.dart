import 'package:flutter/material.dart';
import 'package:motion_picture/view/movie_screen.dart';
import 'package:motion_picture/view/settings.dart';
import '../components/appBar.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Bar("M O T I O N - P I C T U R E"),
      body: corpo(context),
      backgroundColor: Theme.of(context).colorScheme.surface,
    );
  }

  corpo(context) {
    return Center(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsetsGeometry.symmetric(horizontal: 50.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 30,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute<void>(
                      builder: (context) => const MovieScreen(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  shadowColor: Colors.black,
                  foregroundColor: Colors.white,
                  shape: BeveledRectangleBorder(),
                  minimumSize: Size.fromHeight(50),
                  padding: EdgeInsets.all(30.0),
                  elevation: 4.0,
                ),
                child: Text("F I L M E S"),
              ),

              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute<void>(
                      builder: (context) => const Settings(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  shadowColor: Colors.black,
                  foregroundColor: Colors.white,
                  shape: BeveledRectangleBorder(),
                  minimumSize: Size.fromHeight(50),
                  padding: EdgeInsets.all(30.0),
                  elevation: 4.0,
                ),
                child: Text("C O N F I G U R A Ç Õ E S"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
