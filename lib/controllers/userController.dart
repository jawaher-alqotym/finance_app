/* lib/controller/userController */

import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:finance_app/models/user.dart';
import 'package:finance_app/models/saving.dart';
import 'package:finance_app/models/expense.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


DateTime now = new DateTime.now();
DateTime today = new DateTime(now.year, now.month, now.day);

class UserController extends GetxController {
  User user = new User(
      income: 0.obs,
      oldIncome: 0.obs,
      savingList: <Saving>[].obs,
      expenseList: <Expense>[].obs,
      name: "");

  List<Expense> searchResult = <Expense>[];

  var selectedText;     // this must be moved to savings controller
  var selectedPercent; // this must be moved to savings controller
  var selectedFromDate; // this must be moved to savings controller
  var selectedToDate;// this must be moved to savings controller
  var selectedIcon;// this must be moved to expense controller


  @override
  void onInit() {
    super.onInit();
    searchResult = user.expenseList;
  }

  getUserData(String user_name) async {
    try {
      QuerySnapshot _snapSavings = await FirebaseFirestore.instance
          .collection('Savings')
          .where("user_name", isEqualTo: user_name)
          .get();

      QuerySnapshot _snapExpences = await FirebaseFirestore.instance
          .collection('Expenses')
          .where("user_name", isEqualTo: user_name)
          .get();

      QuerySnapshot _snapUser = await FirebaseFirestore.instance
          .collection('Users')
          .where("name", isEqualTo: user_name)
          .get();

      user.savingList.clear();
      user.expenseList.clear();

      for (var item in _snapUser.docs) {
        user.id = item["id"];
        user.name = item["name"];
        user.oldIncome.value = item["monthlyIncome"].toInt();
        user.income.value = item["income"].toInt();
      }


      for (var item in _snapSavings.docs) {
        user.savingList.add(
          new Saving(
              id: item["id"],
              percentage: double.parse(item["percentage"].toString()),
              amount: item["amount"],
              fromDate: item["fromDate"],
              toDate: item["toDate"], title: item["title"],
              user_name: item["user_name"])
        );
      }
      for (var item in _snapExpences.docs) {
        user.expenseList.add(
          new Expense(
              id: item["id"],
              date: (item["date"]).toDate(),
              amount: item["amount"],
              name: item["name"] ,
              user_name: item["user_name"],
             // icon: item["icon"],
          ),
              );
      }
    } catch (e) {
      print("getUserData method");
      print(e.toString());
    }
  }

  @override
  void onClose() {}
  void filterExpences(String name) {
    print(name);
    List<Expense> results = [];
    if (name.isEmpty) {
      results = user.expenseList;
    } else {
      results = user.expenseList
          .where((element) => element.name
              .toString()
              .toLowerCase()
              .contains(name.toLowerCase()))
          .toList();
    }
    searchResult = results;
    update();
  }

  updateIncome(newIncome) async{

    await FirebaseFirestore.instance
        .collection('Users')
        .doc(user.id)
        .update({
      "income": user.income.value + newIncome.round(),
       "monthlyIncome": user.oldIncome.value + newIncome.round(),});

    if(user.savingList.isNotEmpty){
    updateSavingsAmount();
    }
    getUserData(user.name!);
  }

  updateSavingsAmount() async{
    for(int i = 0; i < user.savingList.length; i++) {
      var temp = user.savingList[i].percentage * user.income.value;
       await FirebaseFirestore.instance
          .collection('Savings')
          .doc(user.savingList[i].id)
          .update({
              "amount": temp
          });
    }
    getUserData(user.name!);
  }

  addSavings(Saving saving) async{
    var now = DateTime.now().toString();
    try{
    await FirebaseFirestore.instance
        .collection('Savings')
        .doc(now)
        .set(
      {
        "id": now,
        'fromDate': saving.fromDate,
        'toDate': saving.toDate,
        'percentage': saving.percentage,
        'amount': saving.amount,
        'title': saving.title,
        'user_name': user.name,
      },
      SetOptions(merge: true),
    );
    print(subtractFromIncome(saving.amount));
    getUserData(user.name!);

    }catch(e){
      print("addSavings method");
      print(e.toString());
    }
  }

  addExpense(Expense expense) async{
    print(expense.date);
    var now = DateTime.now().toString();
    try{
      await FirebaseFirestore.instance
          .collection('Expenses')
          .doc(now)
          .set(
        {
          "id": now,
          'amount': expense.amount,
          'date': Timestamp.fromDate(expense.date),
          'name': expense.name,
          'user_name': user.name,
          "icon": expense.icon.hashCode.toString(),
        },
        SetOptions(merge: true),
      );
      print(subtractFromIncome(expense.amount));
      getUserData(user.name!);

    }catch(e){
      print("addExpense method");
      print(e.toString());
    }
  }

  deleteSavings(String? id) async{
    print(" delete savings methods ${id}");
    await FirebaseFirestore.instance.collection('Savings').doc(id).delete();
    getUserData(user.name!);
    for(int i = 0 ; i< user.savingList.length;i++){
     if(user.savingList[i].id == id){
      updateIncome(user.savingList[i].amount.toInt());

    }
    }

  }

