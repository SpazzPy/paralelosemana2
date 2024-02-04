Future<void> heapSort(List<int> list) async {
  int n = list.length;
  for (int i = n ~/ 2; i >= 0; i--) {
    await heapify(list, n, i);
  }
  for (int i = n - 1; i >= 0; i--) {
    int temp = list[0];
    list[0] = list[i];
    list[i] = temp;
    await heapify(list, i, 0);
  }
}

Future<void> heapify(List<int> list, int n, int i) async {
  while (true) {
    int largest = i;
    int left = 2 * i + 1;
    int right = 2 * i + 2;
    if (left < n && list[left] > list[largest]) {
      largest = left;
    }
    if (right < n && list[right] > list[largest]) {
      largest = right;
    }
    if (largest != i) {
      int swap = list[i];
      list[i] = list[largest];
      list[largest] = swap;
      i = largest;
    } else {
      break;
    }
  }
}
