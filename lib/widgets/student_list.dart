import 'package:flutter/material.dart';
import 'package:ms_lab/models/student.dart';
import 'package:ms_lab/widgets/student_item.dart';

class StudentList extends StatelessWidget {
  const StudentList({super.key, required this.students,
    required this.onUndo,
    required this.onEditStudent
  });

  final List<Student> students;
  final void Function(Student student) onUndo;
  final void Function(Student student) onEditStudent;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: students.length,
        itemBuilder: (context, index) => Dismissible(
            key: ValueKey(students[index]),
            background: Container(color: Colors.red[900]
            ),
            onDismissed: (direction) => {
              onUndo(students[index])
            },
            child: InkWell(
                key: ValueKey(students[index]),
                child: StudentItem(student: students[index]),
                onTap: () { onEditStudent(students[index]); }
            )
        )
    );
  }
}
