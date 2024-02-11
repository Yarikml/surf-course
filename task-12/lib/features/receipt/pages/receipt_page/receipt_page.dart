import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:surf_flutter_courses_template/assets/colors/color_scheme.dart';
import 'package:surf_flutter_courses_template/assets/text/text_extension.dart';
import 'package:surf_flutter_courses_template/features/receipt/widgets/product_item.dart';

class ReceiptPage extends StatelessWidget {
  const ReceiptPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: BackButton(),
          centerTitle: true,
          title: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Чек № 56',
                style: Theme.of(context).extension<AppTextTheme>()!.bold18,
              ),
              Text(
                '24.02.23 в 12:23',
                style: Theme.of(context).extension<AppTextTheme>()!.regular10,
              ),
            ],
          ),
        ),
        body: SafeArea(
          child: CustomScrollView(
            slivers: [
              SliverPadding(
                padding: const EdgeInsets.only(
                  left: 20,
                  right: 20,
                  top: 24,
                  bottom: 16.0,
                ),
                sliver: SliverToBoxAdapter(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Список покупок',
                        style:
                            Theme.of(context).extension<AppTextTheme>()!.bold18,
                      ),
                      Container(
                        padding: EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          color: Theme.of(context)
                              .extension<AppColorScheme>()!
                              .onBackground,
                        ),
                        child: Icon(
                          Icons.sort,
                          size: 24,
                          color: Theme.of(context)
                              .extension<AppColorScheme>()!
                              .secondary,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                sliver: SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) => ProductItem(),
                    childCount: 10,
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Divider(
                  height: 1,
                  indent: 20,
                  endIndent: 20,
                  thickness: 1,
                ),
              ),
              SliverPadding(
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
                          style: Theme.of(context)
                              .extension<AppTextTheme>()!
                              .bold16,
                        ),
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '10 товаров',
                            style: Theme.of(context)
                                .extension<AppTextTheme>()!
                                .regular12,
                          ),
                          Text(
                            '7 842 руб',
                            style: Theme.of(context)
                                .extension<AppTextTheme>()!
                                .bold12,
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
                              style: Theme.of(context)
                                  .extension<AppTextTheme>()!
                                  .regular12,
                            ),
                            Text(
                              '-300 руб',
                              style: Theme.of(context)
                                  .extension<AppTextTheme>()!
                                  .bold12,
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
                            style: Theme.of(context)
                                .extension<AppTextTheme>()!
                                .bold16,
                          ),
                          Text(
                            '7 542 руб',
                            style: Theme.of(context)
                                .extension<AppTextTheme>()!
                                .bold16,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
