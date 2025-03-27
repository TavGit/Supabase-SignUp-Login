import 'package:flutter/material.dart';
import 'package:supabase_auth/Auth/auth_gate.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  await Supabase.initialize(
    anonKey: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imp0d2VhbHBzcmRsb2hrZmhteHJmIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDI5OTczODcsImV4cCI6MjA1ODU3MzM4N30.i9ly3FiBzMZLpcA2-wRWYGNIjTyFpmgBb5ymTOOpLas",
    url: "https://jtwealpsrdlohkfhmxrf.supabase.co",
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AuthGate(),
    );
  }
}

