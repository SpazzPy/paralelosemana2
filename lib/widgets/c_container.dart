import 'package:flutter/material.dart';
import 'package:paralelosemana2/widgets/c_text.dart';

class BasicContainer extends StatelessWidget {
  final Widget child;
  final Color containerColor;
  final Color borderColor;
  final double borderWidth;
  final String title;

  BasicContainer({
    Key? key,
    this.child = const SizedBox(),
    this.containerColor = Colors.white,
    this.borderColor = Colors.grey,
    this.borderWidth = 2.0,
    this.title = "Default Title",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: containerColor,
        border: Border.all(
          color: borderColor,
          width: borderWidth,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(8.0, 3.0, 8.0, 3.0),
            child: boldText(
              message: title,
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.fromLTRB(8.0, 3.0, 8.0, 3.0),
              child: child,
            ),
          ),
        ],
      ),
    );
  }
}
