Future<void> shellSort(List<int> list) async {
  for (int gap = list.length ~/ 2; gap > 0; gap ~/= 2) {
    for (int i = gap; i < list.length; i += 1) {
      int temp = list[i];
      int j;
      for (j = i; j >= gap && list[j - gap] > temp; j -= gap) {
        list[j] = list[j - gap];
      }
      list[j] = temp;
    }
  }
}
