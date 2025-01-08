import 'package:flutter/material.dart';

class Student {
  String name;
  int age;
  String major;

  Student({required this.name, required this.age, required this.major});
}


List<Student> students = [];

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:false,
      title: 'Student App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: StudentForm(),
    );
  }
}

class StudentForm extends StatefulWidget {
  @override
  _StudentFormState createState() => _StudentFormState();
}

class _StudentFormState extends State<StudentForm> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _ageController = TextEditingController();
  final _majorController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
    
      appBar: AppBar(
        title: Text('Add Student'),
      ),
   body: GestureDetector(
  onTap: () {
    FocusScope.of(context).unfocus();
  },
  child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(labelText: 'Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter name';
                  }
                  return null;
                },
              ),
              SizedBox(height:4),
              TextFormField(
                controller: _ageController,
                decoration: InputDecoration(labelText: 'Age'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter age';
                  }
                  if (int.tryParse(value) == null) {
                    return 'Please enter a valid number';
                  }
                  return null;
                },
              ),
              SizedBox(height:4),
              TextFormField(
                controller: _majorController,
                decoration: InputDecoration(labelText: 'Major'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter major';
                  }
                  return null;
                },
              ),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                  
                    students.add(Student(
                      name: _nameController.text,
                      age: int.parse(_ageController.text),
                      major: _majorController.text,
                    ));

                   
                    _nameController.clear();
                    _ageController.clear();
                    _majorController.clear();

                  
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => StudentList()),
                    );
                  }
                },
                child: Text('Add Student'),
              ),
            ],
          ),
        ),
      ),
   ),
    );
  }
}

class StudentList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Student List'),
      ),
      body: ListView.builder(
        itemCount: students.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(students[index].name),
            subtitle: Text('Age: ${students[index].age}, Major: ${students[index].major}'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => StudentDetail(student: students[index]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class StudentDetail extends StatelessWidget {
  final Student student;

  StudentDetail({required this.student});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(student.name),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Name: ${student.name}'),
            Text('Age: ${student.age}'),
            Text('Major: ${student.major}'),
          ],
        ),
      ),
    );
  }
}

