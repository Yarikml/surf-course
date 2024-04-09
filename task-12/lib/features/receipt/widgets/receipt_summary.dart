import 'package:flutter/material.dart';

import '../../../assets/text/text_extension.dart';
import '../logic/receipt_calculator.dart';

class ReceiptSummary extends StatelessWidget {
  const ReceiptSummary({
    super.key,
    required this.summaryCalculator,
  });

  final ReceiptCalculator summaryCalculator;

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
                  '${summaryCalculator.products.length} товаров',
                  style: Theme.of(context).extension<AppTextTheme>()!.regular12,
                ),
                Text(
                  '${summaryCalculator.pricesSummaryInRub} руб',
                  style: Theme.of(context).extension<AppTextTheme>()!.bold12,
                ),
              ],
            ),
          ),
          summaryCalculator.sale > 0
              ? SliverPadding(
                  padding: const EdgeInsets.symmetric(vertical: 11),
                  sliver: SliverToBoxAdapter(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Скидка ${summaryCalculator.salePercent}%',
                          style: Theme.of(context)
                              .extension<AppTextTheme>()!
                              .regular12,
                        ),
                        Text(
                          '-${summaryCalculator.saleInRub} руб',
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
                  '${summaryCalculator.priceSummaryWithSaleInRub} руб',
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
