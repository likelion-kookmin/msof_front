import 'package:flutter/material.dart';
import 'package:msof_front/common/msof_scaffold.dart';
import 'package:msof_front/pages/home/widgets/main_banner.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MSOFScaffold(
      children: [
        MainBanner(),
        // Carousel(),
      ],
    );
  }
}
