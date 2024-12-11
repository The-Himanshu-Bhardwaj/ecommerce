import 'package:flutter/material.dart';
import '../../../util/app_colors.dart';
import '../../../util/strings.dart';

class SearchFiled extends StatelessWidget {
  const SearchFiled({super.key, required this.hint, required this.icon, required this.controller, required this.onSubmitted});

  final String hint;
  final IconData icon;
  final TextEditingController controller;
  final ValueChanged onSubmitted;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(10, 5, 10, 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: const Color(AppColors.LIGHT_GREY),
      ),
      child: TextField(
          textInputAction: TextInputAction.next,
          maxLines: 1,
          maxLength: 30,
          controller: controller,
          style: const TextStyle(fontFamily: SANS_BOLD, fontSize: 15, color: Color(AppColors.RICH_BLACK)),
          onSubmitted: onSubmitted,
          decoration: InputDecoration(
              contentPadding: const EdgeInsets.all(14),
              errorText: null,
              hintText: hint,
              hintStyle: const TextStyle(color: Colors.black38, fontSize: 14),
              counterText: '',
              prefixIcon: Icon(
                icon,
                size: 18,
                color: Colors.black54,
              ),
              suffixIcon: GestureDetector(
                onTap: () {
                  controller.text = '';
                },
                  child: const Icon(Icons.close, color: Colors.black38
                    ,)
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
