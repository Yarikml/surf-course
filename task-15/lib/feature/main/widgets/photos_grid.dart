import 'package:flutter/material.dart';

import 'package:surf_flutter_courses_template/feature/main/model/photo_entity.dart';
import 'package:surf_flutter_courses_template/feature/main/widgets/photo_item.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class PhotosGrid extends StatelessWidget {
  const PhotosGrid({
    super.key,
    required this.photos,
  });

  final List<PhotoEntity> photos;

  @override
  Widget build(BuildContext context) {
    return photos.isNotEmpty
        ? GridView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 11),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 1,
              mainAxisSpacing: 5,
              crossAxisSpacing: 3,
              crossAxisCount: 3,
            ),
            itemCount: photos.length,
            itemBuilder: (BuildContext context, int index) => PhotoItem(
              photos: photos,
              index: index,
            ),
          )
        : Center(
            child: Text(AppLocalizations.of(context)!.noItems),
          );
  }
}
