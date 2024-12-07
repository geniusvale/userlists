import 'dart:convert';

import 'package:userlists/models/user_model.dart';
import 'package:http/http.dart' as http;

class UserRepository {
  List<User>? usersData = [];

  Future<List<User>?> fetchUsersData() async {
    try {
      final response = await http
          .get(Uri.parse('https://jsonplaceholder.typicode.com/users'));

      if (response.statusCode == 200) {
        List data = jsonDecode(response.body);
        List<User> newData = data.map((e) => User.fromJson(e)).toList();
        usersData = newData;
        return newData;
      } else {
        print('Error Code ${response.statusCode}');
      }
    } catch (e) {
      print('Error $e');
    }
  }
}
