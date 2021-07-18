import 'package:flutter/material.dart';
import 'package:msof_front/utils/hex_color.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:zefyrka/zefyrka.dart';

class TextEditor extends StatelessWidget {
  final ZefyrController controller;
  final FocusNode focusNode;
  final bool readOnly;
  final ScrollController? scrollController;

  const TextEditor({
    Key? key,
    required this.controller,
    required this.focusNode,
    this.readOnly = false,
    this.scrollController,
  }) : super(key: key);

  void _onLaunchUrl(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    }
  }

  @override
  Widget build(BuildContext context) {
    final border = Border.all(color: Colors.grey.shade200);
    final minHeight = MediaQuery.of(context).size.height * 0.4;
    final toolbar = Row(
      children: [
        ZefyrToolbar.basic(controller: controller),
      ],
    );
    return Column(
      children: [
        readOnly
            ? Container()
            : Container(
                decoration: BoxDecoration(
                  color: HexColor('#FAFAFA'),
                  border: border,
                ),
                child: toolbar,
              ),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            border: border,
          ),
          constraints: BoxConstraints(
            minHeight: minHeight,
          ),
          child: ZefyrEditor(
            controller: controller,
            focusNode: focusNode,
            readOnly: readOnly,
            showCursor: !readOnly,
            scrollController: scrollController,
            scrollable: false,
            autofocus: true,
            padding: EdgeInsets.symmetric(horizontal: 8),
            onLaunchUrl: _onLaunchUrl,
          ),
        ),
      ],
    );
  }
}
