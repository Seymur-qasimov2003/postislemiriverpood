import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:grock/grock.dart';
import 'package:postislemiriverpood/views/login.dart';

import '../services/loginservice.dart';
import '../views/pascode.dart';

class LoginViewModel extends ChangeNotifier {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  var _loginservice = LoginService();

  var box = GetStorage();
  void loginCall() {
    _loginservice
        .login(usernameController.text, passwordController.text)
        .then((value) {
      if (value != null) {
        box.write('token', value.token);

        Grock.toRemove(PasscodePage());
        notifyListeners();
      } else {
        Grock.snackBar(
          description: 'kullanici adi ve ya sifre yanlis',
          title: 'Hata',
          color: Colors.orange,
          curve: Curves.bounceIn,
        );
        Grock.toRemove(LoginPage());
        notifyListeners();
      }
    });
  }
}
