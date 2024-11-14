import 'package:flutter/material.dart';
import 'package:fluttermini/expense%20category.dart';
import 'package:fluttermini/income%20category.dart';

class Categorypage extends StatefulWidget {
  const Categorypage({super.key});

  @override
  State<Categorypage> createState() => _CategorypageState();
}

class _CategorypageState extends State<Categorypage>with SingleTickerProviderStateMixin {
  late TabController tabcontrol;
  @override
  void initState() {
  
    super.initState();
    tabcontrol = TabController(length: 2, vsync:this );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TabBar(
          tabs: [
            Tab(child: Text('expense')),
            Tab(
              child: Text('income'),
            ),
          ],
          indicatorColor: const Color.fromARGB(255, 84, 83, 83),
          unselectedLabelColor: const Color.fromARGB(255, 84, 83, 83),
          controller: tabcontrol,
        ),
          Expanded(
          child: TabBarView(
            controller: tabcontrol,
            children: [
                 
                 Expensecategory(),
                 Incomecategory(),

            ]),
        )
      ],
    );
  }
}
