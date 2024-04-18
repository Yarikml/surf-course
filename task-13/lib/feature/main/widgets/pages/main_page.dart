import 'package:flutter/material.dart';
import 'package:surf_flutter_courses_template/feature/main/model/color_entity/color_entity.dart';
import 'package:surf_flutter_courses_template/feature/main/widgets/color_box_grid.dart';
import 'package:surf_flutter_courses_template/feature/main/widgets/error_placeholder.dart';
import 'package:surf_flutter_courses_template/feature/main/widgets/loading_placeholder.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:surf_flutter_courses_template/assets/text/app_text_scheme.dart';
import 'package:surf_flutter_courses_template/runner.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  Future<List<ColorEntity>>? _data;

  Future<void> _loadColors() async {
    _data = mainRepository.getColors();
  }

  @override
  void initState() {
    super.initState();
    _loadColors();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              pinned: true,
              expandedHeight: 110,
              collapsedHeight: 100,
              flexibleSpace: Container(
                padding: const EdgeInsets.all(16),
                alignment: Alignment.bottomLeft,
                child: Text(
                  AppLocalizations.of(context)!.mainPageAppBar,
                  style: AppTextScheme.of(context).bold30,
                  maxLines: 2,
                ),
              ),
            ),
            FutureBuilder(
              future: _data,
              builder: (
                BuildContext context,
                AsyncSnapshot<List<ColorEntity>> snapshot,
              ) {
                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasError) {
                    return const ErrorPlaceholder();
                  } else if (snapshot.hasData) {
                    return ColorBoxGrid(colors: snapshot.data!);
                  }
                }
                return const LoadingPlaceholder();
              },
            ),
          ],
        ),
      ),
    );
  }
}
