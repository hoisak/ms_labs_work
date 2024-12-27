import 'package:flutter/material.dart';
import 'package:ms_lab/models/student.dart';
import 'package:ms_lab/widgets/student_list.dart';

class Students extends StatefulWidget {
  const Students({super.key});

  @override
  State<StatefulWidget> createState() {
    return _StudentsState();
  }
}

class _StudentsState extends State<Students> {
  final List<Student> _myStudents = [
    Student(
        firstName: 'Oleh',
        lastName: 'Petrenko',
        department: Department.finance,
        grade: 5,
        gender: Gender.male),
    Student(
        firstName: 'Olga',
        lastName: 'Kovalenko',
        department: Department.it,
        grade: 3,
        gender: Gender.female),
    Student(
        firstName: 'Serhiy',
        lastName: 'Yarmolenko',
        department: Department.medical,
        grade: 5,
        gender: Gender.male),
    Student(
        firstName: 'Tetiana',
        lastName: 'Shvets',
        department: Department.law,
        grade: 6,
        gender: Gender.female)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        AppBar(title: const Text('List of students')),
        Expanded(child: StudentList(students: _myStudents))
      ]),
    );
  }
}
