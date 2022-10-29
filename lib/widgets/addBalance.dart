// SizedBox.expand(
// child: DraggableScrollableSheet(
// builder: (BuildContext context, ScrollController scrollController) {
// return Container(
// color: Colors.blue[100],
// child: ListView.builder(
// controller: scrollController,
// itemCount: 25,
// itemBuilder: (BuildContext context, int index) {
// return ListTile(title: Text('Item $index'));
// },
// ),
// );
// },
// ),
// ),

/* lib/widgets/addBalance.dart */

import 'package:flutter/material.dart';

class AddBalance extends StatefulWidget {
  const AddBalance({super.key});

  @override
  State<AddBalance> createState() => _AddBalanceState();
}

class _AddBalanceState extends State<AddBalance> {
  @override
  Widget build(BuildContext context) {
    return Text("data");
  }
}
