import 'package:flutter/material.dart';
import 'package:fluttermini/bottomnavigation.dart';
import 'package:fluttermini/categorypage.dart';
import 'package:fluttermini/dialog%20for%20categoryadd%20.dart';
import 'package:fluttermini/form%20for%20transaction.dart';
import 'package:fluttermini/transactionpage.dart';

class Homepage extends StatelessWidget {
  Homepage({super.key});

  static ValueNotifier<int> selectedindex = ValueNotifier(0);
  final page = [Transactionpage(), Categorypage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        centerTitle: true,
        title: Text(
          'Money Manager',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SafeArea(
          child: ValueListenableBuilder(
              valueListenable: selectedindex,
              builder: (BuildContext, int updatedindex, Widget? child) {
                return page[updatedindex];
              })),
      bottomNavigationBar: BottomnavigationWidge(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (selectedindex.value == 0) {
            print('Add transactions');
            Navigator.push(context, MaterialPageRoute(builder: (context)=>Formfortransaction()));

             }   
       
          else {
            print('Add category');
            
      showdialogbox(context);
          }
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        backgroundColor: Colors.purple[600],
      ),
    );
  }
}
