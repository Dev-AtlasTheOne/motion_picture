import 'package:flutter/material.dart';
import 'package:motion_picture/components/appBar.dart';
import 'package:motion_picture/main.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: Bar("C O N F I G U R A Ç Õ E S"),

      body: ValueListenableBuilder<ThemeMode>(
        valueListenable: themeNotifier,

        builder: (context, tema, child) {

          bool dark = tema == ThemeMode.dark;

          return ListView(
            children: [

              SwitchListTile(
                title: const Text('Dark Mode'),

                subtitle: Text(
                  dark ? 'Tema escuro ativado' : 'Tema claro ativado',
                ),

                secondary: Icon(
                  dark ? Icons.dark_mode : Icons.light_mode,
                ),

                value: dark,

                onChanged: (value) {

                  themeNotifier.value = value
                      ? ThemeMode.dark
                      : ThemeMode.light;

                },
              ),

            ],
          );
        },
      ),
    );
  }
}