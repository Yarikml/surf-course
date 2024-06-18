import 'package:flutter/material.dart';
import 'package:surf_flutter_courses_template/feature/main/widgets/pages/photos_list_page.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:surf_flutter_courses_template/feature/main/model/photo_entity.dart';

class PhotoItem extends StatelessWidget {
  const PhotoItem({
    super.key,
    required this.photos,
    required this.index,
  });

  final List<PhotoEntity> photos;

  final int index;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => PhotosListPage(
            photos: photos,
            initialIndex: index,
          ),
        ),
      ),
      child: AspectRatio(
        aspectRatio: 1,
        child: Hero(
          tag: photos[index].url,
          child: Image.network(
            photos[index].url,
            fit: BoxFit.cover,
            loadingBuilder: (_, child, loadingProgress) {
              if (loadingProgress == null) return child;
              return Center(
                child: CircularProgressIndicator(
                  value: loadingProgress.expectedTotalBytes != null
                      ? loadingProgress.cumulativeBytesLoaded /
                          loadingProgress.expectedTotalBytes!
                      : null,
                ),
              );
            },
            errorBuilder: (_, error, stackTracTrace) => Center(
              child: Text(AppLocalizations.of(context)!.error),
            ),
          ),
        ),
      ),
    );
  }
}
