import 'package:flutter/material.dart';

import 'package:surf_flutter_courses_template/feature/main/model/photo_entity.dart';

class PhotosListPage extends StatelessWidget {
  const PhotosListPage({
    super.key,
    required this.photos,
    required this.initialIndex,
  });

  final List<PhotoEntity> photos;
  final int initialIndex;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: photos[initialIndex].url,
      child: Image.network(photos[initialIndex].url),
    );
  }
}
