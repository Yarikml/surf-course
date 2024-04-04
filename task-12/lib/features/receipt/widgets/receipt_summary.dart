import 'package:flutter/material.dart';
import 'package:surf_flutter_courses_template/features/receipt/logic/receipt_calculator.dart';

import '../../../assets/text/text_extension.dart';

class ReceiptSummary extends StatelessWidget {
  const ReceiptSummary({
    super.key,
    required this.receiptCalculator,
  });

  final ReceiptCalculator receiptCalculator;

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
                  '${receiptCalculator.products.length} товаров',
                  style: Theme.of(context).extension<AppTextTheme>()!.regular12,
                ),
                Text(
                  '${receiptCalculator.pricesSummaryInRub} руб',
                  style: Theme.of(context).extension<AppTextTheme>()!.bold12,
                ),
              ],
            ),
          ),
          receiptCalculator.sale > 0
              ? SliverPadding(
                  padding: const EdgeInsets.symmetric(vertical: 11),
                  sliver: SliverToBoxAdapter(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Скидка ${receiptCalculator.salePercent}%',
                          style: Theme.of(context)
                              .extension<AppTextTheme>()!
                              .regular12,
                        ),
                        Text(
                          '-${receiptCalculator.saleInRub} руб',
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
                  '${receiptCalculator.priceSummaryWithSaleInRub} руб',
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
