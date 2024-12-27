import 'package:flutter/material.dart';
import 'package:ms_lab/models/student.dart';
import 'package:ms_lab/widgets/student_item.dart';

class StudentList extends StatelessWidget {
  const StudentList({
    super.key,
    required this.students
  });

  final List<Student> students;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(5),
        itemCount: students.length,
        itemBuilder: (context, index) => StudentItem(student: students[index])
    );
  }
}