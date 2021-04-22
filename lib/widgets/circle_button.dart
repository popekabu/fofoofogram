import 'package:flutter/material.dart';

class CircleButton extends StatelessWidget {
  final IconData icon;
  final double iconSize;
  final Function onPressed;
  final Color color;

  const CircleButton({
    Key key, 
    @required this.icon, 
    @required this.iconSize, 
    this.color = Colors.black,
    @required this.onPressed
    }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(6.0),
        child: IconButton(
            icon: Icon(icon),
            onPressed: onPressed,
            iconSize: iconSize,
            color: color));
  }
}
