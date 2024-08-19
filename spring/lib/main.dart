import 'package:flutter/material.dart';
import 'package:spring/landing_page.dart';
import 'package:spring/login_page.dart';
import 'package:spring/signup_page.dart';
import 'package:spring/home_page.dart';
import 'package:spring/worker_details.dart';
import 'package:spring/register_worker_page.dart';
import 'package:spring/rate_worker_page.dart';
import 'package:spring/bottom_navbar.dart';
import 'package:spring/profile_page.dart';
import 'package:spring/job_listing_page.dart';

void main() {
  runApp(SpringApp());
}

class SpringApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Spring',
      theme: ThemeData(
        primaryColor: Color(0xFF1A5F7A),
        scaffoldBackgroundColor: Color(0xFFF9F9F9),
        chipTheme: ChipThemeData(
          backgroundColor: Color(0xFFE1F5FE),
          disabledColor: Color(0xFFE0E0E0),
          selectedColor: Color(0xFF81D4FA),
          secondarySelectedColor: Color(0xFF81D4FA),
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
          labelStyle: TextStyle(color: Color(0xFF1A5F7A)),
          secondaryLabelStyle: TextStyle(color: Color(0xFF1A5F7A)),
          brightness: Brightness.light,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white, backgroundColor: Color(0xFF3F8E9C),
            padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: Color(0xFF3F8E9C), width: 2),
          ),
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: Color.fromARGB(255, 102, 212, 255),
          elevation: 0,
        ), colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Color.fromARGB(255, 63, 193, 203)),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => LandingPage(),
        '/login': (context) => LoginPage(),
        '/signup': (context) => SignupPage(),
        '/home': (context) => BottomNavBar(),
        '/worker_details': (context) => WorkerDetailsPage(),
        '/register_worker': (context) => RegisterWorkerPage(),
        '/rate_worker': (context) => RateWorkerPage(),
        '/job_listings': (context) => JobListingsPage(),
      },
    );
  }
}