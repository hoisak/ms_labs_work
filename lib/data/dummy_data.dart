import 'package:flutter/material.dart';

import '../models/department.dart';
import '../models/student.dart';

const departments = [
  Department(id: "1", name: "It", icon: Icons.computer, color: Colors.indigo),
  Department(id: "2", name: "Finance", icon: Icons.monetization_on_outlined, color: Colors.green),
  Department(id: "3", name: "Law", icon: Icons.person, color: Colors.blue),
  Department(id: "4", name: "Medical", icon: Icons.medication, color: Colors.orange),
];

var students = [
  Student(
      firstName: 'Oleh',
      lastName: 'Petrenko',
      department: departments[0],
      grade: 5,
      gender: Gender.male),
  Student(
      firstName: 'Olga',
      lastName: 'Kovalenko',
      department: departments[1],
      grade: 3,
      gender: Gender.female),
  Student(
      firstName: 'Serhiy',
      lastName: 'Yarmolenko',
      department: departments[2],
      grade: 5,
      gender: Gender.male),
  Student(
      firstName: 'Tetiana',
      lastName: 'Shvets',
      department: departments[3],
      grade: 6,
      gender: Gender.female)
];