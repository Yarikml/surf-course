import 'app_localizations.dart';

/// The translations for Russian (`ru`).
class AppLocalizationsRu extends AppLocalizations {
  AppLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get mainPageAppBar => 'Эксклюзивная палитра «Colored Box»';

  @override
  String get hex => 'Hex';

  @override
  String get red => 'Red';

  @override
  String get green => 'Green';

  @override
  String get blue => 'Blue';

  @override
  String get snackBarTextHexCopied => 'Hex скопирован';
}
