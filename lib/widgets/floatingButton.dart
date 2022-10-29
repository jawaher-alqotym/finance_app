/* lib/widgets/floatingButton.dart */

import 'package:flutter/material.dart';
import 'package:finance_app/widgets/floatingButtonChildren.dart';



class FloatingButton extends StatefulWidget {
  const FloatingButton({super.key});

  @override
  State<FloatingButton> createState() => _FloatingButtonState();
}

class _FloatingButtonState extends State<FloatingButton> {
  @override
  Widget build(BuildContext context) {

    return Container(
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [

           Padding(
            padding: const EdgeInsets.only(left: 12.0),
             child: CustomPaint(
               size: Size(360,(370*0.6481481481481481).toDouble()),
              painter: RPSCustomPainter(),
            ),
          ),
           FlowMenu(),

        ],
      ),
      );

  }
  }

class RPSCustomPainter extends CustomPainter{

  @override
  void paint(Canvas canvas, Size size) {



    Paint paint0 = Paint()
      ..color = const Color.fromARGB(255, 255, 255, 255)
      ..style = PaintingStyle.fill
      ..strokeWidth = 1;


    Path path0 = Path();
    path0.moveTo(size.width*0.2043700,size.height*0.4960667);
    path0.cubicTo(size.width*0.2929300,size.height*0.4295471,size.width*0.3861700,size.height*0.2986174,size.width*0.4799900,size.height*0.2946365);
    path0.cubicTo(size.width*0.5753200,size.height*0.2968176,size.width*0.6791450,size.height*0.4458433,size.width*0.7455300,size.height*0.4962455);
    path0.cubicTo(size.width*0.6188800,size.height*0.4995709,size.width*0.5672400,size.height*0.6548033,size.width*0.4836100,size.height*0.6554231);
    path0.cubicTo(size.width*0.4001200,size.height*0.6544100,size.width*0.3584900,size.height*0.4956377,size.width*0.2043700,size.height*0.4960667);
    path0.close();

    canvas.drawPath(path0, paint0);


  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

}






