import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:msof_front/color.dart';
import 'package:msof_front/common/loading.dart';
import 'package:msof_front/common/msof_scaffold.dart';
import 'package:msof_front/models/user/user.dart';
import 'package:msof_front/pages/auth/signup/signup_viewmodel.dart';
import 'package:msof_front/pages/auth/widgets/email_field.dart';
import 'package:msof_front/utils/screen_size_util.dart';

import '../widgets/widgets.dart';
import '../validation_mixin.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> with ValidationMixin {
  final title = 'Sign up';
  final formKey = GlobalKey<FormState>();
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final passwordConfirmController = TextEditingController();
  final focusNode = FocusNode();

  @override
  void dispose() {
    usernameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    passwordConfirmController.dispose();
    focusNode.dispose();
    super.dispose();
  }

  Widget _buildSignupButton() {
    return HookBuilder(builder: (context) {
      final authViewModel = useProvider(signupViewModelProvider);
      return SizedBox(
        width: double.infinity,
        height: 40,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: likelionOrange,
          ),
          onPressed: !authViewModel.isLoading
              ? () {
                  if (formKey.currentState!.validate()) {
                    authViewModel.signup(
                      UserCreate(
                        username: usernameController.text,
                        email: emailController.text,
                      ),
                      passwordController.text,
                      passwordConfirmController.text,
                    );
                  }
                }
              : null,
          child: !authViewModel.isLoading
              ? Text(
                  title,
                  style: TextStyle(color: Colors.white),
                )
              : SizedBox(
                  width: 30,
                  height: 30,
                  child: Loading(),
                ),
        ),
      );
    });
  }

  Widget _buildErrorMsg() {
    return HookBuilder(builder: (context) {
      final authViewModel = useProvider(signupViewModelProvider);
      return StreamBuilder(
        stream: authViewModel.errorMsgStream,
        builder: (context, AsyncSnapshot<String> snapshot) {
          if (snapshot.hasData) {
            return ErrorMsg(snapshot.data ?? '');
          }
          return SizedBox();
        },
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return MSOFScaffold(
      children: [
        Container(
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
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(title, style: TextStyle(fontSize: 25)),
                    SizedBox(height: 15),
                    UsernameField(
                      controller: usernameController,
                      autofocus: true,
                      validator: validateUsername,
                      inputFormatters: [trimInputFormatter],
                    ),
                    SizedBox(height: 25),
                    EmailField(
                      controller: emailController,
                      autofocus: true,
                      validator: validateEmail,
                      inputFormatters: [trimInputFormatter],
                    ),
                    SizedBox(height: 25),
                    PasswordField(
                      controller: passwordController,
                      autofocus: true,
                      validator: validatePassword,
                      focusNode: focusNode,
                      inputFormatters: [trimInputFormatter],
                    ),
                    SizedBox(height: 25),
                    PasswordConfirmField(
                      controller: passwordConfirmController,
                      autofocus: true,
                      validator: (value) {
                        final result = validatePassword(value);
                        if (result != null) {
                          return result;
                        }
                        if (value != passwordController.text) {
                          return '일치하지 않습니다.';
                        }
                        return null;
                      },
                      focusNode: focusNode,
                      inputFormatters: [trimInputFormatter],
                    ),
                    SizedBox(height: 25),
                    _buildSignupButton(),
                    SizedBox(height: 25),
                    _buildErrorMsg(),
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
