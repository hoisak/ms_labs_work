import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ms_lab/data/dummy_data.dart';

import '../models/student.dart';

class StudentsNotifier extends StateNotifier<List<Student>> {
  StudentsNotifier(super.state);

  void addStudent(Student student) {
    state = [...state, student];
  }

  void editStudent(Student student, int index) {
    final newState = [...state];
    newState[index].firstName = student.firstName;
    newState[index].lastName = student.lastName;
    newState[index].department = student.department;
    newState[index].gender = student.gender;
    newState[index].grade = student.grade;

    state = newState;
  }

  void insertStudent(Student student, int index) {
    final newState = [...state];
    newState.insert(index, student);
    state = newState;
  }

  void removeStudent(Student student) {
    state = state.where((m) => m.id != student.id).toList();
  }
}

final studentsProvider =
    StateNotifierProvider<StudentsNotifier, List<Student>>((ref) {
  return StudentsNotifier(students);
});
