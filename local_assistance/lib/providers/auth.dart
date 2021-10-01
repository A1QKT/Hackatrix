import 'package:flutter/material.dart';

enum UserStatus { traveller, local }

class Auth with ChangeNotifier {
  UserStatus _userStatus;
  UserStatus get getUserStatus {
    return _userStatus;
  }

  void setUserStatus(UserStatus us) {
    _userStatus = us;
  }
}
