import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:http/http.dart';
import 'package:http/http.dart' as http;

import 'package:provider/provider.dart';

import 'package:united_market/route/notifier.dart';
import 'package:united_market/route/route.dart';

import 'package:united_market/constants.dart';

class UserSelectPage extends StatefulWidget {
  const UserSelectPage({super.key});

  @override
  State<UserSelectPage> createState() => _UserSelectPageState();
}

class _UserSelectPageState extends State<UserSelectPage> {

  bool isLoaded = false;

  Future<Response> getData() async {
    const path = '/users';
    Uri url = Uri.https(httpAuthority, path);
    return http.get(url);
  }

  @override
  void initState() {
    super.initState();

    getData().then((value) {

      String result = value.body.toString().substring(0, 450);
      debugPrint(result);
    });
  }

  @override
  Widget build(BuildContext context) {

    final title = AppLocalizations.of(context)!.userSelectMessage;

    final containers = <Widget>[
      Container(
        width: 160,
        color: Colors.red,
      ),
      Container(
        width: 160,
        color: Colors.blue,
      ),
      Container(
        width: 160,
        color: Colors.green,
      ),
      Container(
        width: 160,
        color: Colors.yellow,
      ),
      Container(
        width: 160,
        color: Colors.orange,
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: isLoaded ?

        const CircularProgressIndicator() :
        ListView.builder(
          itemExtent: 100,
          itemCount: containers.length,
          // This next line does the trick.
          scrollDirection: Axis.vertical,
          itemBuilder: (BuildContext ctx, int idx) {
            return containers[idx];
          }
        ),
    );
  }
}
