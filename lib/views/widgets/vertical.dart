import 'package:flutter/material.dart';

class Vertical extends StatelessWidget {
  const Vertical(this.size,{Key? key}) : super(key: key);

  final double size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: size,);
  }
}
