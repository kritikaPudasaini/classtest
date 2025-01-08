import 'package:flutter/material.dart';
import 'detail_screen.dart';

class ListScreen extends StatelessWidget {
  final List<Map<String, String>> students;

  const ListScreen({super.key, required this.students});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Student List'),
      ),
      body: students.isEmpty
          ? const Center(child: Text('No students added yet!'))
          : ListView.builder(
              itemCount: students.length,
              itemBuilder: (context, index) {
                final student = students[index];
                return ListTile(
                  title: Text(student['name']!),
                  subtitle: Text('Age: ${student['age']}'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            DetailScreen(student: student),
                      ),
                    );
                  },
                );
              },
            ),
    );
  }
}
