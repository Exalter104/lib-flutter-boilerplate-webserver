import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_boilerplate_webserver/repository/auth_repository.dart';
import 'package:flutter_boilerplate_webserver/utils/components/utils.dart';

class AuthViewModel with ChangeNotifier {
  final myrepo = AuthRepository();
  Future<void> loginApi(dynamic data, BuildContext context) async {
    myrepo.loginApi(data).then((value) {
      Utils.flushBarErrorMessage("Login Successfully", context);
      if (kDebugMode) {
        print(value.toString());
      }
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        Utils.flushBarErrorMessage(error.toString(), context);
        print(error.toString());
      }
    });
  }
}
