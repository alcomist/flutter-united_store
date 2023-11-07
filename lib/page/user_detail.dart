import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:provider/provider.dart';
import 'package:united_market/model/request.dart';
import 'package:united_market/model/user.dart';

import 'package:united_market/route/notifier.dart';
import 'package:united_market/route/route.dart';

import 'package:united_market/constants.dart';

class UserDetailPage extends StatefulWidget {
  const UserDetailPage({super.key});

  @override
  State<UserDetailPage> createState() => _UserDetailPageState();
}

class _UserDetailPageState extends State<UserDetailPage> {
  late Future<User> user;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final notifier = Provider.of<PageNotifier>(context);
    user = fetchUser(notifier.userId);
  }

  @override
  Widget build(BuildContext context) {
    final title = AppLocalizations.of(context)!.userDetailTitle;

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: SafeArea(
        child: Center(
            child: FutureBuilder<User>(
          future: user,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Text(snapshot.data!.name);
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }

            // By default, show a loading spinner.
            return const CircularProgressIndicator();
          },
        )),
      ),
    );
  }
}
