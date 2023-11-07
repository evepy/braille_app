import 'package:braille_app/screens/alfabeto.dart';
import 'package:braille_app/screens/onboarding.dart';
import 'package:braille_app/screens/diacriticoswg.dart';
import 'package:braille_app/screens/inicio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

int initScreen = 0;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences preferences = await SharedPreferences.getInstance();
  final bool hasRunBefore = preferences.getBool('hasRunBefore') ?? false;

  runApp( MaterialApp(
      title: 'BrailleApp',
      debugShowCheckedModeBanner: false,
      initialRoute: hasRunBefore ? '/home' : '/',
      routes: {
        '/': (context) => Onboarding(),
        '/home': (context) => Inicio(),
        '/alfabeto': (context) => AlfabetoPg(),
        '/diacriticos': (context) => DiacriticosWidget(),
      },
    ));
}
