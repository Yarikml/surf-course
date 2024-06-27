import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:surf_flutter_courses_template/assets/colors/color_scheme.dart';
import 'package:surf_flutter_courses_template/utils/enums/pet_type.dart';

typedef PetTypeChangeCallback = Function(PetType);

class PetTypeList extends StatelessWidget {
  const PetTypeList({
    super.key,
    required this.currentType,
    required this.onPetTypeChange,
  });

  final PetType currentType;
  final PetTypeChangeCallback onPetTypeChange;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 76,
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemCount: PetType.values.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          crossAxisSpacing: 18,
          childAspectRatio: 1,
        ),
        itemBuilder: (context, index) {
          final isSelected = PetType.values[index] == currentType;
          return AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            child: GestureDetector(
              onTap: () => onPetTypeChange(PetType.values[index]),
              child: Container(
                decoration: BoxDecoration(
                  color: isSelected
                      ? AppColorScheme.of(context).primary
                      : AppColorScheme.of(context).onScaffoldBackground,
                  borderRadius: BorderRadius.circular(16),
                ),
                padding: const EdgeInsets.all(20),
                child: SvgPicture.asset(
                  PetType.values[index].iconPath,
                  color: isSelected ? Colors.white : null,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
