import 'dart:math';

import 'package:flutter/material.dart';



class CustomButton extends StatelessWidget {
  final String title;
  final Color? txtColor;
  final BoxShape? btnShape;
  final Gradient? btnGradColor;
  final Color? btnColor;
  final double? btnElevation;
  final Function onTap;
  bool isLoading = false;
  bool isSuccess = false;
  int shapePath;
  final bool? isHexagonal;
  CustomButton({Key? key,
    required this.title,
    required this.onTap,
    this.txtColor,
    this.btnElevation,
    this.btnShape,
    this.btnGradColor,
    this.btnColor,
    required this.isLoading,
    required this.isSuccess,
    this.isHexagonal = false,
    this.shapePath = 6,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Color> successColor = [
      Colors.green,
      Colors.green,
    ];
    List<Color> loadingColor = [
      Colors.grey.shade400,
      Colors.grey.shade400,
    ];
    return GestureDetector(
      onTap: () {
        onTap.call();
      },
      child: CustomPaint(
        painter: isHexagonal! ? HexagonalPainter(
            gradientColors: btnGradColor
                ?? LinearGradient(colors: isLoading
                    ? loadingColor : successColor),
        shapeEdge: shapePath) : null,
        child: Card(
          color: isHexagonal! ? Colors.transparent : null,
          shadowColor: Colors.green.shade900,
          elevation: isHexagonal! ? 0.0 : (btnElevation ?? 0.0),
          child: Container(
            width: double.infinity,
            height: btnShape == BoxShape.circle ? 80 : 50,
            decoration: isHexagonal! ? null : BoxDecoration(
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
      ),
    );
  }
}


class HexagonalPainter extends CustomPainter {
  final Gradient? gradientColors;
  final int? shapeEdge;

  HexagonalPainter({this.gradientColors, this.shapeEdge = 6});

  @override
  void paint(Canvas canvas, Size size) {
    double width = size.width;
    double height = size.height;

    final paint = Paint()
      // ..color = Colors.deepOrange
      ..shader = gradientColors?.createShader(
        Rect.fromPoints(Offset(0, 0), Offset(width, height)))
      ..style = PaintingStyle.fill;

    final double radius = size.width / 6;
    final double centerX = size.width / 2;
    final double centerY = size.height / 2;

    double angle = 360 / shapeEdge!; // 360 degrees divided by 6 sides

    Path path = Path();

    for (int i = 0; i < 6; i++) {
      final double x = centerX + radius * cos(degToRad(i * angle));
      final double y = centerY + radius * sin(degToRad(i * angle));
      if (i == 0) {
        path.moveTo(x, y);
      } else {
        path.lineTo(x, y);
      }
    }

    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }

  double degToRad(double degrees) {
    return degrees * (pi / 180);
  }}

