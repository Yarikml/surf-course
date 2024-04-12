import 'package:flutter/material.dart';
import 'package:surf_flutter_courses_template/assets/app_strings/app_strings.dart';
import 'package:surf_flutter_courses_template/utils/extensions/date_time_x.dart';

import 'package:surf_flutter_courses_template/assets/text/text_extension.dart';

class ReceiptAppbar extends StatelessWidget implements PreferredSizeWidget {
  const ReceiptAppbar({
    super.key,
    required this.receiptId,
    required this.datetime,
  });

  final int receiptId;
  final DateTime datetime;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: const BackButton(),
      centerTitle: true,
      title: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            AppStrings.receiptNumber(
              receiptId.toString(),
            ),
            style: Theme.of(context).extension<AppTextTheme>()!.bold18,
          ),
          Text(
            AppStrings.receiptDateTime(
              datetime.formattedDate,
              datetime.formattedTime,
            ),
            style: Theme.of(context).extension<AppTextTheme>()!.regular10,
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
