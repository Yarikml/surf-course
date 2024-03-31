import 'package:flutter/material.dart';

import '../../../assets/text/text_extension.dart';

class ReceiptSummary extends StatelessWidget {
  const ReceiptSummary({
    super.key,
    required this.salePercent,
    required this.saleSummary,
    required this.summaryPriceInRub,
    required this.summaryPriceWithSaleInRub,
    required this.productsAmount,
  });

  final int productsAmount;
  final double summaryPriceInRub;
  final int salePercent;
  final double saleSummary;
  final double summaryPriceWithSaleInRub;

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.only(
        left: 20,
        right: 20,
        top: 24,
      ),
      sliver: SliverMainAxisGroup(
        slivers: [
          SliverPadding(
            padding: const EdgeInsets.only(bottom: 8),
            sliver: SliverToBoxAdapter(
              child: Text(
                'В вашей покупке',
                style: AppTextTheme.of(context).bold16,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '$productsAmount товаров',
                  style: Theme.of(context).extension<AppTextTheme>()!.regular12,
                ),
                Text(
                  '${summaryPriceInRub} руб',
                  style: Theme.of(context).extension<AppTextTheme>()!.bold12,
                ),
              ],
            ),
          ),
          saleSummary > 0
              ? SliverPadding(
                  padding: const EdgeInsets.symmetric(vertical: 11),
                  sliver: SliverToBoxAdapter(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Скидка ${salePercent}%',
                          style: Theme.of(context)
                              .extension<AppTextTheme>()!
                              .regular12,
                        ),
                        Text(
                          '-${saleSummary} руб',
                          style: Theme.of(context)
                              .extension<AppTextTheme>()!
                              .bold12,
                        ),
                      ],
                    ),
                  ),
                )
              : Container(),
          SliverToBoxAdapter(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Итого',
                  style: Theme.of(context).extension<AppTextTheme>()!.bold16,
                ),
                Text(
                  '${summaryPriceWithSaleInRub} руб',
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
