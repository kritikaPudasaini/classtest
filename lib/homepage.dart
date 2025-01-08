import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final List<Map<String, String>> students;

  const HomePage({Key? key, required this.students}) : super(key: key);

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
                  subtitle: Text(student['email']!),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => StudentDetails(student: student),
                      ),
                    );
                  },
                );
              },
            ),
    );
  }
}

class StudentDetails extends StatelessWidget {
  final Map<String, String> student;

  const StudentDetails({Key? key, required this.student}) : super(key: key);

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
          ],
        ),
      ),
    );
  }
}
