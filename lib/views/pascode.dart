import 'package:flutter/material.dart';
import 'package:postislemiriverpood/views/home.dart';

import '../services/auth.dart';
import '../widgets/pascode.dart';
import 'login.dart';

class PasscodePage extends StatefulWidget {
  @override
  _PasscodePageState createState() => _PasscodePageState();
}

class _PasscodePageState extends State<PasscodePage> {
  late Stream<bool> _isVerification;
  late Future<bool> hasBio;
  int attempts = 0;

  @override
  void initState() {
    authService.isEnabledStream;
    this._isVerification = authService.isEnabledStream;
    super.initState();
  }

  void _onCallback(String enteredCode) {
    authService.verifyCode(enteredCode);
    this._isVerification.listen((isValid) {
      if (isValid) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => HomePage()));
      } else {
        setState(() => attempts += 1);
        if (attempts == 5) {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => LoginPage()));
        }
      }
    });
  }

  void _onCancel() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => LoginPage()));
  }

  Future<void> authenticate() async {
    final isAuthenticated = await localAuth.authenticate(
        localizedReason: 'Do something',
        stickyAuth: true,
        useErrorDialogs: true);
    authService.isEnabledController.add(isAuthenticated);
    if (isAuthenticated) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HomePage()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
        future: localAuth.canCheckBiometrics,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            this.authenticate();
            return Container(
              child: Text(
                'Please Authenticate with Face ID',
                style: TextStyle(fontSize: 25.0, color: Colors.white),
              ),
              margin: EdgeInsets.symmetric(vertical: 100, horizontal: 75.0),
            );
          }
          return PasscodeWidget(
            this._isVerification,
            this._onCallback,
            this._onCancel,
          );
        });
  }
}
