import 'package:flutter/material.dart';

class CurvePainter extends CustomPainter {
  final Color lineColor;

  CurvePainter(this.lineColor);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = lineColor.withOpacity(0.6)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.5;

    final path1 = Path()
      ..moveTo(0, size.height * 0.3)
      ..quadraticBezierTo(
          size.width * 0.25, size.height * 0.15, size.width * 0.5, size.height * 0.35)
      ..quadraticBezierTo(
          size.width * 0.75, size.height * 0.55, size.width, size.height * 0.4);

    final path2 = Path()
      ..moveTo(0, size.height * 0.5)
      ..quadraticBezierTo(
          size.width * 0.3, size.height * 0.7, size.width * 0.6, size.height * 0.6)
      ..quadraticBezierTo(
          size.width * 0.9, size.height * 0.5, size.width, size.height * 0.7);

    final path3 = Path()
      ..moveTo(0, size.height * 0.8)
      ..quadraticBezierTo(
          size.width * 0.3, size.height, size.width * 0.7, size.height * 0.9)
      ..quadraticBezierTo(
          size.width * 1.0, size.height * 0.8, size.width, size.height);

    canvas.drawPath(path1, paint);
    canvas.drawPath(path2, paint..strokeWidth = 1.0..color = lineColor.withOpacity(0.4));
    canvas.drawPath(path3, paint..strokeWidth = 0.8..color = lineColor.withOpacity(0.3));
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

