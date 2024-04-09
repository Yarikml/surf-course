import 'package:flutter/material.dart';

import '../../../assets/text/text_extension.dart';

class ReceiptAppbar extends StatelessWidget implements PreferredSizeWidget {
  const ReceiptAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: const BackButton(),
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
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
