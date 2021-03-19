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
      appBar: MSOFAppBar("MutstackOverflow"),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            constraints: BoxConstraints(
              minHeight: MediaQuery.of(context).size.height,
            ),
            child: Column(
              children: [
                ...children,
                MSOFFooter(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
