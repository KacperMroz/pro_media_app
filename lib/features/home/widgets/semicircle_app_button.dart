import 'package:flutter/material.dart';

class SemicircleAppButton extends StatelessWidget {
  const SemicircleAppButton({
    super.key,
    required this.onDownArrowPressed,
  });

  final VoidCallback onDownArrowPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 25.0),
      child: GestureDetector(
        onTap: onDownArrowPressed,
        child: Container(
          height: 30,
          width: 60,
          decoration: const BoxDecoration(
            color: Colors.greenAccent,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(100),
              bottomRight: Radius.circular(100),
            ),
          ),
          child: const Center(
            child: Icon(
              Icons.keyboard_arrow_down,
              size: 30,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
