import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:spring/screens/home_screen.dart';
import 'package:spring/screens/register_worker_screen.dart';
import 'package:spring/screens/skills_development_screen.dart';
import 'package:spring/screens/my_information_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Spring App',
      theme: ThemeData(
        primaryColor: Colors.green[800],
        scaffoldBackgroundColor: Color(0xFF1B5E20), // Dark green background
        textTheme: GoogleFonts.poppinsTextTheme(
          Theme.of(context).textTheme.apply(bodyColor: Colors.white),
        ),
        appBarTheme: AppBarTheme(
          color: Color(0xFF2E7D32), // Darker green for the app bar
          elevation: 5, toolbarTextStyle: GoogleFonts.poppinsTextTheme(
            Theme.of(context).textTheme.apply(bodyColor: Colors.white),
          ).bodyMedium, titleTextStyle: GoogleFonts.poppinsTextTheme(
            Theme.of(context).textTheme.apply(bodyColor: Colors.white),
          ).bodyMedium,
        ),
        cardColor: Color(0xFF388E3C), colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.greenAccent), // Green color for cards
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/registerWorker': (context) => RegisterWorkerScreen(),
        '/skillsDevelopment': (context) => SkillsDevelopmentScreen(),
        '/myInformation': (context) => MyInformationScreen(),
      },
    );
  }
}
