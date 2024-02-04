class SortingTask {
  final String name;
  final Future<void> Function(List<int>) sortAlgorithm;
  final List<int> list;

  SortingTask({
    required this.name,
    required this.sortAlgorithm,
    required this.list,
  });
}
