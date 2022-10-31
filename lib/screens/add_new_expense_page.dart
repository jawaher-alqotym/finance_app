import 'package:flutter/material.dart';
import 'package:finance_app/widgets/num_pad2.dart';
import 'package:toggle_switch/toggle_switch.dart';


class addExpensesPage extends StatefulWidget {
  const addExpensesPage({super.key});
  @override
  State<addExpensesPage> createState() => _addExpensesPageState();
}

class _addExpensesPageState extends State<addExpensesPage> {
  bool isSelected = false;
  // text controller
  final TextEditingController _myController2 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: (AssetImage("assets/images/background.png")),
                fit: BoxFit.cover)),
        child: Padding(
          padding: const EdgeInsets.only(top: 160),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(26)),
              color: Colors.white,
            ),
            child: Column(
              children: [
                Container(
                    height: 30,
                    width: 30,
                    margin: const EdgeInsets.only(left: 350.0, bottom: 15),
                    child: IconButton(
                      iconSize: 35,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.cancel,
                        color: Color.fromRGBO(83, 210, 88, 1),
                      ),
                    )),
                Padding(
                  padding: const EdgeInsets.only(left: 63.0, right: 63),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Expenses', style: TextStyle(fontSize:20, color: Color.fromRGBO(51, 64, 79, 1), fontWeight: FontWeight.w700  ),),
                      Text('Savings plan', style: TextStyle(fontSize:20, color: Color.fromRGBO(51, 64, 79, 1),))
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0, bottom: 39),
                  child: ToggleSwitch(
                    cornerRadius: 0.0,
                    minWidth: 200.0,
                    minHeight: 3.0,
                    fontSize: 20.0,
                    initialLabelIndex: 0,
                    activeBgColor: [Color.fromRGBO(83, 210, 88, 1)],
                    activeFgColor: Color.fromRGBO(51, 64, 79, 1),
                    inactiveBgColor: Color.fromRGBO(51, 64, 79, 1),
                    inactiveFgColor: Color.fromRGBO(51, 64, 79, 1),
                    totalSwitches: 2,
                    labels: ['Expenses', 'Savings plan'],
                    onToggle: (index) {
                      print('switched to: $index');
                    },
                  ),
                ),
                //num pad
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 50.0),
                      child: Text(
                        'New Housing plan',
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 20,
                            color: Color.fromRGBO(51, 64, 79, 1)),
                      ),
                    ),
                    // display the entered numbers
                    Padding(
                      padding: const EdgeInsets.all(60),
                      child: SizedBox(
                        height: 70,
                        child: Center(
                            child: TextField(
                          decoration: InputDecoration(
                              hintStyle: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400,
                                  color: Color.fromRGBO(138, 135, 135, 0.5)),
                              border: InputBorder.none,
                              hintText: '0 SAR/Month'),
                          controller: _myController2,
                          textAlign: TextAlign.center,
                          showCursor: false,
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w400),
                          // Disable the default soft keybaord
                          keyboardType: TextInputType.none,
                        )),
                      ),
                    ),
                    // implement the custom NumPad
                    NumPad(
                      buttonSize: 20,
                      buttonColor: Colors.white,
                      iconColor: Color.fromRGBO(226, 92, 92, 1),
                      controller: _myController2,
                      delete: () {
                        _myController2.text = _myController2.text
                            .substring(0, _myController2.text.length - 1);
                      },
                      // do something with the input numbers
                      onSubmit: () {
                        debugPrint(
                            'Your added Balance: ${_myController2.text}');
                        showDialog(
                            context: context,
                            builder: (_) => AlertDialog(
                                  content: Text(
                                    "Your added expense: \n ${_myController2.text} SAR",
                                    style: const TextStyle(fontSize: 20),
                                  ),
                                ));
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
