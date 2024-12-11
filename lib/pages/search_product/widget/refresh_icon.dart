import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class RefreshIcon extends StatelessWidget {
  const RefreshIcon({super.key, required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: onPressed,
      child: const Padding(
        padding: EdgeInsets.only(right: 20),
        child: FaIcon(FontAwesomeIcons.rotateLeft),
      ),
    );
  }
}
