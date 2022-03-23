import 'package:flutter/material.dart';

class NPDefaultButton extends StatefulWidget {
  final VoidCallback onPressed;
  final Widget child;
  final Duration bounceDuration;

  const NPDefaultButton(
      {Key key, @required this.onPressed, this.child, this.bounceDuration})
      : super(key: key);

  @override
  _NPDefaultButtonState createState() => _NPDefaultButtonState();
}

class _NPDefaultButtonState extends State<NPDefaultButton> {
  bool isEnableClick = true;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        hoverColor: Colors.transparent,
        onTap: () {
          if (isEnableClick) widget.onPressed();
          setState(() {
            isEnableClick = false;
          });
          Future.delayed(Duration(milliseconds: 300), () {
            if (mounted) {
              setState(() {
                isEnableClick = true;
              });
            }
          });
        },
        child: widget.child,
      ),
    );
  }
}
