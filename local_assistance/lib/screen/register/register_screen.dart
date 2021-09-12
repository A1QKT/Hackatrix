import 'package:flutter/material.dart';
import 'components/TextFieldContainer.dart';
import 'package:form_field_validator/form_field_validator.dart';

class RegisterScreen extends StatelessWidget {
  final _passwordFocusNode = FocusNode();
  final _minorPasswordFocusNode = FocusNode();
  // abc
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: size.height,
        width: double.infinity,
        child: Form(
          autovalidate: true,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFieldContainer(
                child: TextFormField(
                  textInputAction: TextInputAction.next,
                  decoration: const InputDecoration(
                    icon: Icon(Icons.person),
                    hintText: 'Vui lòng nhập email của bạn!',
                    labelText: 'Email',
                    border: InputBorder.none,
                  ),
                  onFieldSubmitted: (_) {
                    FocusScope.of(context).requestFocus(_passwordFocusNode);
                  },
                  validator: emailValidator(),
                ),
              ),
              TextFieldContainer(
                child: TextFormField(
                  focusNode: _passwordFocusNode,
                  onFieldSubmitted: (_) {
                    FocusScope.of(context)
                        .requestFocus(_minorPasswordFocusNode);
                  },
                  obscureText: true,
                  textInputAction: TextInputAction.next,
                  decoration: const InputDecoration(
                    icon: Icon(Icons.password),
                    hintText: 'Vui lòng nhập mật khẩu!',
                    labelText: 'Mật khẩu',
                    border: InputBorder.none,
                    suffixIcon: Icon(
                      Icons.visibility,
                      color: Colors.black87,
                    ),
                  ),
                  validator: passwordValidator(),
                ),
              ),
              TextFieldContainer(
                child: TextFormField(
                  focusNode: _minorPasswordFocusNode,
                  obscureText: true,
                  textInputAction: TextInputAction.next,
                  decoration: const InputDecoration(
                    icon: Icon(Icons.password),
                    hintText: 'Vui lòng nhập mật khẩu!',
                    labelText: 'Xác nhận mật khẩu',
                    border: InputBorder.none,
                    suffixIcon: Icon(
                      Icons.visibility,
                      color: Colors.black87,
                    ),
                  ),
                  validator:
                      RequiredValidator(errorText: 'Yêu cầu nhập mật khẩu'),
                ),
              ),
              InkWell(
                onTap: null,
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  decoration: BoxDecoration(
                    color: Color(0xffcdc3af),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text('Đăng ký'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

MultiValidator emailValidator() {
  return MultiValidator([
    RequiredValidator(errorText: 'Vui lòng nhập email'),
    EmailValidator(errorText: 'Vui lòng nhập email hợp lệ'),
  ]);
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
