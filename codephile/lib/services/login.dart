import 'package:codephile/models/token.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:codephile/resources/strings.dart';

var header = {"Content-Type": "application/json"};
http.Client client = new http.Client();

Future login(String username, String pass) async {
  String endpoint = "/user/login";
  String uri = url + endpoint;
  Token token;

  try {
    var response = await client.post(
      uri,
      body: {'username': username, 'password': pass},
    );
    if (response.statusCode == 200) {
      final jsonResponse = jsonDecode(response.body);
      token = new Token.fromJson(jsonResponse);
      return token;
    }
    return null;
  } on Exception catch (e) {
    print(e);
    return null;
  }
}
