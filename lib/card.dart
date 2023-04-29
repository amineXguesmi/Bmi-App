import 'package:flutter/material.dart';

class Re_Card extends StatelessWidget {
  final Color color;
  final Widget cardChild;
  Re_Card(@required this.color, this.cardChild) {}
  @override
  Widget build(BuildContext context) {
    return Container(
      child: cardChild,
      margin: EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(12)),
        color: this.color,
      ),
    );
  }
}
