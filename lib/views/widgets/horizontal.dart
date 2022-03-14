import 'package:flutter/material.dart';

class Horizontal extends StatelessWidget {
  const Horizontal(this.size, {Key? key}) : super(key: key);

  final double size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
    );
  }
}
