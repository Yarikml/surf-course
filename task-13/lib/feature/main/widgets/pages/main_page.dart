import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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

  ColorEntity? bufferedColor;

  void onAddColorToBuffer(ColorEntity color) async {
    await Clipboard.setData(ClipboardData(text: color.value!));
    if (context.mounted) {
      setState(() {
        bufferedColor = color;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          width: 173,
          padding: EdgeInsets.all(24),
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(16),
            ),
          ),
          content: Text('Hex  скопирован'),
        ),
      );
    }
  }

  @override
  void initState() {
    colors = mainRepository.getColors();
    super.initState();
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
                  'Эксклюзивная палитра «Colored Box»',
                  style: AppTextScheme.of(context).bold30,
                  maxLines: 2,
                ),
              ),
            ),
            FutureBuilder(
              future: colors,
              builder: (BuildContext context,
                      AsyncSnapshot<List<ColorEntity>> snapshot) =>
                  SliverPadding(
                padding: const EdgeInsets.all(16),
                sliver: snapshot.data != null
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
                          onAddColorToBuffer: onAddColorToBuffer,
                          bufferedColor: bufferedColor,
                        ),
                        itemCount: snapshot.data!.filledColors.length,
                      )
                    : SliverToBoxAdapter(
                        child: Container(),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
