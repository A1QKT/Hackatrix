import 'package:flutter/material.dart';

class LoginItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var userName = TextEditingController();
    var passWord = TextEditingController();
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
          TextField(
            decoration: InputDecoration(labelText: "UserName"),
            controller: userName,
            onChanged: (string) {
              print(string);
            },
          ),
          SizedBox(
            height: 4.0,
          ),
          TextField(
            decoration: InputDecoration(labelText: "PassWord"),
            controller: passWord,
            onChanged: (string) {
              print(string);
            },
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
