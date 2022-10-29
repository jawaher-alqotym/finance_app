/* lib/widgets/floatingButtonChildren.dart */

import 'package:flutter/material.dart';
import 'dart:math';


class FlowMenu extends StatefulWidget {
  const FlowMenu({super.key});

  @override
  State<FlowMenu> createState() => _FlowMenuState();
}

class _FlowMenuState extends State<FlowMenu>
    with SingleTickerProviderStateMixin {
  late AnimationController menuAnimation;
  IconData lastTapped = Icons.notifications;
  final List<IconData> menuItems = <IconData>[
    Icons.attach_money,
    Icons.wallet,
    Icons.add,

  ];

  void _updateMenu(IconData icon) {
    if (icon != Icons.menu) {
      setState(() => lastTapped = icon);
    }
  }

  @override
  void initState() {
    super.initState();
    menuAnimation = AnimationController(
      duration: const Duration(milliseconds: 250),
      vsync: this,
    );
  }

  Widget flowMenuItem(IconData icon) {
    final double buttonDiameter = 60;
    return RawMaterialButton(
        elevation: 0,
        fillColor: Color(0xFF53d259),
        splashColor: Color(0xFF53d259),
        shape: const CircleBorder(),
        constraints: BoxConstraints.tight(Size(buttonDiameter, buttonDiameter)),
        onPressed: () {
          _updateMenu(icon);
          menuAnimation.status == AnimationStatus.completed
              ? menuAnimation.reverse()
              : menuAnimation.forward();
        },
        child: Icon(
          icon,
          color: Color(0xFF33414f),
          size: 30.0,
        ),
    );
  }

  @override
  Widget build(BuildContext context) {

    return Flow(
      delegate: FlowMenuDelegate(menuAnimation: menuAnimation),
      children:
      menuItems.map<Widget>((IconData icon) => flowMenuItem(icon)).toList(),
    );
  }
}

class FlowMenuDelegate extends FlowDelegate {
  FlowMenuDelegate({required this.menuAnimation})
      : super(repaint: menuAnimation);

  final Animation<double> menuAnimation;

  @override
  bool shouldRepaint(FlowMenuDelegate oldDelegate) {
    return menuAnimation != oldDelegate.menuAnimation;
  }

  @override
  void paintChildren(FlowPaintingContext context) {
    final xStart = context.size.width - 165 -  80 ;// 80 is the button size
    final yStart = context.size.height  - 70 - 80 ;



    double dx = 0.0;
    double dy = 0.0;
    final radius = 110 * menuAnimation.value;
    for (int i = 0; i < context.childCount; ++i) {
      final isLastItem = i == context.childCount - 1;
      final setValue = (val) => isLastItem ? 0.0 : val;

      final theta = i * pi * 0.5 / (context.childCount - 1 );
      dx = xStart- setValue(radius * sin(theta));
      dy = yStart -  setValue(radius * cos(theta));

      context.paintChild(
        i,
        transform: Matrix4.translationValues(//665
          dx ,
          dy,
          0,
        ),
      );
    }
  }
}
