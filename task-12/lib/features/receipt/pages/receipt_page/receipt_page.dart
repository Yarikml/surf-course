import 'package:flutter/material.dart';
import 'package:surf_flutter_courses_template/assets/colors/color_scheme.dart';
import 'package:surf_flutter_courses_template/assets/text/text_extension.dart';

import 'package:surf_flutter_courses_template/features/receipt/pages/receipt_page/sort_products_bottom_sheet.dart';
import 'package:surf_flutter_courses_template/features/receipt/widgets/product_list.dart';
import 'package:surf_flutter_courses_template/features/receipt/widgets/receipt_appbar.dart';
import 'package:surf_flutter_courses_template/features/receipt/widgets/receipt_summary.dart';

import '../../../../runner.dart';
import '../../logic/receipt_calculator.dart';
import '../../model/receipt_entity.dart';
import '../../widgets/product_item.dart';

enum SortType {
  idle('Без сортировки'),
  byName('По имени'),
  byPrice('По цене'),
  byType('По типу');

  final String value;

  const SortType(this.value);
}

enum SortSubType {
  idle(type: SortType.idle, name: 'Без сортировки'),
  byNameFromAToZ(type: SortType.byName, name: 'По имени  от А до Я'),
  byNameFromZToA(type: SortType.byName, name: 'По имени  от Я до А'),
  byPriceIncrease(type: SortType.byPrice, name: 'По возрастанию'),
  byPriceDecrease(type: SortType.byPrice, name: 'По убыванию'),
  byTypeFromAToZ(type: SortType.byType, name: 'По типу от А до Я'),
  byTypeFromZToA(type: SortType.byType, name: 'По типу от Я до А');

  final String name;
  final SortType type;

  const SortSubType({
    required this.name,
    required this.type,
  });
}

class ReceiptPage extends StatefulWidget {
  const ReceiptPage({
    super.key,
    required this.id,
  });

  final int id;

  @override
  State<ReceiptPage> createState() => _ReceiptPageState();
}

class _ReceiptPageState extends State<ReceiptPage> {
  late final ReceiptCalculator summaryCalculator;

  SortSubType currentSortSubType = SortSubType.idle;

  Future<ReceiptEntity>? _data;

  Future<void> _loadReceipt() async {
    _data = receiptRepository.getReceipt(id: widget.id);
  }

  @override
  void initState() {
    _loadReceipt();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const ReceiptAppbar(),
        body: SafeArea(
          child: CustomScrollView(
            slivers: [
              SliverPadding(
                padding: const EdgeInsets.only(
                  left: 20,
                  right: 20,
                  top: 24,
                  bottom: 16,
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
                      InkWell(
                        onTap: () async {
                          final SortSubType? result =
                              await showModalBottomSheet<SortSubType>(
                            isScrollControlled: true,
                            isDismissible: false,
                            shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30),
                            )),
                            context: context,
                            builder: (context) => SortProductsBottomSheet(
                              currentSortSubType: currentSortSubType,
                            ),
                          );
                          if (result != null) {
                            setState(() {
                              currentSortSubType = result;
                            });

                            await Future.delayed(const Duration(seconds: 1));
                          }
                        },
                        child: Stack(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(4),
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
                            currentSortSubType != SortSubType.idle
                                ? Positioned(
                                    right: 4,
                                    bottom: 4,
                                    child: Container(
                                      width: 8,
                                      height: 8,
                                      decoration: BoxDecoration(
                                        color:
                                            AppColorScheme.of(context).primary,
                                        borderRadius: BorderRadius.circular(16),
                                      ),
                                    ))
                                : Container(),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              FutureBuilder(
                  future: _data,
                  builder: (_, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      if (snapshot.hasError) {
                        return Text('error');
                      } else if (snapshot.hasData) {
                        return ProductList(
                          productList: snapshot.data!.products,
                          currentSortSubType: currentSortSubType,
                        );
                      }
                    }
                    return SliverFillRemaining(
                      child: Container(
                        alignment: Alignment.center,
                        child: SizedBox(
                          width: 128,
                          height: 128,
                          child: CircularProgressIndicator(
                            strokeWidth: 3,
                            color: AppColorScheme.of(context).primary,
                          ),
                        ),
                      ),
                    );
                  }),
              /*         ReceiptSummary(
                summaryCalculator: summaryCalculator,
              ),*/
            ],
          ),
        ));
  }
}
