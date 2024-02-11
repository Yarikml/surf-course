import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:surf_flutter_courses_template/assets/colors/color_scheme.dart';
import 'package:surf_flutter_courses_template/assets/text/text_extension.dart';
import 'package:surf_flutter_courses_template/features/receipt/widgets/product_item.dart';
import 'package:surf_flutter_courses_template/features/receipt/widgets/product_list.dart';
import 'package:surf_flutter_courses_template/features/receipt/widgets/receipt_appbar.dart';
import 'package:surf_flutter_courses_template/features/receipt/widgets/receipt_summary.dart';

class ReceiptPage extends StatelessWidget {
  const ReceiptPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: ReceiptAppbar(),
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
              ProductList(),
              SliverToBoxAdapter(
                child: Divider(
                  height: 1,
                  indent: 20,
                  endIndent: 20,
                  thickness: 1,
                ),
              ),
              ReceiptSummary(),
            ],
          ),
        ));
  }
}
