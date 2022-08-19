import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback onClicked;

  const ButtonWidget({
    Key? key,
    required this.text,
    required this.onClicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(27)
          ),
          elevation: 0,
          primary: Colors.green.shade100,
          minimumSize: Size.fromHeight(50),
          
        ),
        child: FittedBox(
          child: Text(
            text,
            style: TextStyle(fontSize: 20, color: Colors.green.shade900),
          ),
        ),
        onPressed: onClicked,
      );
}
