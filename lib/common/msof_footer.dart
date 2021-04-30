import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../utils/launch_url.dart';
import '../color.dart';
import '../constants.dart';
import 'responsive_container.dart';

class MSOFFooter extends StatelessWidget {
  Widget _buildSocialIcons() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SelectableText(
          'Social accounts',
          style: TextStyle(
            color: blueGray300,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            for (final item in socialAccounts)
              IconButton(
                color: Colors.white,
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
        color: blueGray300,
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
                style: TextStyle(
                  color: blueGray300,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 5),
              SelectableText(
                '${item.value}',
                style: TextStyle(
                  height: 1,
                  color: Colors.white,
                  fontSize: 14,
                ),
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
          color: Colors.blueGrey,
          width: double.maxFinite,
          height: 1,
        ),
        SizedBox(height: 20),
        _buildInformation(),
        SizedBox(height: 20),
        Container(
          color: Colors.blueGrey,
          width: double.maxFinite,
          height: 1,
        ),
        SizedBox(height: 20),
        SelectableText(
          'COPYRIGHT © 2021 KOOKMIN-LIKELION.',
          style: TextStyle(
            color: blueGray300,
            fontSize: 14,
          ),
        ),
      ],
    );
  }

  Widget _buildFooter() {
    return Column(
      children: [
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildSocialIcons(),
            Container(
              color: Colors.blueGrey,
              width: 2,
              height: 100,
              margin: const EdgeInsets.symmetric(horizontal: 20),
            ),
            _buildInformation(),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            color: Colors.blueGrey,
            width: double.maxFinite,
            height: 1,
          ),
        ),
        SizedBox(height: 20),
        _buildCopyRight(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: TextStyle(
        color: Colors.white,
        fontSize: 14,
      ),
      child: Container(
        color: Colors.black,
        padding: EdgeInsets.all(30),
        child: ResponsiveContainer.isSmallScreen(context)
            ? _buildSmallFooter()
            : _buildFooter(),
      ),
    );
  }
}
