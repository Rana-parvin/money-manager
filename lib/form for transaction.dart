//id,amount,type,purpose,datetime
import 'package:flutter/material.dart';
import 'package:fluttermini/category%20class.dart';
import 'package:fluttermini/function%20category.dart';
import 'package:fluttermini/function%20transaction.dart';
import 'package:fluttermini/transacton%20classmodel.dart';

final amountctrl = TextEditingController();
final purposectrl = TextEditingController();

ValueNotifier<List<transactionclass>> transactionnotifier =
    ValueNotifier<List<transactionclass>>([]);

DateTime? dateselected;
categorytype? typeselected;
categoryclass? modelselected;

class Formfortransaction extends StatefulWidget {
  const Formfortransaction({super.key});

  static const routename = 'add transacton';

  @override
  State<Formfortransaction> createState() => _FormfortransactionState();
}

class _FormfortransactionState extends State<Formfortransaction> {
  @override
  void initState() {
    super.initState();
    typeselected = categorytype.income;
    categorydb.instance.refresh();
    loadtransactions();
  }

  Future<void> loadtransactions() async {
    final transactions = await transactiondb.instance.gettransactions();
    transactionnotifier.value = transactions;
  }

  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            controller: amountctrl,
            decoration: InputDecoration(
                labelText: 'amount',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10))),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            controller: purposectrl,
            decoration: InputDecoration(
                labelText: 'purpose',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10))),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Radio(
                    value: categorytype.income,
                    groupValue: typeselected,
                    onChanged: (categorytype? newvalue) {
                      setState(() {
                        typeselected = newvalue;
                        modelselected = null;
                      });
                    })
              ],
            ),
            Row(
              children: [
                Radio(
                    value: categorytype.expense,
                    groupValue: typeselected,
                    onChanged: (categorytype? newvalue) {
                      setState(() {
                        typeselected = newvalue;
                        modelselected = null;
                      });
                    })
              ],
            ),
            TextButton.icon(
                onPressed: () {
                  showDatePicker(
                      context: context,
                      firstDate: DateTime.now(),
                      lastDate: DateTime.now());
                },
                label: Icon(Icons.calendar_today_outlined)),
            ElevatedButton(
                onPressed: () {
                  addt();
                },
                child: Text('add transaction')),
          ],
        ),
        ValueListenableBuilder(
            valueListenable: typeselected == categorytype.income
                ? categorydb.instance.incomelist
                : categorydb.instance.expenselist,
            builder: (Context, List<categoryclass> categoryList, _) {
              return Center(
                child: DropdownButton<categoryclass>(
                  items: categoryList.map((category) {
                    return DropdownMenuItem<categoryclass>(
                      child: Text(category.name),
                      value: category,
                    );
                  }).toList(),
                  onChanged: (categoryclass? newvalue) {
                    setState(() {
                      modelselected = newvalue;
                    });
                  },
                  hint: Text('select category'),
                  value: modelselected,
                ),
              );
            })
      ]),
    ));
  }

  Future<void> addt() async {
    final amounttext = amountctrl.text;
    final purposetext = purposectrl.text;

    if (purposetext.isEmpty ||
        amounttext.isEmpty ||
        typeselected == null ||
        modelselected == null) {
      return;
    }

    final amountparse = double.tryParse(amounttext);
    if (amountparse == null) {
      return;
    }
    String thedate = dateselected.toString();
    final transactions = transactionclass(
      amount: amountparse,
      type: typeselected!,
      category: modelselected!,
      datetime: thedate,
      purpose: purposetext,
    );

    await transactiondb.instance.addtransaction(transactions);
    Navigator.of(context).pop();
    purposectrl.clear();
    amountctrl.clear();
    setState(() {
      dateselected = null;
      modelselected = null;
    });
  }
}
