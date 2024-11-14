import 'package:flutter/material.dart';
import 'package:fluttermini/category%20class.dart';
import 'package:fluttermini/homepage.dart';
import 'package:fluttermini/transacton%20classmodel.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  if (!Hive.isAdapterRegistered(categorytypeAdapter().typeId)) {
    Hive.registerAdapter(categorytypeAdapter());
  }
  if (!Hive.isAdapterRegistered(categoryclassAdapter().typeId)) {
    Hive.registerAdapter(categoryclassAdapter());
  }

  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  if (!Hive.isAdapterRegistered(transactionclassAdapter().typeId)) {
    Hive.registerAdapter(transactionclassAdapter());
  }
  


  runApp(const MyAppmini());
}

class MyAppmini extends StatelessWidget {
  const MyAppmini({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Homepage(),
    );
  }
}
