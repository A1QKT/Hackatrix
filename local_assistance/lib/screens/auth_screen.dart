import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:local_assistance/providers/auth.dart';
import '../constant/regex_const.dart';

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
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  AuthStatus _authStatus = AuthStatus.login;
  bool _isLoading = false;
  Map _authData = {
    "userName": null,
    "email": null,
    "password": null,
  };
  final _focusPassword = FocusNode();
  final _focusConfirmPassword = FocusNode();
  final _form = GlobalKey<FormState>();
  TextEditingController _email = TextEditingController();

  Future<void> _onSubmitted() async {
    if (!_form.currentState.validate()) return;
    _form.currentState.save();
    print(_authData);
    if (_authStatus == AuthStatus.login) {
      print("login");
      try {
        await _firebaseAuth.signInWithEmailAndPassword(
            email: _authData["email"], password: _authData["password"]);
      } on FirebaseAuthException catch (error) {
        if (error.code == 'user-not-found') {
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('No user found for that email.')));
        } else if (error.code == 'wrong-password') {
          SnackBar(content: Text('Wrong password provided for that user.'));
        }
      } catch (error) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("Something went wrong")));
      }
    } else {
      print("signup");
      try {
        UserCredential user =
            await _firebaseAuth.createUserWithEmailAndPassword(
                email: _authData["email"], password: _authData["password"]);
        FirebaseFirestore.instance.collection('users').doc(user.user.uid).set({
          'fullname': '',
          'location': '',
          'phonenumber': '',
        });
      } on FirebaseAuthException catch (error) {
        if (error.code == 'weak-password') {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text("weak password")));
        } else if (error.code == 'email-already-in-use') {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text("email already exist")));
        }
      } catch (error) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("Something went wrong")));
      }
    }
  }

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
              height: 60,
              width: 350,
              decoration: BoxDecoration(
                color: Colors.amber[200],
                border: Border.all(width: 0.5),
                borderRadius: BorderRadius.circular(30),
              ),
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: "Email",
                  border: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                ),
                textInputAction: TextInputAction.next,
                validator: (value) {
                  if (!value.contains("@")) return "Invalid email";
                  return null;
                },
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(_focusPassword);
                },
                onSaved: (value) {
                  _authData["email"] = value;
                },
              ),
            ),
            SizedBox(height: 8),
            Container(
              width: 350,
              height: 60,
              padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
              decoration: BoxDecoration(
                color: Colors.amber[200],
                border: Border.all(width: 0.5),
                borderRadius: BorderRadius.circular(30),
              ),
              child: TextFormField(
                focusNode: _focusPassword,
                controller: _email,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: "Password",
                  border: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                ),
                textInputAction: (_authStatus == AuthStatus.login)
                    ? TextInputAction.done
                    : TextInputAction.next,
                validator: (value) {
                  if (value.length < 6) return "Password must greater than 6";
                  return null;
                },
                onFieldSubmitted: (value) {
                  if (_authStatus == AuthStatus.signup) {
                    FocusScope.of(context).requestFocus(_focusConfirmPassword);
                  }
                },
                onSaved: (value) {
                  _authData["password"] = value;
                },
              ),
            ),
            SizedBox(height: 8),
            if (_authStatus == AuthStatus.signup)
              Container(
                width: 350,
                height: 60,
                padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                decoration: BoxDecoration(
                  color: Colors.amber[200],
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: TextFormField(
                  focusNode: _focusConfirmPassword,
                  obscureText: true,
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
              height: 60,
              padding: EdgeInsets.fromLTRB(0, 4, 0, 4),
              decoration: BoxDecoration(
                color: Colors.amber[300],
                border: Border.all(width: 0.5),
                borderRadius: BorderRadius.circular(30),
              ),
              child: FlatButton(
                onPressed: _onSubmitted,
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