  Future<bool> subtractFromIncome(amount) async{
    await FirebaseFirestore.instance
        .collection('Users')
        .doc(user.id)
        .update({
      "income": user.income.value - amount});

    return true;
  }

  num getSpendingTotal() {
    num total = user.expenseList.fold(0, (sum, item) => sum + num.parse(item.amount.toString()));
    update();
    print('getSpendingTotal');
    print(total);
    return total;
  }

  num getSavingTotal() {
    final num total = user.savingList.fold(0, (sum, item) => sum + item.amount);
    update();
    print("getSavingTotal");
    print(total);
    return total;
  }

  getPieChartData() {
    var income = user.oldIncome.value;

    if (income <= getSpendingTotal()) {
      return 1.0;
    }
    var percent = double.parse(
        (double.parse(getSpendingTotal().toString()) / income)
            .toStringAsFixed(2));


    if (income.isFinite && getSpendingTotal() >= 0.0) {
      return percent;
    } else {
      return 0.0;
    }
  }

  Expense? getHighestExpensesCategory(){
    List<Expense> temp = [];

    for(int i = 0 ; i < user.expenseList.length; i++){
      if(!temp.contains(user.expenseList[i].name)){
        temp.add(user.expenseList[i]);
      }else{
        temp[i].amount += user.expenseList[i].amount;
      }
    }

    if(temp.isNotEmpty) {
      return temp.fold(temp[0], (max, e) => e.amount > max!.amount ? e : max);
    }else{
      return null;
    }
  }

  DateTime getLoginDate() {
    DateTime now = new DateTime.now();
    return new DateTime(now.hour, now.minute);
  }

  String welcomeMsg(){
    var currentHour= DateTime.now().hour;
    if(currentHour<12){
      return'صباح الخير';
    }
    else{
      return'مساء الخير';
    }
  }

  List<num> getMonthlyExpenses(){
    var now = DateTime.now();

    num week1=0;
    num week2=0;
    num week3=0;
    num week4=0;

    for(int i= 0 ; i < user.expenseList.length; i++){
      if(DateTime.parse(user.expenseList[i].id!).month == now.month){
        if(DateTime.parse(user.expenseList[i].id!).weekOfMonth == 1){
          week1 += user.expenseList[i].amount;
        }
        if(DateTime.parse(user.expenseList[i].id!).weekOfMonth == 2){
          week2 += user.expenseList[i].amount;
        }
        if(DateTime.parse(user.expenseList[i].id!).weekOfMonth == 3){
          week3 += user.expenseList[i].amount;
        }
        if(DateTime.parse(user.expenseList[i].id!).weekOfMonth == 4){
          week4 += user.expenseList[i].amount;
        }


      }
    }

    return [week1, week2, week3, week4];
  }

  List<num> getMonthlySavings(){
    var now = DateTime.now();

    num week1=0;
    num week2=0;
    num week3=0;
    num week4=0;

    for(int i= 0 ; i < user.savingList.length; i++){
      if(DateTime.parse(user.savingList[i].id!).month == now.month){
        if(DateTime.parse(user.savingList[i].id!).weekOfMonth == 1){
          week1 += user.savingList[i].amount;
        }
        if(DateTime.parse(user.savingList[i].id!).weekOfMonth == 2){
          week2 += user.savingList[i].amount;
        }
        if(DateTime.parse(user.savingList[i].id!).weekOfMonth == 3){
          week3 += user.savingList[i].amount;
        }
        if(DateTime.parse(user.savingList[i].id!).weekOfMonth == 4){
          week4 += user.savingList[i].amount;
        }


      }
    }
    return [week1, week2, week3, week4];
  }

  String? largNumbersformatter(String currentBalance) {
    try {
      // suffix = {' ', 'k', 'M', 'B', 'T', 'P', 'E'};
      double value = double.parse(currentBalance);

      if (value < 1000000) {
        // less than a million
        return value.toStringAsFixed(0);
      } else if (value >= 1000000 && value < (1000000 * 10 * 100)) {
        // less than 100 million
        double result = value / 1000000;
        return result.toStringAsFixed(2) + "M";
      } else if (value >= (1000000 * 10 * 100) &&
          value < (1000000 * 10 * 100 * 100)) {
        // less than 100 billion
        double result = value / (1000000 * 10 * 100);
        return result.toStringAsFixed(2) + "B";
      } else if (value >= (1000000 * 10 * 100 * 100) &&
          value < (1000000 * 10 * 100 * 100 * 100)) {
        // less than 100 trillion
        double result = value / (1000000 * 10 * 100 * 100);
        return result.toStringAsFixed(2) + "T";
      }
    } catch (e) {
      print(e);
    }
  }

}

extension DateTimeExtension on DateTime {
  int get weekOfMonth {
    var wom = 0;
    var date = this;

    while (date.month == month) {
      wom++;
      date = date.subtract(const Duration(days: 7));
    }

    return wom;
  }
}