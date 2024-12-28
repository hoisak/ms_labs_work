import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ms_lab/widgets/student_list.dart';

import '../models/department.dart';
import '../models/student.dart';
import '../providers/student_provider.dart';
import 'new_student.dart';

class Students extends ConsumerWidget {
  const Students({super.key, this.department, required this.onUndo});

  final Department? department;
  final void Function(Student student) onUndo;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var myStudents = ref.watch(studentsProvider);
    final isLoading =
        ref.watch(studentsProvider.notifier.select((state) => state.isLoading));

    if (department != null) {
      myStudents = myStudents
          .where((std) => std.department.id == department?.id)
          .toList();
    }

    void openAddStudentOverlay() {
      showModalBottomSheet(
          isScrollControlled: true,
          context: context,
          builder: (ctx) => const NewStudent());
    }

    void openEditStudentOverlay(Student student) {
      showModalBottomSheet(
          isScrollControlled: true,
          context: context,
          builder: (ctx) => NewStudent(
                student: student,
              ));
    }

    Widget mainContent = const Center(child: Text('No students found'));

    if (myStudents.isNotEmpty) {
      mainContent = StudentList(
          students: myStudents,
          onEditStudent: openEditStudentOverlay,
          onUndo: onUndo);
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('List of Students'),
        actions: [
          IconButton(
            onPressed: openAddStudentOverlay,
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
              child: isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : mainContent),
        ],
      ),
    );
  }
}
