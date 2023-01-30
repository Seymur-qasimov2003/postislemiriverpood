import 'package:dio/dio.dart';

import '../model/loginmodel.dart';

class LoginService {
  var dio = Dio();
  final String url = 'https://reqres.in/api/login';
  Future<LoginModel?> login(String email, String password) async {
    try {
      var response = await dio.post(url, data: {
        'email': email,
        'password': password,
      });
      if (response.statusCode == 200) {
        return LoginModel.fromJson(response.data);
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }
}
