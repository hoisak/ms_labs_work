import 'package:flutter/material.dart';
import 'package:ms_lab/models/student.dart';
import 'package:ms_lab/widgets/student_list.dart';

import 'new_student.dart';

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

  void _addStudent(Student student) {
    setState(() {
      _myStudents.add(student);
    });
  }

  void _editStudent(Student student) {
    int index = _myStudents.indexWhere((std) => std.id == student.id);
    setState(() {
      _myStudents[index] = student;
    });
  }

  void _openAddStudentOverlay() {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (ctx) => NewStudent(onAdd: _addStudent));
  }

  void _openEditStudentOverlay(Student student) {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (ctx) => NewStudent(onAdd: _editStudent, student: student));
  }

  void _removeStudent(Student student) {
    final studentIndex = _myStudents.indexOf(student);

    setState(() {
      _myStudents.remove(student);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        duration: const Duration(seconds: 3),
        content: const Text("Student was deleted"),
        action: SnackBarAction(
            label: "Undo",
            onPressed: () => {
                  setState(() {
                    _myStudents.insert(studentIndex, student);
                  })
                })));
  }

  @override
  Widget build(BuildContext context) {
    Widget mainContent = const Center(child: Text('No students was found'));

    if (_myStudents.isNotEmpty) {
      mainContent = StudentList(
          students: _myStudents,
          onRemoveStudent: _removeStudent,
          onEditStudent: _openEditStudentOverlay);
    }

    return Scaffold(
      appBar: AppBar(title: const Text('List of students'), actions: [
        IconButton(
            onPressed: _openAddStudentOverlay, icon: const Icon(Icons.add))
      ]),
      body: Column(children: [Expanded(child: mainContent)]),
    );
  }
}
