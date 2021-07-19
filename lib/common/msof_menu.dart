import 'package:flutter/material.dart';
import 'package:msof_front/color.dart';
import 'package:msof_front/common/divider.dart';
import 'package:msof_front/routes.dart';
import 'package:msof_front/utils/screen_size_util.dart';

class MSOFMenu {
  static List<Widget> getMenu(BuildContext context, bool isAuthenticated) {
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
        : Routes.getRouteInfosByIsAuthenticated(isAuthenticated).map((item) {
            return (item.type == RouteType.category)
                ? divider
                : TextButton(
                    onPressed: () => Routes.toNamed(context, item.route!),
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      primary: likelionOrange,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 25, vertical: 25),
                      shape: CircleBorder(),
                    ),
                    child: Text(
                      item.title,
                      style: TextStyle(
                        fontSize: 14,
                        color: textColor,
                        letterSpacing: 1,
                      ),
                    ),
                  );
          }).toList();
  }

  static Widget getMobileMenu(bool isAuthenticated) {
    return MSOFMobileMenu(isAuthenticated);
  }
}

class MSOFMobileMenu extends StatelessWidget {
  final bool isAuthenticated;

  MSOFMobileMenu(this.isAuthenticated);

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

  Widget _buildDrawerItem(BuildContext context, RouteInfo item) {
    return (item.type == RouteType.category)
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              divider,
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Text(
                  item.title,
                  style: TextStyle(color: Colors.black54, fontSize: 12),
                ),
              ),
            ],
          )
        : ListTile(
            title: Text(item.title),
            onTap: () => Routes.toNamed(context, item.route!),
          );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          _buildDrawerHeader(),
          ...Routes.getRouteInfosByIsAuthenticated(isAuthenticated)
              .map((item) => _buildDrawerItem(context, item)),
        ],
      ),
    );
  }
}
