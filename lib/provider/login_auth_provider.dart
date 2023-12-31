import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class LoginAuth with ChangeNotifier {
  bool _loading = false;
  bool get loading => _loading;

  setloading(bool value) {
    _loading = value;
    notifyListeners();
  }

  bool _obs = true;
  bool get obs => _obs;

  setobsecure(bool values) {
    _obs = values;
    notifyListeners();
  }

  void Login(String email, String password) async {
    setloading(true);
    try {
      http.Response response =
          await http.post(Uri.parse('https://reqres.in/api/login'), body: {
        'email': email,
        'password': password,
      });
      if (response.statusCode == 200) {
        print('success');
        setloading(false);
      } else {
        print('failed');
        setloading(false);
      }
    } catch (e) {
      print(e.toString());
      setloading(false);
    }
  }
}
