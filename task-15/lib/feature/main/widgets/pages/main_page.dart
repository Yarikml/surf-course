import 'package:flutter/material.dart';
import 'package:surf_flutter_courses_template/assets/resources/resources.dart';
import 'package:surf_flutter_courses_template/feature/main/model/photo_entity.dart';
import 'package:surf_flutter_courses_template/feature/main/widgets/photos_grid.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:surf_flutter_courses_template/runner.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  Future<List<PhotoEntity>>? _data;

  Future<void> _loadColors() async {
    _data = mainRepository.getPhotos();
  }

  @override
  void initState() {
    super.initState();
    _loadColors();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(Images.logo),
      ),
      body: FutureBuilder(
        future: _data,
        builder: (
          BuildContext context,
          AsyncSnapshot<List<PhotoEntity>> snapshot,
        ) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return Center(
                child: Text(AppLocalizations.of(context)!.error),
              );
            } else if (snapshot.hasData) {
              return PhotosGrid(photos: snapshot.data!);
            }
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
