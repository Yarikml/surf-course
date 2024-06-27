import 'package:surf_flutter_courses_template/assets/resources/svg_icons.dart';

enum PetType {
  dog(
    name: 'Собака',
    iconPath: SvgIcons.dog,
  ),
  cat(
    name: 'Кошка',
    iconPath: SvgIcons.cat,
  ),
  parrot(
    name: 'Попугай',
    iconPath: SvgIcons.parrot,
  ),
  hamster(
    name: 'Хомяк',
    iconPath: SvgIcons.hamster,
  );

  const PetType({
    required this.name,
    required this.iconPath,
  });

  final String name;
  final String iconPath;
}
