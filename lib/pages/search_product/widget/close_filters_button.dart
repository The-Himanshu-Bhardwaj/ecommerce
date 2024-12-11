import 'package:flutter/material.dart';

import '../../../util/app_colors.dart';

class CloseFiltersButton extends StatelessWidget {
  const CloseFiltersButton({super.key, required this.onTap});
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          margin: const EdgeInsets.fromLTRB(10, 5, 20, 10),
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: const Color(AppColors.MEDIUM_GREY)
          ),
          child: const Text('Close', textAlign: TextAlign.center,),
        ),
      ),
    );
  }
}
