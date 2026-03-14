import 'package:flutter/material.dart';
import 'pages/dashboard.dart';

void main() {
  runApp(const AlumniTrackerApp());
}

class AlumniTrackerApp extends StatelessWidget {
  const AlumniTrackerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Alumni Tracker',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const DashboardPage(),
    );
  }
}