import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:surf_flutter_courses_template/assets/colors/color_scheme.dart';
import 'package:surf_flutter_courses_template/assets/text/text_extension.dart';
import 'package:surf_flutter_courses_template/features/receipt/logic/receipt_calculator.dart';
import 'package:surf_flutter_courses_template/features/receipt/logic/sorter.dart';
import 'package:surf_flutter_courses_template/features/receipt/model/product_entity.dart';
import 'package:surf_flutter_courses_template/features/receipt/pages/receipt_page/sort_products_bottom_sheet.dart';
import 'package:surf_flutter_courses_template/features/receipt/widgets/product_list.dart';
import 'package:surf_flutter_courses_template/features/receipt/widgets/receipt_appbar.dart';
import 'package:surf_flutter_courses_template/features/receipt/widgets/receipt_summary.dart';
import 'package:surf_flutter_courses_template/mock/product_list_mock.dart';

import '../../widgets/product_item.dart';

enum SortType {
  idle('Без сортировки'),
  byNameFromAToZ('По имени  от А до Я'),
  byNameFromZToA('По имени  от Я до А'),
  byPriceIncrease('По возрастанию'),
  byPriceDecrease('По убыванию'),
  byTypeFromAToZ('По типу от А до Я'),
  byTypeFromZToA('По типу от Я до А');

  final String value;

  const SortType(this.value);
}

enum SortStatus {
  idle,
  loading,
}

class ReceiptPage extends StatefulWidget {
  const ReceiptPage({super.key});

  @override
  State<ReceiptPage> createState() => _ReceiptPageState();
}

class _ReceiptPageState extends State<ReceiptPage> {
  late final List<ProductEntity> products;
  late List<ProductEntity> filteredProducts;
  late final ReceiptCalculator receiptCalc;
  SortStatus sortStatus = SortStatus.idle;

  ValueNotifier<SortType> currentSortType =
      ValueNotifier<SortType>(SortType.idle);

  @override
  void initState() {
    products = ProductListMock.dataForStudents;
    filteredProducts = products;
    receiptCalc = ReceiptCalculator(products: products);
    currentSortType.addListener(() async {
      filteredProducts = await products.sortByRule(currentSortType.value);
    });
    super.initState();
  }

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
                      InkWell(
                        onTap: () => showModalBottomSheet(
                          isScrollControlled: true,
                          shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30),
                          )),
                          context: context,
                          builder: (context) => SortProductsBottomSheet(
                            currentSortType: currentSortType.value,
                            onSubmitSortType: (SortType? value) {
                              currentSortType.value = value!;
                            },
                          ),
                        ),
                        child: Stack(
                          children: [
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
                            ValueListenableBuilder(
                              valueListenable: currentSortType,
                              builder: (BuildContext context, SortType value,
                                      Widget? child) =>
                                  value != SortType.idle
                                      ? Positioned(
                                          right: 4,
                                          bottom: 4,
                                          child: Container(
                                            width: 8,
                                            height: 8,
                                            decoration: BoxDecoration(
                                              color: AppColorScheme.of(context)
                                                  .primary,
                                              borderRadius:
                                                  BorderRadius.circular(16),
                                            ),
                                          ))
                                      : Container(),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              sortStatus == SortStatus.idle
                  ? SliverPadding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      sliver: ValueListenableBuilder(
                        valueListenable: currentSortType,
                        builder: (context, value, _) => SliverList.builder(
                          itemBuilder: (BuildContext context, int index) =>
                              ProductItem(
                            product: filteredProducts[index],
                            hasCategoryName: value == SortType.byTypeFromAToZ &&
                                (index == 0 ||
                                    filteredProducts[index - 1].category !=
                                        filteredProducts[index].category),
                            hasDivider: value == SortType.byTypeFromAToZ &&
                                (index == filteredProducts.length - 1 ||
                                    filteredProducts[index + 1].category !=
                                        filteredProducts[index].category),
                          ),
                          itemCount: filteredProducts.length,
                        ),
                      ))
                  : SliverFillRemaining(
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
                    ),
              SliverToBoxAdapter(
                child: Divider(
                  height: 1,
                  indent: 20,
                  endIndent: 20,
                  thickness: 1,
                ),
              ),
              ReceiptSummary(
                receiptCalculator: receiptCalc,
              ),
            ],
          ),
        ));
  }
}
