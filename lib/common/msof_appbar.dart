import 'package:flutter/material.dart';
import 'package:msof_front/color.dart';
import 'package:msof_front/common/divider.dart';
import 'package:msof_front/routes.dart';

class MSOFAppBar extends StatelessWidget with PreferredSizeWidget {
  @override
  final Size preferredSize;

  final String title;

  MSOFAppBar(this.title) : preferredSize = Size.fromHeight(50.0);

  Widget _buildButton(BuildContext context, String label, String route) {
    return TextButton(
      onPressed: () => Navigator.pushNamed(context, route),
      style: TextButton.styleFrom(
        backgroundColor: Colors.transparent,
        primary: likelionOrange,
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 14,
          color: textColor,
          letterSpacing: 1,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
          child: Row(
            children: <Widget>[
              GestureDetector(
                onTap: () => Navigator.popUntil(
                    context, ModalRoute.withName(Navigator.defaultRouteName)),
                child: Text(
                  title,
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 30,
                    letterSpacing: 3,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Flexible(
                child: Container(
                  alignment: Alignment.centerRight,
                  child: Wrap(
                    children: <Widget>[
                      _buildButton(context, 'Home', Routes.home),
                      _buildButton(context, 'Home', Routes.home),
                      _buildButton(context, 'Home', Routes.home),
                      _buildButton(context, 'Home', Routes.home),
                      _buildButton(context, 'Home', Routes.home),
                      _buildButton(context, 'Home', Routes.home),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        divider,
        SizedBox(height: 30),
      ],
    );
    // AppBar(
    //   title: Text(
    //     title,
    //     style: TextStyle(
    //       color: Colors.white,
    //     ),
    //   ),
    //   backgroundColor: Colors.black,
    //   automaticallyImplyLeading: true,
    // );
  }
}
