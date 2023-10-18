//----------------Azeem code--------------------
import 'package:flutter/material.dart';
class FToast extends StatelessWidget {
   Color? Tcolor;
  String? message;
   FToast({Key? key,
    this.Tcolor,
    this.message,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        // height: 20,
        // width: 20,
        decoration: BoxDecoration(border: Border.all(color: Tcolor!)

        ),
        child: Text(message!),

      ),
    );
  }
}
