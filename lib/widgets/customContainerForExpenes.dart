import 'package:flutter/material.dart';

class CustomContainer extends StatefulWidget {
  CustomContainer({required this.text, required this.icon});

  final Text text;
  final ImageIcon icon;

  @override
  State<CustomContainer> createState() => _CustomContainerState();
}

class _CustomContainerState extends State<CustomContainer> {
//  List<Widget> makeButtons(int num, List<Widget> child
//       List<Function> onPresses) {
//     List<Widget> CustomContainer = new List();
//     for (int i = 0; i < num; i++) {
//       buttons.add(CustomContainer(children[i], onPresses[i]));
//     }
//     return buttons;
//   }

  var isSelected = false;
  late Color color;
  var selectedText = "";

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          setState(() {
            isSelected = !isSelected;
            //  for
            if (isSelected == true) {
              print("isSelected");
              print(widget.text.data);
              selectedText = widget.text.data!;
              print("text / ${selectedText}");
            }
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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [widget.text, SizedBox(width: 10), widget.icon],
            )));
  }
}
