import 'dart:developer';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:surf_flutter_courses_template/assets/text/app_text_scheme.dart';
import 'package:surf_flutter_courses_template/assets/text/app_text_style.dart';

import 'package:surf_flutter_courses_template/feature/main/model/photo_entity.dart';
import 'package:surf_flutter_courses_template/feature/main/widgets/photo_list_appbar.dart';

import '../full_screen_photo_item.dart';

class PhotosListPage extends StatefulWidget {
  const PhotosListPage({
    super.key,
    required this.photos,
    required this.initialIndex,
  });

  final List<PhotoEntity> photos;
  final int initialIndex;

  @override
  State<PhotosListPage> createState() => _PhotosListPageState();
}

class _PhotosListPageState extends State<PhotosListPage> {
  late final PageController _controller;
  late double currentPage;
  final double _scaleFactor = 0.8;
  final double _blurFactor = 20;

  @override
  void initState() {
    super.initState();
    _controller = PageController(
      initialPage: widget.initialIndex,
      viewportFraction: 0.8,
    )..addListener(_listenToPageController);
    currentPage = widget.initialIndex.toDouble();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _listenToPageController() {
    setState(() {
      currentPage = _controller.page!;
    });
  }

  @override
  Widget build(BuildContext context) {
    final heightPageView =
        MediaQuery.sizeOf(context).height - kToolbarHeight - 112;
    return Scaffold(
      appBar: PhotoListAppbar(
        index: currentPage + 1,
        maxIndex: widget.photos.length,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 40, bottom: 72),
          child: PageView.builder(
            physics: const ClampingScrollPhysics(),
            itemCount: widget.photos.length,
            controller: _controller,
            itemBuilder: (context, index) {
              Matrix4 matrix = Matrix4.identity();
              var scale = 0.8;
              var blur = 0.0;

              if (index == currentPage.floor() ||
                  index == currentPage.floor() + 1 ||
                  index == currentPage.floor() - 1) {
                scale = 1 - (currentPage - index).abs() * (1 - _scaleFactor);
              }
              blur = 1 - (currentPage - index).abs() * (1 - _blurFactor);

              var transform = heightPageView * (1 - scale) / 2;
              matrix = Matrix4.diagonal3Values(1, scale, 1)
                ..setTranslationRaw(0, transform, 0);
              return Transform(
                transform: matrix,
                child: FullScreenPhotoItem(
                  blur: blur,
                  photo: widget.photos[index],
                  tag: index == widget.initialIndex
                      ? widget.photos[index].url
                      : null,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
