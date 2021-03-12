import 'package:flutter/material.dart';

class SimpleButton extends StatelessWidget {
  final Color backgroundColor;
  final Color textColor;
  final String text;
  final Function onTap;

  const SimpleButton(
      {Key key, this.textColor, this.text, this.onTap, this.backgroundColor})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 150,
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.0),
          color: backgroundColor,
        ),
        child: Center(
          child: Text(
            text,
            style:
                TextStyle(color: textColor, fontFamily: 'Montserrat-Regular'),
          ),
        ),
      ),
    );
  }
}
