import 'dart:math';

Future<void> mergeSort(List<int> list) async {
  int n = list.length;
  for (int size = 1; size < n; size *= 2) {
    for (int leftStart = 0; leftStart < n - 1; leftStart += 2 * size) {
      int mid = leftStart + size - 1;
      int rightEnd = min(leftStart + 2 * size - 1, n - 1);
      _merge(list, leftStart, mid, rightEnd);
    }
  }
}

void _merge(List<int> list, int leftStart, int mid, int rightEnd) {
  int leftSize = mid - leftStart + 1;
  int rightSize = rightEnd - mid;
  List<int> left = list.sublist(leftStart, leftStart + leftSize);
  List<int> right = list.sublist(mid + 1, mid + 1 + rightSize);
  int i = 0, j = 0, k = leftStart;
  while (i < leftSize && j < rightSize) {
    if (left[i] <= right[j]) {
      list[k++] = left[i++];
    } else {
      list[k++] = right[j++];
    }
  }
  while (i < leftSize) {
    list[k++] = left[i++];
  }
  while (j < rightSize) {
    list[k++] = right[j++];
  }
}
