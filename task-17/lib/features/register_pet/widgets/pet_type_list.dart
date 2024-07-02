import 'package:flutter/material.dart';
import 'package:surf_flutter_courses_template/features/register_pet/widgets/pet_type_item.dart';
import 'package:surf_flutter_courses_template/utils/enums/pet_type.dart';

typedef PetTypeChangeCallback = Function(PetType);

class PetTypeList extends StatelessWidget {
  const PetTypeList({
    super.key,
    required this.currentType,
    required this.onPetTypeChange,
    required this.isGroupEnabled,
  });

  final PetType currentType;
  final bool isGroupEnabled;
  final PetTypeChangeCallback onPetTypeChange;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      margin: const EdgeInsets.only(bottom: 30),
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemCount: PetType.values.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          crossAxisSpacing: 18,
          childAspectRatio: 0.7,
        ),
        itemBuilder: (context, index) {
          final isSelected = PetType.values[index] == currentType;
          return PetTypeItem(
            isSelected: isSelected,
            isEnabled: isGroupEnabled,
            onPetTypeChange: onPetTypeChange,
            type: PetType.values[index],
          );
        },
      ),
    );
  }
}
