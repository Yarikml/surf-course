import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:surf_flutter_courses_template/features/register_pet/widgets/pet_type_list.dart';
import 'package:surf_flutter_courses_template/utils/enums/pet_type.dart';
import 'package:surf_flutter_courses_template/utils/extensions/build_context_x.dart';

class PetTypeItem extends StatelessWidget {
  const PetTypeItem({
    super.key,
    required this.isSelected,
    required this.isEnabled,
    required this.onPetTypeChange,
    required this.type,
  });

  final bool isSelected;
  final bool isEnabled;
  final PetType type;
  final PetTypeChangeCallback onPetTypeChange;

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      child: GestureDetector(
        onTap: isEnabled ? () => onPetTypeChange(type) : null,
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: isSelected
                    ? isEnabled
                        ? context.colorScheme.primary
                        : context.colorScheme.disabledColor
                    : context.colorScheme.onScaffoldBackground,
                borderRadius: BorderRadius.circular(16),
              ),
              padding: const EdgeInsets.all(20),
              margin: const EdgeInsets.only(bottom: 8),
              child: SvgPicture.asset(
                type.iconPath,
                color: isSelected
                    ? context.colorScheme.onScaffoldBackground
                    : null,
              ),
            ),
            Text(
              type.name,
              style: context.textScheme.regular12,
            ),
          ],
        ),
      ),
    );
  }
}
