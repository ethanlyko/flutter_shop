import 'package:flutter/material.dart';

class MyCustomButton extends StatefulWidget {
  final VoidCallback onPressed;
  final double height;
  final String text;
  final Color backgroundColor;
  final TextStyle? textStyle;
  final BorderSide? borderSide;

  const MyCustomButton({
    required this.text,
    required this.onPressed,
    this.height = 50,
    this.backgroundColor = Colors.transparent,
    this.textStyle,
    this.borderSide,
    super.key,
  });

  @override
  State<MyCustomButton> createState() => _MyCustomButtonState();
}

class _MyCustomButtonState extends State<MyCustomButton> {
  @override
  Widget build(BuildContext context) {
    Widget w;

    w = SizedBox(
      height: widget.height,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: widget.backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
            side: (widget.borderSide != null)
                ? widget.borderSide!
                : BorderSide.none,
          ),
        ),
        onPressed: widget.onPressed,
        child: Text(
          widget.text,
          style: widget.textStyle,
        ),
      ),
    );

    return w;
  }
}
