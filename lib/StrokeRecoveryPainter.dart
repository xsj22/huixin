import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StrokeRecoveryPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    // 根据SVG路径大致换算坐标，做简单缩放适配
    final scaleX = size.width / 342.43;
    final scaleY = size.height / 408.77;

    // 路径1
    final path1 = Path()
      ..moveTo(0.94 * scaleX, 181.37 * scaleY)
      ..cubicTo(7.6 * scaleX, 201.2 * scaleY, 33.22 * scaleX, 243.33 * scaleY, 81.93 * scaleX, 254.87 * scaleY)
      ..cubicTo(138.94 * scaleX, 268.37 * scaleY, 140.94 * scaleX, 363.87 * scaleY, 52.93 * scaleX, 407.87 * scaleY);
    canvas.drawPath(path1, paint);

    // 路径2
    final path2 = Path()
      ..moveTo(73.93 * scaleX, 0.87 * scaleY)
      ..cubicTo(29.94 * scaleX, 50.37 * scaleY, -15.57 * scaleX, 162.44 * scaleY, 154.94 * scaleX, 212.87 * scaleY)
      ..cubicTo(261.44 * scaleX, 244.37 * scaleY, 250.44 * scaleX, 354.37 * scaleY, 237.44 * scaleX, 406.87 * scaleY);
    canvas.drawPath(path2, paint);

    // 路径3
    final path3 = Path()
      ..moveTo(131.44 * scaleX, 0.87 * scaleY)
      ..cubicTo(92.43 * scaleX, 45.37 * scaleY, 65.93 * scaleX, 143.37 * scaleY, 200.44 * scaleX, 201.87 * scaleY)
      ..cubicTo(334.94 * scaleX, 260.37 * scaleY, 330.94 * scaleX, 342.37 * scaleY, 332.94 * scaleX, 364.37 * scaleY);
    canvas.drawPath(path3, paint);

    // 路径4
    final path4 = Path()
      ..moveTo(214.44 * scaleX, 4.87 * scaleY)
      ..cubicTo(165.44 * scaleX, 15.87 * scaleY, 118.94 * scaleX, 113.87 * scaleY, 223.94 * scaleX, 124.37 * scaleY)
      ..cubicTo(313.31 * scaleX, 133.31 * scaleY, 332.94 * scaleX, 179.87 * scaleY, 341.44 * scaleX, 222.87 * scaleY);
    canvas.drawPath(path4, paint);

    // 路径5
    final path5 = Path()
      ..moveTo(267.94 * scaleX, 0.87 * scaleY)
      ..cubicTo(212.44 * scaleX, 31.87 * scaleY, 228.94 * scaleX, 142.87 * scaleY, 333.94 * scaleX, 78.87 * scaleY);
    canvas.drawPath(path5, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
