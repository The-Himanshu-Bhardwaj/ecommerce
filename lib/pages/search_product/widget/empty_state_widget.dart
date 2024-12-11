import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../../../util/strings.dart';

class EmptyStateWidget extends StatelessWidget {
  const EmptyStateWidget({super.key, required this.message});

  final String message;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Lottie.asset(NO_DATA_ANIM, height: 150, repeat: false, frameRate: const FrameRate(60)),
          Text(message)
        ],
      ),
    );
  }
}
