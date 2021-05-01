import 'package:flutter/material.dart';
import 'package:msof_front/common/divider.dart';
import 'package:msof_front/common/msof_menu.dart';
import 'package:msof_front/constants.dart';
import 'package:msof_front/utils/screen_size_util.dart';

import 'msof_appbar.dart';
import 'msof_footer.dart';

class MSOFScaffold extends StatelessWidget {
  final List<Widget> children;

  MSOFScaffold({
    List<Widget>? children,
  }) : children = children ?? [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: ScreenSizeUtil.overDesktop(context),
      endDrawer: MSOFMenu.getMobileMenu(context),
      endDrawerEnableOpenDragGesture: ScreenSizeUtil.onlyMobile(context),
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            SingleChildScrollView(
              child: Container(
                child: Column(
                  children: [
                    MSOFAppBar(
                      appBarTitle,
                      actions: MSOFMenu.getMenu(context),
                    ),
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
