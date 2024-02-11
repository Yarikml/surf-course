import 'package:flutter/material.dart';

import '../../../assets/text/text_extension.dart';

class ReceiptSummary extends StatelessWidget {
  const ReceiptSummary({super.key});

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
                  '10 товаров',
                  style: Theme.of(context).extension<AppTextTheme>()!.regular12,
                ),
                Text(
                  '7 842 руб',
                  style: Theme.of(context).extension<AppTextTheme>()!.bold12,
                ),
              ],
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(vertical: 11),
            sliver: SliverToBoxAdapter(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Скидка 5%',
                    style:
                        Theme.of(context).extension<AppTextTheme>()!.regular12,
                  ),
                  Text(
                    '-300 руб',
                    style: Theme.of(context).extension<AppTextTheme>()!.bold12,
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Итого',
                  style: Theme.of(context).extension<AppTextTheme>()!.bold16,
                ),
                Text(
                  '7 542 руб',
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
