import 'package:flutter/material.dart';

class PersonalInfo {
  final String firstname;
  final String lastname;

  final String personalID;
  final String nation;
  final String gender;
  final DateTime dateOfBirth;

  final String username;
  final String password;

  PersonalInfo({
    @required this.firstname,
    @required this.lastname,
    @required this.personalID,
    @required this.nation,
    @required this.gender,
    @required this.dateOfBirth,
    @required this.username,
    @required this.password,
  });
}
