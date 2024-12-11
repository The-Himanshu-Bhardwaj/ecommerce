import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../util/app_colors.dart';
import '../../../util/strings.dart';

class FilterFields extends StatelessWidget {
  const FilterFields({super.key, required this.hint, required this.icon, required this.controller});

  final String hint;
  final IconData icon;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(10, 5, 10, 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: const Color(AppColors.MEDIUM_GREY),
      ),
      child: TextField(
          inputFormatters: <TextInputFormatter>[
            FilteringTextInputFormatter.allow(RegExp(r"[0-9]")),
          ],
          textInputAction: TextInputAction.done,
          maxLines: 1,
          maxLength: 100,
          controller: controller,
          style: const TextStyle(fontFamily: SANS_BOLD, fontSize: 15, color: Color(AppColors.RICH_BLACK)),
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
              contentPadding: const EdgeInsets.all(14),
              errorText: null,
              hintText: hint,
              hintStyle: const TextStyle(color: Colors.black38, fontSize: 14),
              counterText: '',
              prefixIcon: Icon(
                icon,
                size: 18,
                color: Colors.black38,
              ),
              focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide.none
              ),
              enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide.none
              )
          )),
    );
  }
}
