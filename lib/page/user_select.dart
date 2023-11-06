import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:http/http.dart';
import 'package:http/http.dart' as http;

import 'package:provider/provider.dart';
import 'package:united_market/model/request.dart';
import 'package:united_market/model/user.dart';

import 'package:united_market/route/notifier.dart';
import 'package:united_market/route/route.dart';

import 'package:united_market/constants.dart';
import 'package:united_market/state/parameter.dart';

class UserSelectPage extends StatefulWidget {
  const UserSelectPage({super.key});

  @override
  State<UserSelectPage> createState() => _UserSelectPageState();
}

class _UserSelectPageState extends State<UserSelectPage> {
  bool isLoaded = false;
  List<User> users = [];

  @override
  void initState() {
    super.initState();

    fetchUsers().then((value) {
      setState(() {});

      users = value;
      if (users.isNotEmpty) {
        isLoaded = true;
        setState(() {});
      }
      //debugPrint(users);
    });
  }

  @override
  Widget build(BuildContext context) {

    final parameter = Provider.of<AppParameterState>(context);
    final notifier = Provider.of<PageNotifier>(context);
    final title = AppLocalizations.of(context)!.userSelectMessage;

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: SafeArea(
        child: Center(
          child: !isLoaded
              ? const CircularProgressIndicator()
              : ListView.builder(
                  itemExtent: 100,
                  itemCount: users.length,
                  // This next line does the trick.
                  scrollDirection: Axis.vertical,
                  itemBuilder: (BuildContext ctx, int idx) {
                    return ListTile(
                      title: Text(users[idx].name),
                      onTap: () {
                        parameter.changeUserId(users[idx].id);
                        notifier.changePage(page: PageNames.userDetail.name);
                      },
                    );
                  }),
        ),
      ),
    );
  }
}
