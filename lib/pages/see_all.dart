import 'package:flutter/material.dart';

class SeeAll extends StatelessWidget {
  const SeeAll({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.blue,
    
        title: const Text('Doctor speciality'),
      ),
      body: const Center(
        child: Text('This is the See all Page'),
      ),
    );
  }
}