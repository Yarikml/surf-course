import 'package:flutter/material.dart';

import '../../../assets/text/text_extension.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16),
      height: 100,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                'https://images.unsplash.com/photo-1521223344201-d169129f7b7d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1335&q=80',
                width: 68,
                height: 68,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Сыр PRESIDENT Camembert с белой плесенью 45%, без змж, 125г',
                  style: Theme.of(context).extension<AppTextTheme>()!.regular12,
                  textAlign: TextAlign.start,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      '1 шт',
                      style: Theme.of(context)
                          .extension<AppTextTheme>()!
                          .regular12,
                    ),
                    Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Text(
                        '1 158 руб',
                        style: Theme.of(context)
                            .extension<AppTextTheme>()!
                            .regular12SaleOldPrice,
                      ),
                    ),
                    Text(
                      '858 руб',
                      style:
                          Theme.of(context).extension<AppTextTheme>()!.bold12,
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
