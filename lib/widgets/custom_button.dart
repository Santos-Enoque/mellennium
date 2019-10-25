import 'package:flutter/material.dart';
import 'package:millenium/services/style.dart';

class CustomText extends StatelessWidget {
  final String msg;
  final double size;
  final Color color;
  final FontWeight weight;

  CustomText({this.msg, this.size, this.color, this.weight});

  @override
  Widget build(BuildContext context) {
    return Text(msg, style: TextStyle(fontSize: size ?? 16, color: color ?? black, fontWeight: weight ?? FontWeight.normal),);
  }
}
