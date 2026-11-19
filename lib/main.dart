
import 'package:flutter/material.dart';
import 'view/main_screen.dart';

ValueNotifier<ThemeMode> themeNotifier =
    ValueNotifier(ThemeMode.light);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: themeNotifier,

      builder: (context, tema, child) {
        return MaterialApp(
          title: "Motion Picture",

          themeMode: tema,

          // LIGHT THEME
          theme: ThemeData(
            brightness: Brightness.light,
            primaryColor: Colors.red,

            scaffoldBackgroundColor: const Color(0xFFF5F5F5),

            colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.red,
              brightness: Brightness.light,
            ),

            appBarTheme: const AppBarTheme(
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
              elevation: 2,
            ),

            cardTheme: CardThemeData(
              color: Colors.white,
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),

            floatingActionButtonTheme:
                const FloatingActionButtonThemeData(
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
            ),

            inputDecorationTheme: const InputDecorationTheme(
              border: OutlineInputBorder(),
            ),
          ),

          // DARK THEME
          darkTheme: ThemeData(
            brightness: Brightness.dark,

            scaffoldBackgroundColor: const Color(0xFF121212),

            colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.red,
              brightness: Brightness.dark,
              surface: const Color(0xFF1E1E1E),
            ),

            appBarTheme: const AppBarTheme(
              backgroundColor: Color(0xFF1A1A1A),
              foregroundColor: Colors.white,
              elevation: 0,
            ),

            cardTheme: CardThemeData(
              color: const Color(0xFF252525),
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),

            floatingActionButtonTheme:
                const FloatingActionButtonThemeData(
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
            ),

            inputDecorationTheme: const InputDecorationTheme(
              border: OutlineInputBorder(),
            ),
          ),

          home: MainScreen(),
        );
      },
    );
  }
}
