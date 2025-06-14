import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(ViagemChecklistApp());
}

class ViagemChecklistApp extends StatelessWidget {
  const ViagemChecklistApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Checklist de Viagem',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomeScreen(),
    );
  }
}