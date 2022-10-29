import 'package:flutter/material.dart';

class SavingWidget extends StatefulWidget {
  SavingWidget({required this.child});
  final Widget child;
  @override
  State<SavingWidget> createState() => _SavingWidgetState();
}

class _SavingWidgetState extends State<SavingWidget> {
  var isSelected = true;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isSelected = !isSelected;
        });
      },
      child: Container(
        margin: EdgeInsets.only(left: 5, right: 5, top: 50),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: isSelected
              ? Color.fromRGBO(51, 64, 79, 0.5)
              : Color.fromRGBO(51, 64, 79, 1),
        ),
        height: 44,
        width: 44,
        padding: EdgeInsets.only(top: 15, left: 10),
        child: widget.child,
      ),
    );
  }
}
