import 'package:flutter/material.dart';

class CProgressIndicator extends StatefulWidget {
  final bool runningTask;
  final int taskTime;

  CProgressIndicator({
    Key? key,
    required this.runningTask,
    required this.taskTime,
  }) : super(key: key);

  @override
  State<CProgressIndicator> createState() => _CProgressIndicatorState();
}

class _CProgressIndicatorState extends State<CProgressIndicator> with TickerProviderStateMixin {
  late AnimationController controller;
  bool isRunning = false;

  @override
  void initState() {
    super.initState();
    int delayBy = widget.taskTime * 15000;
    if (delayBy <= 0) {
      delayBy = 1;
    }
    controller = AnimationController(
      duration: Duration(milliseconds: delayBy),
      vsync: this,
    );

    if (widget.runningTask) {
      isRunning = true;
      controller.repeat();
      Future.delayed(Duration(milliseconds: delayBy), () {
        if (mounted) {
          controller.stop();
          setState(() {
            isRunning = false;
          });
        }
      });
    }
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(
      value: controller.isAnimating ? null : 1.0,
      valueColor: AlwaysStoppedAnimation<Color>(isRunning ? Colors.green : Colors.red),
    );
  }
}
