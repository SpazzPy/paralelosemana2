import 'dart:async';
import 'dart:collection';

Future<void> quickSort(List<int> list) async {
  Queue<int> stack = Queue();
  stack.addLast(0);
  stack.addLast(list.length - 1);

  while (stack.isNotEmpty) {
    int high = stack.removeLast();
    int low = stack.removeLast();

    int pivotIndex = await _partition(list, low, high);

    if (pivotIndex - 1 > low) {
      stack.addLast(low);
      stack.addLast(pivotIndex - 1);
    }

    if (pivotIndex + 1 < high) {
      stack.addLast(pivotIndex + 1);
      stack.addLast(high);
    }
  }
}

Future<int> _partition(List<int> list, int low, int high) async {
  int pivot = list[high];
  int i = low - 1;
  for (int j = low; j < high; j++) {
    if (list[j] < pivot) {
      i++;
      await _swap(list, i, j);
    }
  }
  await _swap(list, i + 1, high);
  return i + 1;
}

Future<void> _swap(List<int> list, int i, int j) async {
  int temp = list[i];
  list[i] = list[j];
  list[j] = temp;
}
