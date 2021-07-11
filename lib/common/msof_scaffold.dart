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

class MSOFScaffold extends StatelessWidget {
  final List<Widget> children;

  MSOFScaffold({
    List<Widget>? children,
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: ScreenSizeUtil.overDesktop(context),
      endDrawer: _buildEndDrawer(),
      endDrawerEnableOpenDragGesture: ScreenSizeUtil.onlyMobile(context),
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            SingleChildScrollView(
              child: Container(
                child: Column(
                  children: [
                    _buildAppBar(),
                    divider,
                    SizedBox(height: 30),
                    ...children,
                    MSOFFooter(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
