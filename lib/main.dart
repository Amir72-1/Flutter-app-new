// import 'package:first_app/pages/homepage_widget/profile_page.dart';
import 'package:flutter/material.dart';
import 'pages/home_page.dart'; 

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Healthapp',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Poppins',
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(113, 16, 35, 130)),
      ),
      home: HomePage(), 
      
    );
  }
}

