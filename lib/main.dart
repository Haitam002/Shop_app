// Import the necessary Flutter packages
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/providers/cart_provider.dart';
import 'package:shopping_app/pages/home_page.dart';

// Main function to run the Flutter application
void main() {
  runApp(const MyApp());
}

// Define the root widget for the Flutter application
class MyApp extends StatelessWidget {
  // Constructor for the MyApp widget
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    // Use ChangeNotifierProvider to provide the CartProvider to the widget tree
    return ChangeNotifierProvider(
      create: (context) => CartProvider(),
      child: MaterialApp(
        // Define the overall theme for the entire application
        theme: ThemeData(
          fontFamily: 'Lato',
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromRGBO(254, 206, 1, 1),
            primary: const Color.fromRGBO(254, 206, 1, 1),
          ),
          textTheme: const TextTheme(
            titleLarge: TextStyle(fontWeight: FontWeight.bold, fontSize: 35),
            titleMedium: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            bodySmall: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          appBarTheme: const AppBarTheme(
            titleTextStyle: TextStyle(fontSize: 20, color: Colors.black),
          ),
          inputDecorationTheme: const InputDecorationTheme(
            hintStyle: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
            prefixIconColor: Color.fromRGBO(119, 119, 119, 1),
          ),
          useMaterial3: true,
        ),
        // Set the title and configure debugging banner
        title: 'Shopping App',
        debugShowCheckedModeBanner: false,
        // Set the home page of the application to the HomePage widget
        home: const HomePage(),
      ),
    );
  }
}
