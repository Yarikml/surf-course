import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ErrorPlaceholder extends StatelessWidget {
  const ErrorPlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Center(
        child: Text(AppLocalizations.of(context)!.error),
      ),
    );
  }
}
