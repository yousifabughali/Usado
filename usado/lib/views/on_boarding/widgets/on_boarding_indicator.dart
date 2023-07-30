import 'package:flutter/material.dart';

class OnBordingIndicator extends StatelessWidget {
  final double marginEnd;
  final bool selected;

  OnBordingIndicator({this.marginEnd = 0, required this.selected});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 10,
      height: 10,
      margin: EdgeInsetsDirectional.only(end: marginEnd),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: selected ? const Color.fromRGBO(124, 144, 112, 1) : Colors.grey.shade700,
      ),
    );
  }
}
