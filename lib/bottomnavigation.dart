import 'package:flutter/material.dart';
import 'package:fluttermini/homepage.dart';

class BottomnavigationWidge extends StatelessWidget {
  const BottomnavigationWidge({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: Homepage.selectedindex,
      builder: (BuildContext, int updatedindex, Widget? child) {
        return BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home), label: 'transaction'),
            BottomNavigationBarItem(
                icon: Icon(Icons.category), label: 'category')
          ],
          onTap: (index) {
            Homepage.selectedindex.value = index;
            
          },
          selectedItemColor: Colors.purple,
        );
      },
    );
  }
}
