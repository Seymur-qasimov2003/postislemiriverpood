import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../viewmodel/loginviewmodel.dart';

var loginRiverpodProvider = ChangeNotifierProvider((_) => LoginViewModel());
