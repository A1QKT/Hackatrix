import 'package:flutter/material.dart';

enum UserStatus { traveller, local }

class Auth with ChangeNotifier {
  String _uid;
  UserStatus _userStatus;
  UserStatus get getUserStatus {
    return _userStatus;
  }

  String get getUid {
    return _uid;
  }

  void setUid(String uid) {
    _uid = uid;
  }

  void setUserStatus(UserStatus us) {
    _userStatus = us;
  }
}
