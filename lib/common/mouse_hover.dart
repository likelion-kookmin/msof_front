import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class MouseHover extends StatefulWidget {
  final Widget child;
  final bool opacityAnimation;

  const MouseHover({
    Key? key,
    required this.child,
    this.opacityAnimation = true,
  }) : super(key: key);

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
      child: widget.opacityAnimation
          ? AnimatedOpacity(
              opacity: _hover ? 1.0 : 0.5,
              duration: const Duration(milliseconds: 200),
              child: widget.child,
            )
          : widget.child,
    );
  }
}
