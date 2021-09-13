import 'package:flutter/material.dart';
import './TextFieldContainer.dart';
import 'package:form_field_validator/form_field_validator.dart';

class PasswordField extends StatefulWidget {
  const PasswordField({
    Key key,
    @required TextEditingController passwordController,
    @required FocusNode passwordFocusNode,
    @required FocusNode verifyPasswordFocusNode,
  })  : _passwordController = passwordController,
        _passwordFocusNode = passwordFocusNode,
        _verifyPasswordFocusNode = verifyPasswordFocusNode,
        super(key: key);

  final TextEditingController _passwordController;
  final FocusNode _passwordFocusNode;
  final FocusNode _verifyPasswordFocusNode;

  @override
  _PasswordFieldState createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
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
        controller: widget._passwordController,
        focusNode: widget._passwordFocusNode,
        onFieldSubmitted: (_) {
          FocusScope.of(context).requestFocus(widget._verifyPasswordFocusNode);
        },
        obscureText: isObscureText,
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          icon: Icon(Icons.password),
          hintText: 'Vui lòng nhập mật khẩu!',
          labelText: 'Mật khẩu',
          border: InputBorder.none,
          suffixIcon: InkWell(
            onTap: changeObscure,
            child: Icon(
              Icons.visibility,
              color: Colors.black87,
            ),
          ),
        ),
        validator: passwordValidator(),
      ),
    );
  }
}

MultiValidator passwordValidator() {
  return MultiValidator([
    RequiredValidator(errorText: 'Yêu cầu nhập mật khẩu'),
    MinLengthValidator(8, errorText: 'Mật khẩu gồm ít nhất 6 ký tự '),
    PatternValidator(r'(?=.*?[#?!@$%^&*-])',
        errorText: 'Mật khẩu bắt buộc có ít nhất một ký tự đặc biệt'),
    PatternValidator('[0-9]',
        errorText: 'Mật khẩu bắt buộc có ít nhất một chữ số'),
    PatternValidator('[A-Z]',
        errorText: 'Mật khẩu bắt buộc có ít nhất một chữ số'),
  ]);
}
