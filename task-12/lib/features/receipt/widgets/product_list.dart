import 'package:flutter/material.dart';
import 'package:surf_flutter_courses_template/features/receipt/pages/receipt_page/receipt_page.dart';
import 'package:surf_flutter_courses_template/features/receipt/widgets/product_item.dart';

import '../model/product_entity.dart';

class ProductList extends StatelessWidget {
  const ProductList({
    super.key,
    required this.productList,
    required this.currentSortType,
  });
  final List<ProductEntity> productList;
  final SortType currentSortType;
  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      sliver: SliverList.separated(
        itemBuilder: (BuildContext context, int index) => Container(),
        itemCount: productList.length,
        separatorBuilder: (BuildContext context, int index) => Container(),
      ),
    );
  }
}
