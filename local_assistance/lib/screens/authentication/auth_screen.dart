import 'package:flutter/material.dart';

enum AuthStatus {
  login,
  signup,
}

class AuthScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber[400],
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
              alignment: Alignment.topCenter,
              height: 300,
              child: Image.asset("logo/LocalAssitance-logos_white.png"),
            ),
            AuthFeature(),
          ],
        ),
      ),
    );
  }
}

class AuthFeature extends StatefulWidget {
  @override
  _AuthFeatureState createState() => _AuthFeatureState();
}

class _AuthFeatureState extends State<AuthFeature> {
  AuthStatus _authStatus = AuthStatus.login;
  final authData = {
    "userName": null,
    "gmail": null,
    "password": null,
  };
  final focusPassword = FocusNode();
  final focusConfirmPassword = FocusNode();
  final _form = GlobalKey<FormState>();
  TextEditingController _email = TextEditingController();
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _form,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
              width: 350,
              decoration: BoxDecoration(
                color: Colors.amber[200],
                border: Border.all(width: 0.5),
                borderRadius: BorderRadius.circular(30),
              ),
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: "Gmail",
                  border: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                ),
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(focusPassword);
                },
              ),
            ),
            SizedBox(height: 8),
            Container(
              width: 350,
              padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
              decoration: BoxDecoration(
                color: Colors.amber[200],
                border: Border.all(width: 0.5),
                borderRadius: BorderRadius.circular(30),
              ),
              child: TextFormField(
                controller: _email,
                decoration: InputDecoration(
                  labelText: "Password",
                  border: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                ),
                validator: (value) {
                  if (value.length < 6) return "Password must greater than 6";
                  return null;
                },
                onFieldSubmitted: (value) {
                  if (_authStatus == AuthStatus.signup) {
                    FocusScope.of(context).requestFocus();
                  }
                },
              ),
            ),
            SizedBox(height: 8),
            if (_authStatus == AuthStatus.signup)
              Container(
                width: 350,
                padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                decoration: BoxDecoration(
                  color: Colors.amber[200],
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: "Confirm password",
                    border: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                  ),
                  validator: (value) {
                    if (value != _email.text) {
                      return "Password doesn't match";
                    }
                    return null;
                  },
                ),
              ),
            SizedBox(height: 20),
            Container(
              alignment: Alignment.center,
              width: 350,
              padding: EdgeInsets.fromLTRB(0, 4, 0, 4),
              decoration: BoxDecoration(
                color: Colors.amber[300],
                border: Border.all(width: 0.5),
                borderRadius: BorderRadius.circular(30),
              ),
              child: FlatButton(
                onPressed: () {},
                child: (_authStatus == AuthStatus.login)
                    ? Text("login")
                    : Text("signup"),
              ),
            ),
            if (_authStatus == AuthStatus.login)
              FlatButton(
                  onPressed: () {
                    setState(() {
                      _authStatus = AuthStatus.signup;
                    });
                  },
                  child: Text("Create your account")),
          ],
        ),
      ),
    );
  }
}
