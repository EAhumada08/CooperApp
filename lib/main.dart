import 'package:cooper_app/features/persons/providers/persons_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './home.dart';

void main() {
  runApp(const CooperApp());
}

class CooperApp extends StatelessWidget {
  const CooperApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => PersonsProvider()),
      ],
      child: MaterialApp(
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.orangeAccent),
        ),
        home: const MyHomePage(),
      ),
    );
  }
}
