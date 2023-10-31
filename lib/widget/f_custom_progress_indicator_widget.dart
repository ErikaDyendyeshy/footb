import 'package:flutter/material.dart';
import 'package:football/style/app_colors.dart';

class FCustomProgressIndicator extends StatelessWidget {
  final double value;
  final bool reverse;

  const FCustomProgressIndicator({super.key, required this.value, this.reverse = false,});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 5,
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Align(
        alignment: reverse ? Alignment.centerRight : Alignment.centerLeft,
        child: FractionallySizedBox(
          widthFactor: value,
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
      ),
    );
  }
}
