import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:surf_flutter_courses_template/core/extensions.dart';
import 'package:surf_flutter_courses_template/feature/main/data/datasources/mock_datasource.dart';
import 'package:surf_flutter_courses_template/feature/main/data/repositories/main_repository.dart';
import 'package:surf_flutter_courses_template/feature/main/model/color_entity/color_entity.dart';
import 'package:surf_flutter_courses_template/feature/main/state_manager/buffer_notifier.dart';
import 'package:surf_flutter_courses_template/feature/main/widgets/color_box_item.dart';
import 'package:surf_flutter_courses_template/uikit/text/app_text_scheme.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late final AppLifecycleListener _listener;

  @override
  void dispose() {
    // Do not forget to dispose the listener
    _listener.dispose();

    super.dispose();
  }

  final MainRepository mainRepository =
      MainRepositoryImpl(mockDatasource: MockDatasourceImpl());

  late final Future<List<ColorEntity>> colors;

  void onAddValueToBuffer(String value) async {
    await Clipboard.setData(
      ClipboardData(text: value),
    );
    if (context.mounted) {
      context.read<BufferNotifier>().setBufferText(value);
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
          content: Text('Hex скопирован'),
        ),
      );
    }
  }

  @override
  void initState() {
    colors = mainRepository.getColors();
    super.initState();
    // Initialize the AppLifecycleListener class and pass callbacks
    _listener = AppLifecycleListener(
      onResume: () async {
        final clipboardData = await Clipboard.getData(Clipboard.kTextPlain);
        if (context.mounted) {
          final bufferedValue = context.read<BufferNotifier>().value;
          if (clipboardData != null && clipboardData.text != bufferedValue) {
            context.read<BufferNotifier>().setBufferText(clipboardData.text);
          }
        }
      },
    );
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
                          onAddColorToBuffer: onAddValueToBuffer,
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
