import 'package:flutter/material.dart';
import './components/PasswordField.dart';
import './components/EmailField.dart';
import './components/VerifyField.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegisterScreen extends StatelessWidget {
  final _passwordFocusNode = FocusNode();
  final _verifyPasswordFocusNode = FocusNode();
  final _form = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _verifyPasswordController = TextEditingController();
  final _auth = FirebaseAuth.instance;

  void saveAccount() async {
    _auth.createUserWithEmailAndPassword(
      email: _emailController.text,
      password: _passwordController.text,
    );

    final isValid = _form.currentState.validate();
    if (!isValid) {
      return;
    }
    _form.currentState.save();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        height: size.height,
        width: double.infinity,
        child: Form(
          key: _form,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              EmailField(
                emailController: _emailController,
                passwordFocusNode: _passwordFocusNode,
              ),
              PasswordField(
                passwordController: _passwordController,
                passwordFocusNode: _passwordFocusNode,
                verifyPasswordFocusNode: _verifyPasswordFocusNode,
              ),
              VerifyField(
                verifyPasswordController: _verifyPasswordController,
                verifyPasswordFocusNode: _verifyPasswordFocusNode,
                passwordController: _passwordController,
              ),
              InkWell(
                onTap: saveAccount,
                child: Container(
                  alignment: Alignment.center,
                  width: size.width * 0.3,
                  margin: EdgeInsets.symmetric(vertical: 10),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  decoration: BoxDecoration(
                    color: Color(0xffcdc3af),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    'Đăng ký',
                    textScaleFactor: 1.3,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
