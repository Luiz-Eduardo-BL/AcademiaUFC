import 'package:academia_ufc/screens/home/home_screen.dart';
import 'package:academia_ufc/screens/materials/add_materials.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'screens/auth/login_screen.dart';
import 'screens/auth/register_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      routes: {
        '/add': (context) => const AddMaterials(),
        '/home': (context) => HomeScreen(),
        '/login': (context) => LoginScreen(),
        '/': (context) => const RegisterScreen()
      },
    );
  }
}
