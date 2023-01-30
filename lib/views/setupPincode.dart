import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../services/auth.dart';

class SetupPincode extends ConsumerStatefulWidget {
  const SetupPincode({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _SetupPincodeState();
}

class _SetupPincodeState extends ConsumerState<SetupPincode> {
  late StreamController<bool> verficationController;

  void _onCallback(String enteredCode) {
    authService.verifyCode(enteredCode);
    authService.isEnabledStream.listen((isSet) {
      if (isSet) {
        Navigator.pushNamed(context, 'home');
      }
    });
  }

  void _onCancelCakllBack() {
    // Should be disabled since you're already set the bio.
    return;
  }

  void initState() {
    this.verficationController = authService.isEnabledController;
    super.initState();
  }

  @override
  void dispose() {
    this.verficationController.close();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Container();
  }
}
