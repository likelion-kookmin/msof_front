import 'package:flutter/material.dart';
import 'package:msof_front/color.dart';
import 'package:msof_front/common/divider.dart';
import 'package:msof_front/routes.dart';
import 'package:msof_front/utils/screen_size_util.dart';

class MSOFMenuItem {
  final String label;
  final String route;
  bool get divider => label == '' || route == '';

  MSOFMenuItem({required this.label, required this.route});
}

final menuItems = [
  MSOFMenuItem(label: 'Home', route: Routes.home),
  MSOFMenuItem(label: '계정', route: ''),
  MSOFMenuItem(label: 'Sign in', route: Routes.login),
  MSOFMenuItem(label: 'Sign out', route: Routes.login),
  MSOFMenuItem(label: 'Sign up', route: Routes.signup),
];

class MSOFMenu {
  static List<Widget> getMenu(BuildContext context) {
    return ScreenSizeUtil.onlyMobile(context)
        ? [
            Builder(
              builder: (context1) => IconButton(
                icon: Icon(Icons.menu, size: 30), // change this size and style
                onPressed: () => Scaffold.of(context1).openEndDrawer(),
                tooltip:
                    MaterialLocalizations.of(context1).openAppDrawerTooltip,
              ),
            ),
          ]
        : menuItems.map((item) {
            return (item.divider)
                ? divider
                : TextButton(
                    onPressed: () => Navigator.pushNamed(context, item.route),
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      primary: likelionOrange,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 25, vertical: 25),
                      shape: CircleBorder(),
                    ),
                    child: Text(
                      item.label,
                      style: TextStyle(
                        fontSize: 14,
                        color: textColor,
                        letterSpacing: 1,
                      ),
                    ),
                  );
          }).toList();
  }

  static Widget getMobileMenu(BuildContext context) {
    return MSOFMobileMenu();
  }
}

class MSOFMobileMenu extends StatelessWidget {
  Widget _buildDrawerHeader() {
    return Container(
      padding: const EdgeInsets.only(top: 30, left: 20, bottom: 15),
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Text(
        'Menu',
        style: TextStyle(
          color: Colors.black,
          fontSize: 24,
        ),
      ),
    );
  }

  Widget _buildDrawerItem(BuildContext context, MSOFMenuItem item) {
    return (item.divider)
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              divider,
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Text(
                  item.label,
                  style: TextStyle(color: Colors.black54, fontSize: 12),
                ),
              ),
            ],
          )
        : ListTile(
            title: Text(item.label),
            onTap: () => Navigator.pushNamed(context, item.route),
          );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          _buildDrawerHeader(),
          ...menuItems.map((item) => _buildDrawerItem(context, item)),
        ],
      ),
    );
  }
}
