import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:paralelosemana2/modules/sortingTask.dart';
import 'package:paralelosemana2/sorting_algorithms/bubbleSort.dart';
import 'package:paralelosemana2/sorting_algorithms/bucketSort.dart';
import 'package:paralelosemana2/sorting_algorithms/heapSort.dart';
import 'package:paralelosemana2/sorting_algorithms/insertionSort.dart';
import 'package:paralelosemana2/sorting_algorithms/quickSort.dart';
import 'package:paralelosemana2/sorting_algorithms/radixSort.dart';
import 'package:paralelosemana2/sorting_algorithms/selectionSort.dart';
import 'package:paralelosemana2/sorting_algorithms/shellSort.dart';
import 'package:paralelosemana2/widgets/c_progress_circular.dart';

class SortingLogic extends StatefulWidget {
  final List<int> sortArray;
  bool isSorting;

  SortingLogic({
    Key? key,
    required this.sortArray,
    required this.isSorting,
  }) : super(key: key);

  @override
  SortingLogicState createState() => SortingLogicState();
}

class SortingLogicState extends State<SortingLogic> {
  List<SortingTask> tasks = [];
  List<int> tasksTime = [];

  @override
  void initState() {
    super.initState();
    updateTasks();
    tasksTime = List.filled(tasks.length, 0);
  }

  @override
  void didUpdateWidget(SortingLogic oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.sortArray != oldWidget.sortArray) {
      updateTasks();
    }
  }

  void updateTasks() {
    tasks = [
      SortingTask(
        name: "Bubble Sort (burbuja)",
        sortAlgorithm: (list) async {
          bubbleSort(list);
        },
        list: widget.sortArray,
      ),
      SortingTask(
        name: "Bucket Sort (cubeta)",
        sortAlgorithm: (list) async {
          bucketSort(list);
        },
        list: widget.sortArray,
      ),
      SortingTask(
        name: "Heap Sort (montículo)",
        sortAlgorithm: (list) async {
          heapSort(list);
        },
        list: widget.sortArray,
      ),
      // SortingTask(
      //   name: "Insertion Sort (inserción)",
      //   sortAlgorithm: (list) async {
      //     insertionSort(list);
      //   },
      //   list: widget.sortArray,
      // ),
      SortingTask(
        name: "Merge Sort (mezcla)",
        sortAlgorithm: (list) async {
          mergeSort(list);
        },
        list: widget.sortArray,
      ),
      SortingTask(
        name: "Quick Sort",
        sortAlgorithm: (list) async {
          quickSort(list);
        },
        list: widget.sortArray,
      ),
      SortingTask(
        name: "Radix Sort",
        sortAlgorithm: (list) async {
          radixSort(list);
        },
        list: widget.sortArray,
      ),
      // SortingTask(
      //   name: "Selection Sort (selección)",
      //   sortAlgorithm: (list) async {
      //     selectionSort(list);
      //   },
      //   list: widget.sortArray,
      // ),
      SortingTask(
        name: "Shell Sort",
        sortAlgorithm: (list) async {
          shellSort(list);
        },
        list: widget.sortArray,
      ),
    ];

    tasksTime = List.filled(tasks.length, 0);
  }

  void startTasks() {
    widget.isSorting = true;

    Future.wait(tasks.map((task) async {
      DateTime startTime = DateTime.now();
      print("Starting task: ${task.name}");
      await compute(task.sortAlgorithm, task.list);

      DateTime endTime = DateTime.now();
      Duration duration = endTime.difference(startTime);
      tasksTime[tasks.indexOf(task)] = duration.inMicroseconds;
    })).then((_) {
      print("All tasks have finished.");
      widget.isSorting = false;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: tasks.length,
      itemBuilder: (context, index) {
        final task = tasks[index];
        return ListTile(
          title: Row(
            children: [
              SizedBox(
                width: 250,
                child: Text(task.name),
              ),
              // Padding(
              //   padding: const EdgeInsets.only(left: 8.0),
              //   child: CProgressIndicator(
              //     runningTask: task.isRunning,
              //     // isCompleted: task.isCompleted,
              //     taskTime: tasksTime[index],
              //   ),
              // ),
              // const Expanded(
              //   flex: 9,
              //   child: SizedBox(),
              // ),
              Text(
                // task.isRunning ? "Corriendo" : "${tasksTime[index] / 1000} ms",
                "${tasksTime[index] / 1000000} ms",
              ),
            ],
          ),
        );
      },
    );
  }
}
