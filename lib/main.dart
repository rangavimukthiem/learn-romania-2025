import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learn_romania/constant/colors.dart';
import 'package:learn_romania/pages/home_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          scaffoldBackgroundColor:
              Theme.of(context).brightness == Brightness.dark
                  ? Colors.black
                  : Colors.white,
          appBarTheme: const AppBarTheme(
              iconTheme: IconThemeData(color: Colors.white),
              backgroundColor: konAppbar,
              toolbarHeight: 60,
              elevation: 5,
              shadowColor: Colors.black,
              titleTextStyle: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20)),
          textTheme: GoogleFonts.interTextTheme(Theme.of(context).textTheme),
          buttonTheme: const ButtonThemeData(
            buttonColor: konButtons,
            textTheme: ButtonTextTheme.primary,
          ),
          cardTheme: const CardTheme(
            color: Color.fromARGB(255, 255, 241, 178),
            shadowColor: konFontBlack,
            elevation: 5,
          ),
          inputDecorationTheme: InputDecorationTheme(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
            filled: true,
            fillColor: konFontBlack,
          ),
        ),
        debugShowCheckedModeBanner: false,
        home: const SafeArea(
          child: MainHomePage(),
        ));
  }
}
