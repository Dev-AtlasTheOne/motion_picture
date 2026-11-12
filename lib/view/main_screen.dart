import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Bar(),
      body: corpo(),
      backgroundColor: Colors.white,
    );
  }

  corpo() {
    return Center(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsetsGeometry.symmetric(horizontal: 50.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 30,
            children: [
              ElevatedButton(
                onPressed: () {},
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
                onPressed: () {},
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

  Bar() {
    return AppBar(
      title: Text(
        "M O T I O N - P I C T U R E",
        style: TextStyle(color: Colors.white),
      ),
      centerTitle: true,
      backgroundColor: Colors.red,
      elevation: 4,
      shadowColor: Colors.black,
    );
  }
}
