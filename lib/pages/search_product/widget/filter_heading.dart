import 'package:flutter/material.dart';

class FilterHeading extends StatelessWidget {
  const FilterHeading({super.key, required this.name});

  final String name;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.centerStart,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(15, 15, 0, 5),
        child: Text(name, style: const TextStyle(
            fontSize: 16, fontWeight: FontWeight.bold
        ),),
      ),
    );
  }
}
