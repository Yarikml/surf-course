import 'package:flutter/material.dart';
import 'package:surf_flutter_courses_template/features/receipt/widgets/product_item.dart';
import 'package:surf_flutter_courses_template/features/receipt/model/product_entity.dart';
import 'package:surf_flutter_courses_template/features/receipt/pages/receipt_page/receipt_page.dart';

class ProductList extends StatelessWidget {
  const ProductList({
    super.key,
    required this.productList,
    required this.currentSortSubType,
  });

  final List<ProductEntity> productList;
  final SortSubType currentSortSubType;

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      sliver: SliverList.builder(
        itemBuilder: (BuildContext context, int index) {
          final bool isSortTypeByType =
              currentSortSubType == SortSubType.byTypeFromAToZ ||
                  currentSortSubType == SortSubType.byTypeFromZToA;
          return ProductItem(
            product: productList[index],
            hasCategoryName: isSortTypeByType &&
                (index == 0 ||
                    productList[index - 1].category !=
                        productList[index].category),
            hasDivider: isSortTypeByType &&
                (index == productList.length - 1 ||
                    productList[index + 1].category !=
                        productList[index].category),
          );
        },
        itemCount: productList.length,
      ),
    );
  }
}
