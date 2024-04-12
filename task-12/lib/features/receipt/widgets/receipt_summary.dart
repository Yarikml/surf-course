import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:surf_flutter_courses_template/assets/app_strings/app_strings.dart';
import 'package:surf_flutter_courses_template/utils/extensions/decimal_x.dart';

import '../../../assets/text/text_extension.dart';
import '../../../utils/receipt_calculator.dart';
import '../model/product_entity.dart';

class ReceiptSummary extends StatefulWidget {
  const ReceiptSummary({
    super.key,
    required this.products,
  });

  final List<ProductEntity> products;

  @override
  State<ReceiptSummary> createState() => _ReceiptSummaryState();
}

class _ReceiptSummaryState extends State<ReceiptSummary> {
  late ReceiptCalculator receiptCalculator;

  @override
  void initState() {
    receiptCalculator = ReceiptCalculator(products: widget.products);
    super.initState();
  }

  String getSuitProductTitle(int quantity) {
    return Intl.plural(
      quantity,
      one: '$quantity товар',
      other: '$quantity товаров',
      name: "товар",
      args: [quantity],
      examples: const {'quantity': 4},
      desc: "Food quantity to order from cart",
    );
  }

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.only(
        left: 20,
        right: 20,
        top: 24,
        bottom: 40,
      ),
      sliver: SliverMainAxisGroup(
        slivers: [
          SliverPadding(
            padding: const EdgeInsets.only(bottom: 8),
            sliver: SliverToBoxAdapter(
              child: Text(
                AppStrings.inYourTrash,
                style: AppTextTheme.of(context).bold16,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  getSuitProductTitle(widget.products.length),
                  style: Theme.of(context).extension<AppTextTheme>()!.regular12,
                ),
                Text(
                  receiptCalculator.pricesSummary.toFormattedCurrency(),
                  style: Theme.of(context).extension<AppTextTheme>()!.bold12,
                ),
              ],
            ),
          ),
          receiptCalculator.salePercent > 0
              ? SliverPadding(
                  padding: const EdgeInsets.symmetric(vertical: 11),
                  sliver: SliverToBoxAdapter(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          AppStrings.salePercent(receiptCalculator.salePercent),
                          style: Theme.of(context)
                              .extension<AppTextTheme>()!
                              .regular12,
                        ),
                        Text(
                          AppStrings.saleAmount(receiptCalculator.saleAmount
                              .toFormattedCurrency()),
                          style: Theme.of(context)
                              .extension<AppTextTheme>()!
                              .bold12,
                        ),
                      ],
                    ),
                  ),
                )
              : SliverToBoxAdapter(
                  child: Container(),
                ),
          SliverToBoxAdapter(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AppStrings.finallyPrice,
                  style: Theme.of(context).extension<AppTextTheme>()!.bold16,
                ),
                Text(
                  receiptCalculator.priceSummaryWithSale.toFormattedCurrency(),
                  style: Theme.of(context).extension<AppTextTheme>()!.bold16,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
