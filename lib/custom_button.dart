import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  String title;
  Color? txtColor;
  BoxShape? btnShape;
  Gradient? btnGradColor;
  Color? btnColor;
  double btnElevation;
  Function onTap;
  bool isLoading = false;
  bool isSuccess = false;
  CustomButton({Key? key,
    required this.title,
    required this.onTap,
    this.txtColor,
    this.btnElevation = 0.0,
    this.btnShape,
    this.btnGradColor,
    this.btnColor,
    required this.isLoading,
    required this.isSuccess,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap.call();
      },
      child: Card(
        elevation: btnElevation,
        child: Container(
          width: double.infinity,
          height: btnShape == BoxShape.circle ? 80 : 50,
          decoration: BoxDecoration(
            // border: Border.all(width: 5, color: Colors.deepOrangeAccent),
            borderRadius: btnShape == null
                || btnShape != BoxShape.circle
                ? BorderRadius.circular(5)
                : null,
            shape: btnShape ?? BoxShape.rectangle,
            color: btnGradColor == null
                ? btnColor ?? Colors.blue
                : null,
            gradient: btnGradColor,
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: isLoading
                  ? const CircularProgressIndicator(
                color: Colors.white,)
                  : isSuccess
                  ? const Icon(Icons.done, color: Colors.white,)
                  : Text(title,
                style: TextStyle(
                    color: txtColor ?? Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 17
                ),),
            ),
          ),
        ),
      ),
    );
  }
}
