import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ms_lab/screens/tabs_screen.dart';

var kColorScheme =
ColorScheme.fromSeed(seedColor: const Color.fromARGB(115, 242, 244, 255));

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(ProviderScope(
    child: MaterialApp(
      theme: ThemeData(
        colorScheme: kColorScheme,
        appBarTheme: AppBarTheme(
          backgroundColor: kColorScheme.primaryContainer,
          foregroundColor: kColorScheme.onSecondaryContainer,
        ),
        cardTheme: CardTheme(
          color: kColorScheme.secondaryContainer,
          margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: kColorScheme.primaryContainer,
          ),
        ),
        fontFamily: GoogleFonts.lato().fontFamily,
        textTheme: GoogleFonts.latoTextTheme().copyWith(
          titleLarge: TextStyle(
            fontWeight: FontWeight.bold,
            color: kColorScheme.onPrimaryContainer,
          ),
        ),
        scaffoldBackgroundColor: kColorScheme.primaryContainer,
      ),
      home: const TabsScreen(),
    ),
  ));
}
