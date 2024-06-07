import 'package:flutter/material.dart';

class PhotoItem extends StatelessWidget {
  const PhotoItem({
    super.key,
    required this.url,
  });

  final String url;

  @override
  Widget build(BuildContext context) {
    return Image.network(
      url,
      fit: BoxFit.cover,

    );
  }
}
