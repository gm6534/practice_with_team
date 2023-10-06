//===================== Azeem Code ===========
//
//
//
// import 'package:flutter/material.dart';
// import 'dart:math';
// class HexagonButton extends StatelessWidget {
//   String title;
//   final double size;
//   Color? txtColor;
//   BoxShape? btnShape;
//   Gradient? btnGradColor;
//   Color? btnColor;
//   double? btnElevation;
//   Function onTap;
//   bool isLoading = false;
//   bool isSuccess = false;
//
//   HexagonButton({ required this.size,
//     required this.title,
//     required this.onTap,
//     this.txtColor,
//     this.btnElevation,
//     this.btnShape,
//     this.btnGradColor,
//     this.btnColor,
//     required this.isLoading,
//     required this.isSuccess,});
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: (){},
//       child: Container(
//
//         child: CustomPaint(
//           size: Size(size, size),
//           painter: HexagonPainter(Colors.cyan),
//         ),
//       ),
//     );
//   }
// }
//
// class HexagonPainter extends CustomPainter {
//   final Color color;
//
//   HexagonPainter(this.color);
//
//   @override
//   void paint(Canvas canvas, Size size) {
//     final Paint paint = Paint()..color = color;
//     final double radius = size.width / 2;
//
//     final double xCenter = radius;
//     final double yCenter = radius;
//
//     final double x1 = xCenter + radius * cos(0);
//     final double y1 = yCenter + radius * sin(0);
//
//     final Path path = Path()
//       ..moveTo(x1, y1);
//
//     for (int i = 1; i <= 6; i++) {
//       final double x = xCenter + radius * cos(2 * pi * i / 6);
//       final double y = yCenter + radius * sin(2 * pi * i / 6);
//       path.lineTo(x, y);
//     }
//
//     path.close();
//
//     canvas.drawPath(path, paint);
//   }
//
//   @override
//   bool shouldRepaint(CustomPainter oldDelegate) {
//     return false;
//   }
// }
import 'package:flutter/material.dart';
import 'dart:math';

class CustomHexagonButton extends StatelessWidget {
  final String title;
  Color? btnColor;
  final  gradientColors;
  final double size;
  Color? txtColor;
  Function onTap;
  bool isLoading = false;
  bool isSuccess = false;

  CustomHexagonButton({
    required this.title,
    required this.gradientColors,
    required this.size,
    this.btnColor,
    this.txtColor,
  required this.onTap,
    required this.isLoading,
    required this.isSuccess,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        onTap.call();
      },
      child: Container(
        // decoration: BoxDecoration(
        //   color: gradientColors == null
        //       ? btnColor ?? Colors.blue
        //       : null,
        //   gradient: gradientColors,
        // ),

          child: CustomPaint(
            size: Size(size, size * sqrt(3) / 2),
            painter: CustomHexagonPainter(gradientColors),
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
    );
  }
}

class CustomHexagonPainter extends CustomPainter {
  final List<Color> gradientColors;

  CustomHexagonPainter(this.gradientColors);

  @override
  void paint(Canvas canvas, Size size) {
    double width = size.width;
    double height = size.height;
    double middleX = width / 2;
    double middleY = height / 2;

    final path = Path()
      ..moveTo(middleX, 0)
      ..lineTo(width, middleY)
      ..lineTo(middleX, height)
      ..lineTo(0, middleY)
      ..close();

    final paint = Paint()
      ..shader = LinearGradient(
        colors: gradientColors,
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ).createShader(Rect.fromPoints(Offset(0, 0), Offset(width, height)));

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}