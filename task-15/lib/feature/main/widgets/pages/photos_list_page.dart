import 'dart:developer';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:surf_flutter_courses_template/assets/text/app_text_scheme.dart';
import 'package:surf_flutter_courses_template/assets/text/app_text_style.dart';

import 'package:surf_flutter_courses_template/feature/main/model/photo_entity.dart';

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
  final double _fadeFactor = 20;

  @override
  void initState() {
    super.initState();

    _controller = PageController(
      initialPage: widget.initialIndex,
      viewportFraction: 0.8,
    )..addListener(() {
        setState(() {
          currentPage = _controller.page!;
        });
      });

    currentPage = widget.initialIndex.toDouble();
  }

  @override
  Widget build(BuildContext context) {
    final heightPageView =
        MediaQuery.sizeOf(context).height - kToolbarHeight - 112;
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: RichText(
              text: TextSpan(
                text: (currentPage + 1).toStringAsFixed(0),
                style: AppTextScheme.of(context).bold18Accent,
                children: [
                  TextSpan(
                    text: '/${widget.photos.length}',
                    style: AppTextScheme.of(context).bold18,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 40, bottom: 72),
          child: PageView.builder(
            itemCount: widget.photos.length,
            controller: _controller,
            itemBuilder: (context, index) {
              Matrix4 matrix = Matrix4.identity();
              var scale = 0.8;
              var fade = 0.0;

              if (index == currentPage.floor() ||
                  index == currentPage.floor() + 1 ||
                  index == currentPage.floor() - 1) {
                scale = 1 - (currentPage - index).abs() * (1 - _scaleFactor);
              }
              fade = 1 - (currentPage - index).abs() * (1 - _fadeFactor);

              var transform = heightPageView * (1 - scale) / 2;
              matrix = Matrix4.diagonal3Values(1, scale, 1)
                ..setTranslationRaw(0, transform, 0);
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: AspectRatio(
                  aspectRatio: 1 / 2,
                  child: Transform(
                    transform: matrix,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: index == widget.initialIndex
                          ? Hero(
                              tag: widget.photos[index].url,
                              child: ImageFiltered(
                                imageFilter: ImageFilter.blur(
                                  sigmaX: fade,
                                  sigmaY: fade,
                                ),
                                child: Image.network(
                                  widget.photos[index].url,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            )
                          : ImageFiltered(
                              imageFilter: ImageFilter.blur(
                                sigmaX: fade,
                                sigmaY: fade,
                              ),
                              child: Image.network(
                                widget.photos[index].url,
                                fit: BoxFit.cover,
                              ),
                            ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
