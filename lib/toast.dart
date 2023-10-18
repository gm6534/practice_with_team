import 'package:flutter/material.dart';
class MyButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        showCustomSnackBar(
          context,
          message: 'Custom Snackbar example',
          duration: Duration(seconds: 2),
          backgroundColor: Colors.blue,
          textColor: Colors.white,
        );
      },
      child: Text('Show Custom Snackbar'),
    );
  }
}

void showCustomSnackBar(
    BuildContext context, {
      required String message,
      Duration duration = const Duration(seconds: 2),
      Color backgroundColor = Colors.black54,
      Color textColor = Colors.white,
    }) {
  final scaffoldMessenger = ScaffoldMessenger.of(context);
  final snackBar = SnackBar(
    content: Container(
      color:Colors.redAccent,
      padding: EdgeInsets.all(16),
      child: Text(
        message,
        style: TextStyle(color: textColor),
      ),
    ),
    duration: duration,
  );

  scaffoldMessenger.showSnackBar(snackBar);
}