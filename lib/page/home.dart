import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import 'package:united_market/route/notifier.dart';
import 'package:united_market/route/route.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final notifier = Provider.of<PageNotifier>(context);

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ClipOval(
            child: Image.asset('assets/logo.jpg', width: 300),
          ),
          TextButton(
            child: Text(AppLocalizations.of(context)!.appTitle),
            onPressed: () {
              notifier.changePage(page: PageNames.userSelect.name);
            },
          ),
        ],
      ),
    );
  }
}
