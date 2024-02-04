import 'dart:math';

Future<void> radixSort(List<int> list) async {
  int maxNumber = list.reduce(max);
  int digitPosition = 1;
  while ((maxNumber / digitPosition) > 0) {
    await countingSort(list, digitPosition);
    digitPosition *= 10;
  }
}

Future<void> countingSort(List<int> list, int digitPosition) async {
  int n = list.length;
  List<int> output = List<int>.filled(n, 0);
  List<int> count = List<int>.filled(10, 0);

  for (int i = 0; i < n; i++) {
    count[(list[i] / digitPosition).floor() % 10]++;
  }

  for (int i = 1; i < 10; i++) {
    count[i] += count[i - 1];
  }

  for (int i = n - 1; i >= 0; i--) {
    output[count[(list[i] / digitPosition).floor() % 10] - 1] = list[i];
    count[(list[i] / digitPosition).floor() % 10]--;
  }

  for (int i = 0; i < n; i++) {
    list[i] = output[i];
  }
}
