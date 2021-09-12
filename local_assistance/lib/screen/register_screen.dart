import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  String? valid(value) {
    if (value == null || value.isEmpty) {
      return 'Vui lòng nhập thông tin';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Đăng ký tài khoản'),
      ),
      body: Column(
        children: [
          TextFormField(
            decoration: const InputDecoration(
              icon: Icon(Icons.person),
              hintText: 'Họ',
            ),
            validator: (value) => valid(value),
          ),
        ],
      ),
    );
  }
}
