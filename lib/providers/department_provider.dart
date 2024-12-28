import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ms_lab/data/dummy_data.dart';

final departmentsProvider = Provider((ref) {
  return departments;
});