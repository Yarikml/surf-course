import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:surf_flutter_courses_template/feature/main/model/photo_entity.dart';

class FullScreenPhotoItem extends StatelessWidget {
  const FullScreenPhotoItem({
    super.key,
    required this.blur,
    required this.tag,
    required this.photo,
  });

  final double blur;
  final String? tag;
  final PhotoEntity photo;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: AspectRatio(
        aspectRatio: 1 / 2,
        child: tag != null
            ? Hero(
                tag: tag!,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: ImageFiltered(
                    imageFilter: ImageFilter.blur(
                      sigmaX: blur,
                      sigmaY: blur,
                    ),
                    child: Image.network(
                      photo.url,
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
                      errorBuilder: (_, error, stackTracTrace) => const Center(
                        child: Text('Ошибка'),
                      ),
                    ),
                  ),
                ),
              )
            : ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: ImageFiltered(
                  imageFilter: ImageFilter.blur(
                    sigmaX: blur,
                    sigmaY: blur,
                  ),
                  child: Image.network(
                    photo.url,
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
                    errorBuilder: (_, error, stackTracTrace) => const Center(
                      child: Text('Ошибка'),
                    ),
                  ),
                ),
              ),
      ),
    );
  }
}
