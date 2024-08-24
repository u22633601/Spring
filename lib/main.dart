import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:spring/models/worker_model.dart';
import 'package:spring/screens/home_screen.dart';
import 'package:spring/screens/rate_worker_screen.dart';
import 'package:spring/screens/register_worker_screen.dart';
import 'package:spring/screens/skills_development_screen.dart';
import 'package:spring/screens/my_information_screen.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Supabase
  await Supabase.initialize(
    url: 'https://qvljfhzifxnpzpxlndqv.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InF2bGpmaHppZnhucHpweGxuZHF2Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MjM1NzQ3NDQsImV4cCI6MjAzOTE1MDc0NH0.tzubCHN3C_BF09MG5fG3DGrKetLFPV2jmvAKzKL2ZBk',
  );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Spring App',
      theme: ThemeData(
        primaryColor: Colors.green[800],
        scaffoldBackgroundColor: Colors.white, // White background
        textTheme: GoogleFonts.poppinsTextTheme(
          Theme.of(context).textTheme.apply(bodyColor: Colors.black),
        ),
        appBarTheme: AppBarTheme(
          color: Colors.green[800], // Green app bar
          elevation: 5, toolbarTextStyle: GoogleFonts.poppinsTextTheme(
            Theme.of(context).textTheme.apply(bodyColor: Colors.white),
          ).bodyMedium, titleTextStyle: GoogleFonts.poppinsTextTheme(
            Theme.of(context).textTheme.apply(bodyColor: Colors.white),
          ).titleLarge,
        ),
        cardColor: Colors.white, colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.greenAccent), // White card background
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/registerWorker': (context) => RegisterWorkerScreen(),
        '/rateWorker': (context) => RateWorkerScreen(),
        '/skillsDevelopment': (context) => SkillsDevelopmentScreen(),
        '/myInformation': (context) => MyInformationScreen(),
      },
    );
  }
}
