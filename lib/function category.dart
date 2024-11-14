import 'package:flutter/material.dart';
import 'package:fluttermini/category%20class.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

const databasename = 'category database';

abstract class dbfunctions {
  Future<void> initdatabase();
  Future<List<categoryclass>> getcategory();
  Future<void> addcategory(categoryclass value);
  Future<void> deletecategory(String id);
  Future<void> refresh();
  Future<bool> checkexist(String id);
}

class categorydb implements dbfunctions {
  categorydb._internal();
  static final categorydb instance = categorydb._internal();
  factory categorydb() => instance;
  final ValueNotifier<List<categoryclass>> incomelist = ValueNotifier([]);
  final ValueNotifier<List<categoryclass>> expenselist = ValueNotifier([]);
  Box<categoryclass>? DBcategory;


@override
  Future<void> initdatabase() async {
    if (DBcategory == null) {
      DBcategory = await Hive.openBox<categoryclass>(databasename);
    }
  }

  @override
  Future<void> addcategory(categoryclass value) async {
    await initdatabase();
    await DBcategory?.put(value.id, value);
    await refresh();
  }

  @override
  Future<List<categoryclass>> getcategory() async {
    await initdatabase();
    return DBcategory?.values.toList() ?? [];
  }

  @override
  Future<void> refresh() async {
    final categorylist = await getcategory();
    incomelist.value.clear();
    expenselist.value.clear();

    for (var category in categorylist) {
      if (category.type == categorytype.income) {
        incomelist.value.add(category);
      } else {
        expenselist.value.add(category);
      }
      incomelist.notifyListeners();
      expenselist.notifyListeners();
    }
  }

  @override
  Future<void> deletecategory(String id) async {
    await initdatabase();
    await DBcategory?.delete(id);
    await refresh();
  }

  Future<bool> checkexist(String id) async {
    await initdatabase();
    return DBcategory?.containsKey(id) ?? false;
  }
}
