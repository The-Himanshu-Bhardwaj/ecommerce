import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import '../../../util/app_colors.dart';
import '../provider/products_provider.dart';

class FilterIcon extends StatelessWidget {
  const FilterIcon({super.key, required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Selector<ProductsProvider, bool>(
      selector: (_, provider) => provider.filterApplied,
      builder: (_, filterApplied, __) {
        return Align(
            alignment: AlignmentDirectional.centerStart,
            child: Row(
              children: [
                GestureDetector(
                  onTap: onPressed,
                  child: Container(
                      margin: const EdgeInsets.all(10),
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: filterApplied ? const Color(AppColors.DARK_BLUE) : const Color(AppColors.LIGHT_GREY)
                      ),
                      child: FaIcon(FontAwesomeIcons.sliders, size: 20, color: filterApplied ? Colors.white : Colors.black87,)
                  ),
                ),
                const SizedBox(width: 10,),
                const Text('Search Results', style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20
                ),),
              ],
            )
        )
        ;
      },

    );
  }
}
