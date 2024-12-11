import 'package:ecommerce/util/app_colors.dart';
import 'package:flutter/material.dart';

class ApplyFilterButton extends StatelessWidget {
  const ApplyFilterButton({super.key, required this.onTap});
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.maxFinite,
        margin: const EdgeInsets.fromLTRB(20, 15, 20, 10),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: const Color(AppColors.GREEN)
        ),
        child: const Text('Apply Filters', textAlign: TextAlign.center, style: TextStyle(color: Colors.white),),
      ),
    );
  }
}
