import 'package:flutter/material.dart';

import 'package:fluttermini/category%20class.dart';
import 'package:fluttermini/function category.dart';

class Incomecategory extends StatelessWidget {
  const Incomecategory({super.key});

  @override
  Widget build(BuildContext context) {
    categorydb().incomelist;

    return ValueListenableBuilder(
        valueListenable: categorydb().incomelist,
        builder: (BuildContext context, List<categoryclass> newlist, _) {
          return ListView.separated(
              itemBuilder: (Context, index) {
                final val = newlist[index];

                return Card(
                  color: Colors.white,
                  elevation: 2,
                  child: ListTile(
                    title: Text(
                      '${val.name}',
                      style: TextStyle(fontSize: 15),
                    ),
                    trailing: IconButton(
                        onPressed: () async {
                          final exists =
                              await categorydb.instance.checkexist(val.id);
                          if (exists) {
                            categorydb.instance.deletecategory(val.id);
                            ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('income deleted')));
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('income not found')));
                          }
                        },
                        icon: Icon(
                          Icons.delete,
                          size: 20,
                        )),
                  ),
                );
              },
              separatorBuilder: (Context, Index) {
                return const SizedBox(
                  height: 10,
                );
              },
              itemCount: newlist.length);
        });
  }
}
