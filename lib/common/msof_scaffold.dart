import 'package:flutter/material.dart';

import 'msof_appbar.dart';
import 'msof_footer.dart';

class MSOFScaffold extends StatelessWidget {
  final List<Widget> children;

  MSOFScaffold({
    List<Widget>? children,
  }) : children = children ?? [];

  @override
  Widget build(BuildContext context) {
    // Footer 삽입

    return Scaffold(
      // appBar: MSOFAppBar('MutstackOverflow'),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            SingleChildScrollView(
              child: Container(
                child: Column(
                  children: [
                    MSOFAppBar('MutstackOverflow'),
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
