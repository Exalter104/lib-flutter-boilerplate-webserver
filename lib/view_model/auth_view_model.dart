import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_boilerplate_webserver/repository/auth_repository.dart';
import 'package:flutter_boilerplate_webserver/utils/components/utils.dart';
import 'package:flutter_boilerplate_webserver/utils/routes/routes_name.dart';

class AuthViewModel with ChangeNotifier {
  final myrepo = AuthRepository();
  bool loading = false;
  bool get load => loading;
  setLoading(bool value) {
    loading = value;
    notifyListeners();
  }

  Future<void> loginApi(dynamic data, BuildContext context) async {
    setLoading(true);
    myrepo.loginApi(data).then((value) {
      setLoading(false);
      Navigator.pushNamed(context, RoutesNames.home);
      Utils.flushBarErrorMessage("Login Successfully", context);
      if (kDebugMode) {
        print(value.toString());
      }
    }).onError((error, stackTrace) {
      setLoading(false);
      Utils.flushBarErrorMessage(error.toString(), context);
      if (kDebugMode) {
        print(error.toString());
      }
    });
  }
}
