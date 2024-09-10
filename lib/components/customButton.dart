
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Function() onTap;
  final IconData icon;
  final Color iconColor;
  const CustomButton(
      {super.key,
        required this.onTap,
        required this.icon,
        required this.iconColor});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Ink(
        width: 50,
        height: 50,
        decoration: const BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [Colors.yellow, Colors.green])),
        child: InkWell(
          onTap: () => onTap(),
          splashColor: Colors.red,
          customBorder: const CircleBorder(),
          child: Center(
            child: Icon(
              icon,
              color: iconColor,
            ),
          ),
        ),
      ),
    );
  }
}


class CustomButtonGesture extends StatelessWidget {
  final Function() onTap;
  //final Function() onDoubleTap;
  final String text;

  const CustomButtonGesture({
    super.key,
    required this.onTap,
    // required this.onDoubleTap,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      onDoubleTap: () => onDoubleTap(),
      onLongPress: () => onLongPress(),
      onLongPressStart: (details) => onLongPressStart(details),
      onLongPressEnd: (details) => onLongPressEnd(details),
      child: Container(
        height: 60,
        width: 100,
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(15)),
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [Colors.orange, Colors.lightBlue])),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(text,style: const TextStyle(fontWeight: FontWeight.bold)),
          ),
        ),
      ),
    );
  }

  onDoubleTap() {}
}
onLongPress() {
  print('Long press');
}

onLongPressStart(LongPressStartDetails details) {
  print({'long press started',details.globalPosition,details.localPosition});
}
onLongPressEnd(LongPressEndDetails details) {
  print({'long press ended',details.globalPosition,details.localPosition});
}
