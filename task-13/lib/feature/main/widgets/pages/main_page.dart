import 'package:flutter/material.dart';
import 'package:surf_flutter_courses_template/core/extensions.dart';
import 'package:surf_flutter_courses_template/feature/main/data/datasources/mock_datasource.dart';
import 'package:surf_flutter_courses_template/feature/main/data/repositories/main_repository.dart';
import 'package:surf_flutter_courses_template/feature/main/model/color_entity/color_entity.dart';
import 'package:surf_flutter_courses_template/feature/main/widgets/color_box_item.dart';
import 'package:surf_flutter_courses_template/uikit/text/app_text_scheme.dart';

class MainPage extends StatefulWidget {
  MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final MainRepository mainRepository =
      MainRepositoryImpl(mockDatasource: MockDatasourceImpl());

  late final Future<List<ColorEntity>> colors;

  @override
  void initState() {
    colors = mainRepository.getColors();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: CustomScrollView(
            slivers: [
              SliverPadding(
                padding: EdgeInsets.only(bottom: 42),
                sliver: SliverToBoxAdapter(
                  child: Text(
                    'Эксклюзивная палитра «Colored Box»',
                    style: AppTextScheme.of(context).bold30,
                  ),
                ),
              ),
              FutureBuilder(
                future: colors,
                builder: (BuildContext context,
                        AsyncSnapshot<List<ColorEntity>> snapshot) =>
                    snapshot.data != null
                        ? SliverGrid.builder(
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              mainAxisExtent: 140,
                              crossAxisCount: 3,
                              mainAxisSpacing: 40,
                              crossAxisSpacing: 22,
                            ),
                            itemBuilder: (context, index) => ColorBoxItem(
                              color: snapshot.data!.filledColors[index],
                            ),
                            itemCount: snapshot.data!.filledColors.length,
                          )
                        : SliverToBoxAdapter(
                            child: Container(),
                          ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
