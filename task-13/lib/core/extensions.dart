import 'package:surf_flutter_courses_template/feature/main/model/color_entity/color_entity.dart';

extension ColorFilter on List<ColorEntity> {
  List<ColorEntity> get filledColors =>
      where((element) => element.value != null).toList();
}
