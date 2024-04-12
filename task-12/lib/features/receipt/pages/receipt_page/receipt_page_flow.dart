import 'package:flutter/material.dart';
import 'package:surf_flutter_courses_template/assets/app_strings/app_strings.dart';
import 'package:surf_flutter_courses_template/features/receipt/pages/receipt_page/receipt_page.dart';

import '../../../../assets/colors/color_scheme.dart';
import '../../../../runner.dart';
import '../../model/receipt_entity.dart';

class ReceiptPageFlow extends StatefulWidget {
  const ReceiptPageFlow({
    super.key,
    required this.id,
  });
  final int id;

  @override
  State<ReceiptPageFlow> createState() => _ReceiptPageFlowState();
}

class _ReceiptPageFlowState extends State<ReceiptPageFlow> {
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
    return FutureBuilder(
        future: _data,
        builder: (_, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return Text(AppStrings.error);
            } else if (snapshot.hasData) {
              return ReceiptPage(receipt: snapshot.data!);
            }
          }
          return Container(
            alignment: Alignment.center,
            child: SizedBox(
              width: 128,
              height: 128,
              child: CircularProgressIndicator(
                strokeWidth: 3,
                color: AppColorScheme.of(context).primary,
              ),
            ),
          );
        });
  }
}
