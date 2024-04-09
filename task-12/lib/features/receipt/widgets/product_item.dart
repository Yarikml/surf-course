import 'package:flutter/material.dart';
import 'package:surf_flutter_courses_template/features/receipt/widgets/product_photo_shimmer.dart';

import '../../../assets/text/text_extension.dart';
import '../model/product_entity.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({
    super.key,
    required this.product,
    required this.hasCategoryName,
    required this.hasDivider,
  });

  final ProductEntity product;
  final bool hasCategoryName;
  final bool hasDivider;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        hasCategoryName
            ? Text(
                product.category.name,
                style: AppTextTheme.of(context).bold16,
              )
            : Container(),
        Container(
          height: 100,
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 12),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    product.imageUrl,
                    loadingBuilder: (BuildContext context, Widget child,
                            ImageChunkEvent? loadingProgress) =>
                        loadingProgress == null
                            ? child
                            : const ProductPhotoShimmer(),
                    width: 68,
                    height: 68,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      product.title,
                      style: AppTextTheme.of(context).regular12,
                      textAlign: TextAlign.start,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          '${product.formattedAmount} ${product.amountCaption}',
                          style: AppTextTheme.of(context).regular12,
                        ),
                        Spacer(),
                        product.hasSale
                            ? Padding(
                                padding: const EdgeInsets.only(right: 8.0),
                                child: Text(
                                  '${product.priceInRub} руб',
                                  style: AppTextTheme.of(context)
                                      .regular12SaleOldPrice,
                                ),
                              )
                            : Container(),
                        Text(
                          '${product.priceWithSaleInRub} руб',
                          style: product.hasSale
                              ? AppTextTheme.of(context).bold12SaleNewPrice
                              : AppTextTheme.of(context).bold12,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        hasDivider
            ? Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: Divider(
                  thickness: 1,
                ),
              )
            : Container(),
      ],
    );
  }
}
