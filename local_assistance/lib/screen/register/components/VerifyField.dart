import 'package:flutter/material.dart';
import './TextFieldContainer.dart';

class VerifyField extends StatefulWidget {
  const VerifyField({
    Key key,
    @required TextEditingController verifyPasswordController,
    @required FocusNode verifyPasswordFocusNode,
    @required TextEditingController passwordController,
  })  : _verifyPasswordController = verifyPasswordController,
        _verifyPasswordFocusNode = verifyPasswordFocusNode,
        _passwordController = passwordController,
        super(key: key);

  final TextEditingController _verifyPasswordController;
  final FocusNode _verifyPasswordFocusNode;
  final TextEditingController _passwordController;

  @override
  _VerifyFieldState createState() => _VerifyFieldState();
}

class _VerifyFieldState extends State<VerifyField> {
  bool isObscureText = true;
  void changeObscure() {
    setState(() {
      isObscureText = !isObscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextFormField(
        controller: widget._verifyPasswordController,
        focusNode: widget._verifyPasswordFocusNode,
        obscureText: isObscureText,
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          icon: Icon(Icons.password),
          hintText: 'Vui lòng nhập mật khẩu!',
          labelText: 'Xác nhận mật khẩu',
          border: InputBorder.none,
          suffixIcon: InkWell(
            onTap: changeObscure,
            child: Icon(
              Icons.visibility,
              color: Colors.black87,
            ),
          ),
        ),
        validator: (text) {
          if (text != widget._passwordController.text) {
            return 'Mật khẩu không trùng khớp';
          }
          return null;
        },
      ),
    );
  }
}
