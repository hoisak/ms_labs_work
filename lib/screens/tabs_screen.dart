import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ms_lab/models/department.dart';
import 'package:ms_lab/providers/department_provider.dart';
import 'package:ms_lab/providers/student_provider.dart';
import 'package:ms_lab/widgets/students.dart';

import '../data/dummy_data.dart';
import '../models/student.dart';
import '../widgets/departmentItem.dart';

class TabsScreen extends ConsumerStatefulWidget {
  const TabsScreen({super.key});

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends ConsumerState<TabsScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final dummyDepartments = ref.watch(departmentsProvider);
    final dummyStudents = ref.watch(studentsProvider);

    void undoStudentDeletion(Student student) {
      final studentIndex = dummyStudents.indexOf(student);

      ref.read(studentsProvider.notifier).removeStudent(student);

      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        duration: const Duration(seconds: 3),
        content: const Text("Student was deleted"),
        action: SnackBarAction(
          label: "Undo",
          onPressed: () {
            ref.read(studentsProvider.notifier).insertStudent(student, studentIndex);
          },
        ),
      ));
    }

    void selectDepartment(BuildContext context, Department department) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (ctx) => Students(department: department, onUndo: undoStudentDeletion)));
    }

    List<Widget> content = [
      GridView(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20),
        children: [
          for (final department in dummyDepartments)
            DepartmentItem(
              department: department,
              onSelectDepartment: () {
                selectDepartment(context, department);
              },
            )
        ],
      ),
      Students(onUndo: undoStudentDeletion)
    ];


    return Scaffold(
        appBar: _selectedIndex == 0 ? AppBar(
          title: const Text("Departments"),
        ) : null,
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: _selectedIndex,
            onTap: _onItemTapped,
            backgroundColor: Theme.of(context).primaryColor,
            selectedItemColor: Theme.of(context).cardColor,
            elevation: 0,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined),
                label: 'Departments',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.people_alt),
                label: 'Students',
              ),
            ]),
        body: content[_selectedIndex]);
  }
}