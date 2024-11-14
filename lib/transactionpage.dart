
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:fluttermini/category%20class.dart';
import 'package:fluttermini/function%20transaction.dart';
import 'package:fluttermini/transacton%20classmodel.dart';
import 'package:intl/intl.dart';

class Transactionpage extends StatelessWidget {
  const Transactionpage({super.key});

  @override
  Widget build(BuildContext context) {
    transactiondb.instance.refresh();
    return ValueListenableBuilder(
        valueListenable: transactiondb.instance.transactionlistnotifier,
        builder:
            (BuildContext ctx, List<transactionclass> newlist, Widget? child) {
          return ListView.separated(
              itemBuilder: (context, index) {
                final val = newlist[index];
                return Slidable(
                    key: Key(val.id),
                    startActionPane:
                        ActionPane(motion: const ScrollMotion(), children: [
                      SlidableAction(
                        onPressed: (ctx) {
                          transactiondb.instance.deletetransaction(val.id);
                        },
                        icon: Icons.delete,
                        label: 'delete',
                        backgroundColor: Colors.red,
                        foregroundColor: Colors.black,
                        
                      )
                    ]),
                    child: Card(
                      color: Colors.white,
                      elevation: 2,
                      child: ListTile(
                        leading: CircleAvatar(
                          radius: 50,
                          backgroundColor: val.type == categorytype.income
                              ? Colors.green
                              : Colors.red,
                          child: Text(
                            val.datetime,
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        title: Text('Rs ${val.amount}'),
                        subtitle: Text('${val.category.name}'),
                      ),
                    ));
              },
              separatorBuilder: (context, index) {
                return SizedBox(
                  height: 10,
                );
              },
              itemCount: newlist.length);
        });
  }

  String parsedate(DateTime date) {
    return DateFormat.MMMd().format(date);
  }
}
