import 'package:flutter/material.dart';
import 'Loginf.dart';
import 'package:flutter_localizations/flutter_localizations.dart';


void main() {
  runApp(const MainApp());
}
   
class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      
      debugShowCheckedModeBanner: false,
      locale: Locale('es'), // Establece el idioma español
      supportedLocales: [
        Locale('es'), // Español
        Locale('en'), // Inglés por si acaso
      ],
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      home: Scaffold(
        body: Loginf()
    )
    );
  }
}
