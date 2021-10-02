import 'package:flutter/material.dart';

enum UserStatus { traveller, local }

class Auth with ChangeNotifier {
  UserStatus _userStatus;

  UserStatus get getUserStatus {
    return _userStatus;
  }

  String getStatusString() {
    if (_userStatus == UserStatus.local) {
      return 'Locals';
    } else if (_userStatus == UserStatus.traveller) {
      return 'Users';
    }
    return null;
  }

  void setUserStatus(UserStatus us) {
    _userStatus = us;
    notifyListeners();
  }
}
