import 'package:flutter/material.dart';

class CardCustomized extends StatefulWidget {
  final double height;
  final double width;
  final Widget child;

  const CardCustomized({super.key, this.height = 180.0, this.width = 180.0, required this.child});

  @override
  State<CardCustomized> createState() => _CardCustomizedState();
}

class _CardCustomizedState extends State<CardCustomized> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height,
      width: widget.width,
      child: Card(
        color: Colors.white,
        child: widget.child,
      ),
    );
  }
}
