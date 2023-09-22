import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_todo_app/view/splash/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  Future<void> main() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}

//0A:C4:2D:8F:B0:55:F8:32:08:AB:FF:37:22:55:0C:6B:90:85:3F:48
