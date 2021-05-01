import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:msof_front/common/mouse_hover.dart';
import 'package:msof_front/routes.dart';
import 'package:msof_front/utils/screen_size_util.dart';

class MSOFAppBar extends StatelessWidget with PreferredSizeWidget {
  @override
  final Size preferredSize;

  final String title;

  final List<Widget> actions;

  MSOFAppBar(
    this.title, {
    this.actions = const [],
  }) : preferredSize = Size.fromHeight(kToolbarHeight);

  Widget _buildTitle(BuildContext context) {
    return MouseHover(
      opacityAnimation: false,
      child: GestureDetector(
        onTap: () => Navigator.pushNamed(context, Routes.home),
        child: AutoSizeText(
          title,
          maxLines: 1,
          style: TextStyle(
            color: Colors.black87,
            fontSize: 30,
            letterSpacing: 3,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      toolbarHeight: kToolbarHeight,
      backgroundColor: Colors.white,
      centerTitle: ScreenSizeUtil.onlyMobile(context),
      automaticallyImplyLeading: ScreenSizeUtil.onlyMobile(context),
      title: _buildTitle(context),
      actions: actions,
    );
  }
}
