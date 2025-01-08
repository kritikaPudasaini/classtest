import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  final Map<String, String> student;

  const DetailScreen({super.key, required this.student});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Student Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Name: ${student['name']}', style: const TextStyle(fontSize: 20)),
            const SizedBox(height: 10),
            Text('Email: ${student['email']}', style: const TextStyle(fontSize: 20)),
            const SizedBox(height: 10),
            Text('Age: ${student['age']}', style: const TextStyle(fontSize: 20)),
          ],
        ),
      ),
    );
  }
}
