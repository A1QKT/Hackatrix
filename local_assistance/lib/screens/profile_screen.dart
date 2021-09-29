import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  static String routName = '/profile-screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Profile'),
      ),
    );
  }
}
