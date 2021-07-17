import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:msof_front/common/divider.dart';
import 'package:msof_front/common/msof_menu.dart';
import 'package:msof_front/constants.dart';
import 'package:msof_front/pages/auth_viewmodel.dart';
import 'package:msof_front/utils/screen_size_util.dart';

import 'msof_appbar.dart';
import 'msof_footer.dart';

class MSOFScaffold extends HookWidget {
  final Widget? body;
  final List<Widget> children;
  final double horizontalPaddingFactor;

  MSOFScaffold({
    this.body,
    List<Widget>? children,
    this.horizontalPaddingFactor = 0.3,
  }) : children = children ?? [];

  Widget _buildEndDrawer() {
    return HookBuilder(builder: (context) {
      final authViewModel = useProvider(authViewModelProvider);

      return MSOFMenu.getMobileMenu(authViewModel.isAuthenticated);
    });
  }

  Widget _buildAppBar() {
    return HookBuilder(builder: (context) {
      final authViewModel = useProvider(authViewModelProvider);

      return MSOFAppBar(
        Constants.appBarTitle,
        actions: MSOFMenu.getMenu(context, authViewModel.isAuthenticated),
      );
    });
  }

  Widget _buildChildren() {
    final size = MediaQuery.of(useContext()).size;
    final horizontalPadding = ScreenSizeUtil.onlyTouch(useContext())
        ? const EdgeInsets.symmetric(horizontal: 8)
        : EdgeInsets.symmetric(
            horizontal: size.width * horizontalPaddingFactor / 2,
          );
    return Padding(
      padding: horizontalPadding,
      child: Column(
        children: children,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        extendBodyBehindAppBar: ScreenSizeUtil.overDesktop(context),
        endDrawer: _buildEndDrawer(),
        endDrawerEnableOpenDragGesture: ScreenSizeUtil.onlyMobile(context),
        body: Column(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  _buildAppBar(),
                  divider,
                  SizedBox(height: 30),
                  body ?? _buildChildren(),
                  MSOFFooter(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
