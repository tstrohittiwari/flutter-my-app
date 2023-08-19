import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:savex/components/expense_summary.dart';
import 'package:savex/components/expense_tile.dart';
import 'package:savex/data/expense_data.dart';
import 'package:savex/models/expense_items.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //text controller
  final newExpenseNameController = TextEditingController();
  final newExpenseAmountController = TextEditingController();

  @override
  void initState() {
    super.initState();
    Provider.of<ExpenseData>(context, listen: false).prepareData();
  }

  //add new expense
  void addNewExpense() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
        height: MediaQuery.of(context).size.height * 0.75,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25.0),
            topRight: Radius.circular(25.0),
          ),
        ),
        child: Column(
          children: [
            // Padding(
            //   padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10)),
            const Text(
              "Add New Expense",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
            ),
            TextField(
              keyboardType: TextInputType.name,
              decoration: const InputDecoration(label: Text("Title")),
              controller: newExpenseNameController,
            ),
            const SizedBox(
              height: 15,
            ),
            TextField(
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(label: Text("Amount")),
              controller: newExpenseAmountController,
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              children: [
                const SizedBox(width: 125),
                MaterialButton(
                  onPressed: cancel,
                  child: const Text("Cancel"),
                ),
                ElevatedButton(
                  onPressed: save,
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(10),
                    backgroundColor:  const Color.fromARGB(255, 54, 69, 79),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: const Text("Save",style: TextStyle(color: Colors.white),),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // delete expense
  void deleteExpense(ExpenseItem expense) {
    Provider.of<ExpenseData>(context, listen: false).deleteExpense(expense);
  }

  //save
  void save() {
    ExpenseItem newExpense = ExpenseItem(
      name: newExpenseNameController.text,
      amount: newExpenseAmountController.text,
      dateTime: DateTime.now(),
    );
    if (newExpenseNameController.text.trim().isEmpty ||
        newExpenseAmountController.text.trim().isEmpty) {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text("Invalid Input"),
          content: const Text("Enter valid Title, Date"),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.pop(ctx);
                },
                child: const Text("Okay")),
          ],
        ),
      );
      return;
    }
    Provider.of<ExpenseData>(context, listen: false).addNewExpense(newExpense);
    Navigator.pop(context);
    clear();
  }

  //cancel
  void cancel() {
    Navigator.pop(context);
    clear();
  }

  //clear controllers
  void clear() {
    newExpenseAmountController.clear();
    newExpenseNameController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ExpenseData>(
      builder: (context, value, child) => Scaffold(
        appBar: AppBar(
            title: const Text(
              "SaveX",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            ),
            centerTitle: true,backgroundColor: Colors.white,),
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        floatingActionButton: FloatingActionButton(
          onPressed: addNewExpense,
          backgroundColor: const Color.fromARGB(255, 54, 69, 79),
          child: const Icon(Icons.add_rounded,color: Colors.white),
        ),
        body: ListView(
          children: [
            //weekly summary
            ExpenseSummary(startOfWeek: value.startOfWeekDate()),
            const SizedBox(
              height: 7,
            ),
            //expense summary
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: value.getAllExpenseList().length,
              itemBuilder: (context, index) => ExpenseTile(
                name: value.getAllExpenseList()[index].name,
                amount: value.getAllExpenseList()[index].amount,
                dateTime: value.getAllExpenseList()[index].dateTime,
                deleteTapped: (p0) =>
                    deleteExpense(value.getAllExpenseList()[index]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
