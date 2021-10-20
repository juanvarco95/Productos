import 'package:flutter/material.dart';
import 'package:productos_app/screens/screens.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Productos',
      debugShowCheckedModeBanner: false,
      initialRoute: 'home',
      theme: ThemeData.light().copyWith(
          scaffoldBackgroundColor: Colors.grey[300],
          floatingActionButtonTheme: const FloatingActionButtonThemeData(
              backgroundColor: Colors.teal, elevation: 0),
          appBarTheme:
              const AppBarTheme(backgroundColor: Colors.teal, elevation: 0)),
      routes: {
        'login': (_) => const LoginScreen(),
        'home': (_) => const HomeScreen(),
        'productScreen': (_) => const ProductScreen()
      },
    );
  }
}
