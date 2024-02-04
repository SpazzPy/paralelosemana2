import 'dart:async';

Future<void> bubbleSort(List<int> list) async {
  int n = list.length;
  while (n != 0) {
    int newN = 0;
    for (int i = 1; i < n; i++) {
      if (list[i - 1] > list[i]) {
        await _swap(list, i - 1, i);
        newN = i;
      }
    }
    n = newN;
  }
}

Future<void> _swap(List<int> list, int i, int j) async {
  int temp = list[i];
  list[i] = list[j];
  list[j] = temp;
}
