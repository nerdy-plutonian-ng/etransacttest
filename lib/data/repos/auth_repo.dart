import 'package:shared_preferences/shared_preferences.dart';

import '../models/user_data.dart';

abstract class Auth {
  Future<bool> login({required String email, required String password});
  Future<bool> register({required UserData userData});
}

class PrefsAuth implements Auth {
  PrefsAuth._();

  static PrefsAuth? prefsAuth;
  UserData? userData;
  SharedPreferences? _prefs;

  factory PrefsAuth() {
    prefsAuth ??= PrefsAuth._();
    return prefsAuth!;
  }

  @override
  Future<bool> login({required String email, required String password}) async {
    try {
      _open();
      return (userData?.email == email && userData?.password == password);
    } catch (_) {
      return false;
    }
  }

  @override
  Future<bool> register({
    required UserData userData,
  }) async {
    try {
      _open();
      final result =
          await _prefs?.setString('userData', userData.userDataToJson()) ??
              false;
      if (result) {
        this.userData = userData;
      }
      return result;
    } catch (_) {
      return false;
    }
  }

  _open() async {
    _prefs ??= await SharedPreferences.getInstance();
    final userDataStr = _prefs?.getString('userData');
    if (userDataStr != null) {
      userData = UserData.userDataFromJson(userDataStr);
    }
  }
}
