import 'package:flutter/material.dart';
import 'dart:ui' as ui;
// The half oval top design at the top of insight page

Widget halfOvalWidget(BuildContext context) {
  return Container(
    margin: EdgeInsets.zero,
      child: CustomPaint(
      painter: ShapesPainter(),
  child: Container(height: 160),
  ),
  );
}

const double _kCurveHeight = 35;

class ShapesPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final p = Path();
    p.lineTo(0, size.height - _kCurveHeight);
    p.relativeQuadraticBezierTo(size.width / 2, 2 * _kCurveHeight, size.width, 0);
    p.lineTo(size.width, 0);
    p.close();
    // canvas.drawImage()
    canvas.drawPath(p, Paint()..shader = RadialGradient(
      colors: [
        Color.fromRGBO(57,92,80,1),
        // Color.fromRGBO(83, 210, 88, 1),
        Color.fromRGBO(51, 64, 79, 1),
      ],
    ).createShader(Rect.fromCircle(
      center: Offset(200,-100),
      radius:270,)));

  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}