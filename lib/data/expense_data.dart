import 'package:coffee_shop/data/hive_database.dart';
import 'package:coffee_shop/datetime/date_time_helper.dart';
import 'package:coffee_shop/models/expense_item.dart';
import 'package:flutter/material.dart';

class ExpenseData extends ChangeNotifier{
  // list of ALL expenses
  List<ExpenseItem> overallExpenseList = [];

  // get expense list
  List<ExpenseItem> getAllExpenseList() {
    return overallExpenseList;
  }

  //prepare data to display
  final db = HiveDataBase();
  void prepareData() {
    //if there exits data, get it
    if(db.readData().isNotEmpty) {
      overallExpenseList = db.readData();
    }
  }

  // add new expense
  void addNewExpense(ExpenseItem newExpense) {
    overallExpenseList.add(newExpense);

    notifyListeners();
    db.saveData(overallExpenseList);
  }

  // delete expense
  void deleteExpense(ExpenseItem expense) {
    overallExpenseList.remove(expense);

    notifyListeners();
    db.saveData(overallExpenseList);
  }

  // get weekday (mon, tues, etc) from a dateTime object
  String getDayName(DateTime dateTime) {
    switch(dateTime.weekday) {
      case 1:
        return "Mon";
      case 2:
        return "Tue";
      case 3:
        return "Wed";
      case 4:
        return "Thur";
      case 5:
        return "Fri";
      case 6:
        return "Sat";
      case 7:
        return "Sun";
      default:
        return "";
    }
  }

  // get the date for the start of the week ( sunday )
  DateTime startOfWeekDate() {
    DateTime? startOfWeek;

    //get todays date
    DateTime today = DateTime.now();

    //go backwards from today find sunday
    for(int i = 0; i<7; i++) {
      if(getDayName(today.subtract(Duration(days: i))) == "Sun") {
        startOfWeek = today.subtract(Duration(days: i));
      }
    }
    return startOfWeek!;
  }

  /*

  convert overall list of expenses into a daily expense summary

  e.g.

  overallExpenseList =

  [

  [ food, 2023/01/30, $10 ],
  [ hat, 2023/01/30, $15 ],
  [ drinks, 2023/01/31, $1 ],
  [ food, 2023/02/01, $5 ],
  [ food, 2023/02/01, $6 ],
  [ food, 2023/02/03, $7 ],
  [ food, 2023/02/05, $10 ],
  [ food, 2023/02/05, $11 ],

  ]

  ->

  DailyExpenseSummary =

  [

  [ 20230130: $25 ],
  [ 20230131: $1 ],
  [ 20230201: $11 ],
  [ 20230203: $7 ],
  [ 20230205: $21 ],

  ]

  */

  Map<String,double> calculateDailyExpenseSummary() {
    Map<String,double> dailyExpenseSummary = {
      // date ((yyyymmdd) : amountTotalForDay
    };

    for(var expense in overallExpenseList) {
      String date = convertDateTimeToString(expense.dateTime);
      double amount = double.parse(expense.amount);

      if(dailyExpenseSummary.containsKey(date)) {
        double currentAmount = dailyExpenseSummary[date]!;
        currentAmount += amount;
        dailyExpenseSummary[date] = currentAmount;
      }
      else {
        dailyExpenseSummary.addAll({date: amount});
      }
    }

    return dailyExpenseSummary;
  }











}