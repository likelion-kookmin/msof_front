import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:msof_front/common/divider.dart';

import '../utils/launch_url.dart';
import '../color.dart';
import '../constants.dart';
import 'responsive_container.dart';

class MSOFFooter extends StatelessWidget {
  final footerGroupTextStyle = TextStyle(
    color: textColor,
    fontSize: 18,
    fontWeight: FontWeight.bold,
  );

  final footerContentTextStyle = TextStyle(
    color: textColor,
    fontSize: 14,
    fontWeight: FontWeight.w500,
  );

  Widget _buildSocialIcons() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SelectableText(
          'Social accounts',
          style: footerGroupTextStyle,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            for (final item in socialAccounts)
              IconButton(
                color: textColor,
                padding: const EdgeInsets.all(10),
                icon: FaIcon(item.icon, size: 30),
                onPressed: () {
                  launchURL(item.value);
                },
              ),
          ],
        ),
      ],
    );
  }

  Widget _buildCopyRight() {
    return SelectableText(
      'COPYRIGHT © 2021 KOOKMIN-LIKELION.',
      style: TextStyle(
        color: textColor,
        fontSize: 14,
      ),
    );
  }

  Widget _buildInformation() {
    return Column(
      children: [
        for (final item in contactUs)
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SelectableText(
                '${item.name[0].toUpperCase()}${item.name.substring(1)}',
                style: footerGroupTextStyle,
              ),
              SizedBox(height: 5),
              SelectableText(
                '${item.value}',
                style: footerContentTextStyle,
              ),
              SizedBox(height: 15)
            ],
          ),
      ],
    );
  }

  Widget _buildSmallFooter() {
    return Column(
      children: [
        _buildSocialIcons(),
        SizedBox(height: 20),
        Container(
          color: textColor,
          width: double.maxFinite,
          height: 1,
        ),
        SizedBox(height: 20),
        _buildInformation(),
        SizedBox(height: 20),
        Container(
          color: textColor,
          width: double.maxFinite,
          height: 1,
        ),
        SizedBox(height: 20),
        SelectableText(
          'COPYRIGHT © 2021 KOOKMIN-LIKELION.',
          style: TextStyle(
            color: textColor,
            fontSize: 14,
          ),
        ),
      ],
    );
  }

  Widget _buildFooter() {
    return Column(
      children: [
        divider,
        SizedBox(height: 20),
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildSocialIcons(),
            SizedBox(width: 40),
            _buildInformation(),
          ],
        ),
        divider,
        SizedBox(height: 20),
        _buildCopyRight(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor,
      padding: EdgeInsets.all(30),
      child: ResponsiveContainer.isSmallScreen(context)
          ? _buildSmallFooter()
          : _buildFooter(),
    );
  }
}
