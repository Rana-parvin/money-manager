import 'package:flutter/material.dart';
import 'package:fluttermini/category%20class.dart';
import 'package:fluttermini/function%20category.dart';

class Expensecategory extends StatelessWidget {
  const Expensecategory({super.key});

  @override
  Widget build(BuildContext context) {
    categorydb().expenselist;

    return ValueListenableBuilder(
        valueListenable: categorydb().expenselist,
        builder: (BuildContext context, List<categoryclass> newlist, _) {
          return ListView.separated(
              itemBuilder: (Context, index) {
                final val = newlist[index];
                return Card(
                    color: Colors.white,
                    child: ListTile(
                        title: Text(
                          "${val.name}",
                          style: TextStyle(fontSize: 15),
                        ),
                        trailing: IconButton(
                            onPressed: () async {
                              final exists =
                                  await categorydb.instance.checkexist(val.id);
                              if (exists) {
                                categorydb.instance.deletecategory(val.id);
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        content: Text('expense deleted')));
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        content: Text('expense not found')));
                              }
                            },
                            icon: Icon(
                              Icons.delete,
                              size: 20,
                            ))));
              },
              separatorBuilder: (Context, index) {
                return SizedBox(
                  height: 10,
                );
              },
              itemCount: newlist.length);
        });
  }
}
