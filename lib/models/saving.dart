/* lib/models/saving,dart */

class Saving {
  String? id;
  String fromDate;
  String toDate;
  var percentage ;
  num amount;
  String title ;
  String? user_name;

  Saving({
    this.id,
    required this.percentage,
    required this.amount,
    required this.fromDate,
    required this.toDate,
    required this.title,
    this.user_name});


  }
