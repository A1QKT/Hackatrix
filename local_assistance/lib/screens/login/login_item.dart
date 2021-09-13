import 'package:flutter/material.dart';

class LoginItem extends StatefulWidget {
  @override
  _LoginItemState createState() => _LoginItemState();
}

class _LoginItemState extends State<LoginItem> {
  @override
  Widget build(BuildContext context) {
    var userName = TextEditingController();
    var passWord = TextEditingController();
    bool _passWordVisible = true;
    return Container(
      child: Column(
        children: [
          Flexible(
            fit: FlexFit.tight,
            child: Image.asset("logo/Local Assitance-logos_white.png"),
          ),
          ListTile(
            leading: Icon(Icons.g_mobiledata),
            title: Text("Sign in with google"),
          ),
          SizedBox(
            height: 4.0,
          ),
          ListTile(
            leading: Icon(Icons.g_mobiledata),
            title: Text("Sign in with face bool"),
          ),
          SizedBox(
            height: 4.0,
          ),
          TextFormField(
            onSaved: (string) {
              print(userName);
            },
            controller: userName,
            obscureText: false,
            decoration: InputDecoration(
                contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                hintText: "UserName",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(32.0))),
          ),
          SizedBox(
            height: 4.0,
          ),
          TextFormField(
            controller: passWord,
            obscureText: _passWordVisible,
            decoration: InputDecoration(
                contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                hintText: "PassWord",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(32.0))),
          ),
          FlatButton(
            onPressed: () {},
            child: Text("Sign Up Now!"),
          ),
        ],
      ),
    );
  }
}
