import 'dart:math';
import 'package:paralelosemana2/common_vars.dart';

List<int> generateArray(int n, int min, int max) {
  Random rng = Random();
  List<int> list = [];
  for (int i = 0; i < n; i++) {
    list.add(min + rng.nextInt(max + 1 - min));
  }
  return list;
}

bool canGenerateArray(int? n, int? min, int? max) {
  if (n == null || min == null || max == null) {
    return false;
  }

  if (n.isNaN || min.isNaN || max.isNaN) {
    return false;
  }

  if (n >= 1 && n <= maxNumberArray && min <= max) {
    return true;
  } else {
    return false;
  }
}
