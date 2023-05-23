import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sample/views/homepage.dart';

//function main
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final MaterialColor mycolor = MaterialColor(
    Colors.purpleAccent.value,
    <int, Color>{
      50: Colors.purpleAccent.withOpacity(0.1),
      100: Colors.purpleAccent.withOpacity(0.2),
      200: Colors.purpleAccent.withOpacity(0.3),
      300: Colors.purpleAccent.withOpacity(0.4),
      400: Colors.purpleAccent.withOpacity(0.5),
      500: Colors.purpleAccent.withOpacity(0.6),
      600: Colors.purpleAccent.withOpacity(0.7),
      700: Colors.purpleAccent.withOpacity(0.8),
      800: Colors.purpleAccent.withOpacity(0.9),
      900: Colors.purpleAccent.withOpacity(1),
    },
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sample',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: mycolor,
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: mycolor,
        ),
        textTheme: const TextTheme(
          titleMedium: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        fontFamily: GoogleFonts.ubuntu().fontFamily,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: mycolor,
            foregroundColor: Colors.white,
          ),
        ),
        appBarTheme: const AppBarTheme(
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarIconBrightness: Brightness.light,
          ),
        ),
      ),
      home: const MyHomePage(title: 'Sample Apps'),
    );
  }
}
