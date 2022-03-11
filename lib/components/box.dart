import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Box extends StatelessWidget {
  const Box(
      {Key? key,
      required this.child,
      this.minHeight,
      this.padding,
      this.radius})
      : super(key: key);

  final Widget child;
  final double? minHeight;
  final double? padding;
  final double? radius;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.only(
          topRight:
              radius != null ? Radius.circular(radius!) : Radius.circular(0),
          topLeft:
              radius != null ? Radius.circular(radius!) : Radius.circular(0),
        ),
      ),
      child: Container(
        constraints: BoxConstraints(
          minHeight: minHeight != null ? minHeight! : 0,
        ),
        margin: EdgeInsets.only(top: 3, left: 3, right: 3),
        padding: EdgeInsets.only(bottom: padding != null ? padding! : 0),
        decoration: BoxDecoration(
          color: Color(0xFFE9E9E9),
          borderRadius: BorderRadius.only(
            topRight:
                radius != null ? Radius.circular(radius!) : Radius.circular(0),
            topLeft:
                radius != null ? Radius.circular(radius!) : Radius.circular(0),
          ),
        ),
        child: child,
      ),
    );
  }
}
