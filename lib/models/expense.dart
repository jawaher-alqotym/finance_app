/* lib/models/expense,dart */

class Expense {
  String? id;
  DateTime date;
  num amount;
  String name;
  String?   icon;
  String? user_name;

  Expense({ this.id, required this.date, required this.amount, required this.name, this.icon, this.user_name});

  @override
  toString(){
    return "name: ${name}, amount: ${amount}, date: ${date}";
  }

}