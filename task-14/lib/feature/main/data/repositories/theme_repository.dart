import 'package:surf_flutter_courses_template/feature/main/data/datasources/theme_local_datasource.dart';
import 'package:surf_flutter_courses_template/feature/main/model/color_entity/color_entity.dart';

///Mock repository
abstract interface class IThemeRepository {
}

class ThemeRepository implements IThemeRepository {
  final IThemeLocalDatasource themeLocalDatasource;

  ThemeRepository({
    required this.themeLocalDatasource,
  });

}
