Future<void> bucketSort(List<int> list) async {
  int n = list.length;
  List<List<int>> buckets = List.generate(n, (_) => []);

  int maxVal = list.reduce((curr, next) => curr > next ? curr : next);
  maxVal++;

  for (int i = 0; i < n; i++) {
    int bucketIndex = (list[i] * n) ~/ maxVal;
    buckets[bucketIndex].add(list[i]);
  }

  for (int i = 0; i < n; i++) {
    buckets[i].sort();
  }

  int index = 0;
  for (int i = 0; i < n; i++) {
    for (int value in buckets[i]) {
      list[index++] = value;
    }
  }
}
