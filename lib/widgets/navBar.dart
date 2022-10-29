/* lib/widgets/navbar.dart */

import 'package:flutter/material.dart';
import 'package:finance_app/screens/insight_page.dart';
import 'package:get/get.dart';


class navBar extends StatefulWidget {
  const navBar({super.key});

  @override
  State<navBar> createState() => _navBarState();
}

class _navBarState extends State<navBar> {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Color(0xFF33414f),
      child: Container(
        height: 85.0,
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
              IconButton(
                  iconSize: 90.0,
                  padding: EdgeInsets.only(left: 21.0, top: 31),
                  onPressed: ()=>{print("home")},
                  icon: Image.asset('assets/images/homeIcon.png')),

              IconButton(
                  iconSize: 90.0,
                  padding: EdgeInsets.only(right: 21.0, top: 31),
                  onPressed: (){_onSearchButtonPressed();},
                  icon: Image.asset('assets/images/insights.png')),
        ]),
      ),
    );
  }
  void _onSearchButtonPressed(){
    Get.to(InsightPage());
  }
}
