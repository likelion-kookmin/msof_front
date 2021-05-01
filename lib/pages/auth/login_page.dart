import 'package:flutter/material.dart';
import 'package:msof_front/color.dart';
import 'package:msof_front/common/msof_scaffold.dart';
import 'package:msof_front/utils/screen_size_util.dart';

import 'widgets/widgets.dart';
import 'validation_mixin.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with ValidationMixin {
  final _formKey = GlobalKey<FormState>();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final focusNode = FocusNode();

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MSOFScaffold(
      children: [
        AnimatedContainer(
          duration: Duration(milliseconds: 500),
          padding: ScreenSizeUtil.onlyTouch(context)
              ? EdgeInsets.zero
              : const EdgeInsets.all(30.0),
          child: Center(
            child: Container(
              padding:
                  const EdgeInsets.symmetric(vertical: 30.0, horizontal: 25.0),
              constraints: BoxConstraints(
                maxWidth: 500,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5.0),
              ),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text('Sign in', style: TextStyle(fontSize: 25)),
                    SizedBox(height: 15),
                    UsernameField(
                      controller: usernameController,
                      validator: validateUsername,
                      focusNode: focusNode,
                      inputFormatters: [trimInputFormatter],
                    ),
                    SizedBox(height: 25),
                    PasswordField(
                      controller: passwordController,
                      validator: validatePassword,
                      focusNode: focusNode,
                      inputFormatters: [trimInputFormatter],
                    ),
                    SizedBox(height: 25),
                    SizedBox(
                      width: double.infinity,
                      height: 40,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: likelionOrange,
                        ),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {}
                        },
                        child: Text(
                          'Sign in',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
