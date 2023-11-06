import 'dart:convert';

import 'package:united_market/constants.dart';
import 'package:united_market/model/user.dart';

import 'package:http/http.dart';
import 'package:http/http.dart' as http;

Future<List<User>> fetchUsers() async {
  const path = '/users';
  Uri url = Uri.https(httpAuthority, path);
  final response = await http.get(url);

  if (response.statusCode == 200) {
    print(response.body);
    // If the server did return a 200 OK response,
    // then parse the JSON.
    List<User> users = (jsonDecode(response.body) as List)
        .map((i) => User.fromJson(i))
        .toList();

    return users;
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}
