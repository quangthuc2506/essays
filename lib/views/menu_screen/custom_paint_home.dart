import 'package:flutter/material.dart';

class CustomPaintHome extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xff95ae45)
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round ;
    final path = Path();
    path.moveTo(0, size.height);
    path.lineTo(size.width+50,size.height);
    
    canvas.drawPath(path, paint);

    // var paint = Paint()
    //   ..color = Colors.red
    //   ..strokeWidth = 5
    //   ..strokeCap = StrokeCap.round;
    // Offset startingPoint = const Offset(0, 100);
    // Offset endingPoint = const Offset(0, 100);
    // canvas.drawLine(startingPoint, endingPoint, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
