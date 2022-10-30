import 'package:flutter/material.dart';

class CustomContainer extends StatefulWidget {
  CustomContainer({required this.child});
  final Widget child;

  @override
  State<CustomContainer> createState() => _CustomContainerState();
}

class _CustomContainerState extends State<CustomContainer> {
  var isSelected = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          setState(() {
            isSelected = !isSelected;
          });
        },
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              color: isSelected
                  ? Color.fromRGBO(83, 210, 88, 1)
                  : Color.fromRGBO(51, 64, 79, 1)),
          height: 91,
          width: 156,
          padding: EdgeInsets.all(12),
          child: widget.child,
        ));
  }
}
