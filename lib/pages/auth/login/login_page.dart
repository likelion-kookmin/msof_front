import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:msof_front/color.dart';
import 'package:msof_front/common/loading.dart';
import 'package:msof_front/common/msof_scaffold.dart';
import 'package:msof_front/pages/auth/login/login_viewmodel.dart';
import 'package:msof_front/routes.dart';
import 'package:msof_front/utils/screen_size_util.dart';

import '../widgets/widgets.dart';
import '../validation_mixin.dart';

class LoginPage extends HookWidget with ValidationMixin {
  final title = 'Sign in';

  Widget _buildSignInButton(VoidCallback onPressed) {
    final loginViewModel = useContext().read(loginViewModelProvider);
    return SizedBox(
      width: double.infinity,
      height: 40,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: likelionOrange,
        ),
        onPressed: !loginViewModel.isLoading ? onPressed : null,
        child: !loginViewModel.isLoading
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
  }

  Widget _buildErrorMsg() {
    final loginViewModel = useContext().read(loginViewModelProvider);
    return StreamBuilder(
      stream: loginViewModel.errorMsgStream,
      builder: (context, AsyncSnapshot<String> snapshot) {
        if (snapshot.hasData) {
          return ErrorMsg(snapshot.data ?? '');
        }
        return SizedBox();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final formKey = useMemoized(() => GlobalKey<FormState>());
    final usernameController = useTextEditingController();
    final passwordController = useTextEditingController();
    final focusNode = useFocusNode();

    final loginViewModel = useProvider(loginViewModelProvider);

    void signInOnPressed() {
      if (formKey.currentState!.validate()) {
        loginViewModel
            .login(
              usernameController.text,
              passwordController.text,
            )
            .then(
              (_) => Routes.toNamed(
                context,
                Routes.initial,
              ),
            );
      }
    }

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
                    PasswordField(
                      controller: passwordController,
                      autofocus: true,
                      validator: validatePassword,
                      focusNode: focusNode,
                      inputFormatters: [trimInputFormatter],
                    ),
                    SizedBox(height: 25),
                    _buildSignInButton(signInOnPressed),
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
