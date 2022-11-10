

import 'package:finance_app/widgets/expenseCard.dart';
import 'package:finance_app/widgets/navBar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:finance_app/controllers/userController.dart';

class Search extends StatefulWidget{

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  final userController = Get.find<UserController>();

  @override
  Widget build(BuildContext context) {

    return GetBuilder<UserController>(
       init: UserController(),
       initState: (_) {},
       builder: (userController) {


      return Container(
      child: Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: [
      Positioned(
      width: MediaQuery.of(context).size.width-100,
      top:MediaQuery.of(context).size.height-870,
      child: TextField(
        onChanged: (value) => userController.filterExpences(value),
      decoration: InputDecoration(
      enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(
      width: 1, color: Color(0xff53D258)), //<-- SEE HERE
      ),
      labelText: 'Search',
      suffixIcon: Icon(Icons.search),
      ),
      ),
      ),


      Positioned(
      width: MediaQuery.of(context).size.width,
      top:MediaQuery.of(context).size.height-770,
      child: ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: userController.searchResult.length,
      itemBuilder: (context, index) =>
      ExpenseCard(
      date: userController.searchResult[index].date,
      amount: userController.searchResult[index].amount,
      name: userController.searchResult[index].name,
      //catgory : userController.user.expenseList[index].catgory,
      ),
      ),
      ),
      navBar() ]
      ,
      )
      ,

      );
    }
    );
  }
}
