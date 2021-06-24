import 'package:flutter/material.dart';

class line extends StatefulWidget {
  line({Key key}) : super(key: key);

  @override
  _lineState createState() => _lineState();
}

class _lineState extends State<line> {
  final double height = 300;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                  width: MediaQuery.of(context).size.width,
                  height: height,
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  child: CustomPaint(
                    foregroundPainter: LinePainter(),
                  )),
              Container(
                margin: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width / 4,
                    top: MediaQuery.of(context).size.height / 11),
                height: 200,
                width: 200,
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black,
                        blurRadius: 20,
                      )
                    ],
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(100)),
              ),
            ],
          ),
          Container(
            color: Colors.green[200],
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.only(top: 10, bottom: 10),
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.grey[400],
                      borderRadius: BorderRadius.circular(10)),
                  child: TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class LinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..strokeWidth = 2;
    canvas.drawLine(
      Offset(size.width, size.height / 3),
      Offset(size.width / 300, size.height / 2 * 2),
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
