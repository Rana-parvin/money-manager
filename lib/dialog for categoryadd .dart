import 'package:flutter/material.dart';
import 'package:fluttermini/category%20class.dart';
import 'package:fluttermini/function%20category.dart';

ValueNotifier<categorytype> radioselected = ValueNotifier(categorytype.income);

Future<void> showdialogbox(BuildContext Context) async {
  TextEditingController categoryname = TextEditingController();
  showDialog(
      context: Context,
      builder: (ctx) {
        return SimpleDialog(
          title: Text('Add category'),
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: categoryname,
                decoration: InputDecoration(
                    labelText: 'category',
                    hintText: 'category name',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ValueListenableBuilder(
                  valueListenable: radioselected,
                  builder: (BuildContext Context, categorytype value,
                      Widget? child) {
                    return Row(
                      children: [
                        RadioButton(
                            title: 'income',
                            type: categorytype.income,
                            groupvalue: value,
                            onchanged: (categorytype? changed) {
                              if (changed != null) {
                                radioselected.value = changed;
                              }
                            }),
                        RadioButton(
                            title: 'expense',
                            type: categorytype.expense,
                            groupvalue: value,
                            onchanged: (categorytype? changed) {
                              if (changed != null) {
                                radioselected.value = changed;
                              }
                            })
                      ],
                    );
                  }),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                  onPressed: () {

                 final name = categoryname.text;
                    if (name .isEmpty) {}

                final type = radioselected.value;

                final category = categoryclass(
                        id: DateTime.now().millisecondsSinceEpoch.toString(),
                        name: name,
                        isdeleted: true,
                        type: type);
                    categorydb().addcategory(category);
                    print(category);
                    Navigator.of(ctx).pop();
                  },
                  child: Text('Add')),
            )
          ],
        );
      });
}

class RadioButton extends StatelessWidget {
  final String title;
  final categorytype type;
  final categorytype groupvalue;
  final onchanged;

  const RadioButton(
      {super.key,
      required this.title,
      required this.type,
      required this.groupvalue,
      required this.onchanged});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Radio<categorytype>(
          value: type,
          groupValue: groupvalue,
          onChanged: onchanged,
        ),
        Text(title)
      ],
    );
  }
}
