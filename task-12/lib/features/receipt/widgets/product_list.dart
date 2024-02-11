import 'package:flutter/material.dart';
import 'package:surf_flutter_courses_template/features/receipt/widgets/product_item.dart';

class ProductList extends StatelessWidget {
  const ProductList({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate(
          (context, index) => ProductItem(),
          childCount: 10,
        ),
      ),
    );
  }
}
