import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';

class MouseHover extends StatefulWidget {
  final Widget child;

  const MouseHover({Key? key, required this.child}) : super(key: key);

  @override
  _MouseHoverState createState() => _MouseHoverState();
}

class _MouseHoverState extends State<MouseHover> {
  bool _hover = false;

  void hover(bool hover) {
    setState(() {
      _hover = hover;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (e) => hover(true),
      onExit: (e) => hover(false),
      cursor: SystemMouseCursors.click,
      child: AnimatedOpacity(
        opacity: _hover ? 1.0 : 0.5,
        duration: const Duration(milliseconds: 200),
        child: widget.child,
      ),
    );
  }
}
