import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/department.dart';
import '../providers/student_provider.dart';

class DepartmentItem extends ConsumerWidget {
  const DepartmentItem(
      {super.key, required this.department, required this.onSelectDepartment});

  final Department department;
  final void Function() onSelectDepartment;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dummyStudents = ref
        .watch(studentsProvider)
        .where((std) => std.department.id == department.id)
        .toList();

    return InkWell(
      onTap: onSelectDepartment,
      splashColor: Theme.of(context).primaryColor,
      child: Container(
          padding: const EdgeInsets.all(16),

          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                department.color.withOpacity(0.8),
                department.color.withOpacity(0.6),
                department.color.withOpacity(0.3),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: const BorderRadius.all(Radius.circular(10)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(department.name,
                      style: Theme.of(context).textTheme.titleLarge!),
                  Icon(department.icon)
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Text("Enrolled Students: ${dummyStudents.length}"),
            ],
          )),
    );
  }
}
