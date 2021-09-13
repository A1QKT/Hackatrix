import 'package:flutter/material.dart';
import './TextFieldContainer.dart';
import 'package:form_field_validator/form_field_validator.dart';

class EmailField extends StatelessWidget {
  const EmailField({
    Key key,
    @required TextEditingController emailController,
    @required FocusNode passwordFocusNode,
  })  : _emailController = emailController,
        _passwordFocusNode = passwordFocusNode,
        super(key: key);

  final TextEditingController _emailController;
  final FocusNode _passwordFocusNode;

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextFormField(
        controller: _emailController,
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
    );
  }
}

MultiValidator emailValidator() {
  return MultiValidator([
    RequiredValidator(errorText: 'Vui lòng nhập email'),
    EmailValidator(errorText: 'Vui lòng nhập email hợp lệ'),
  ]);
}
