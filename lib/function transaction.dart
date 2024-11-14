import 'package:flutter/material.dart';
import 'package:fluttermini/transacton%20classmodel.dart';
import 'package:hive/hive.dart';

const databasename = 'transaction database';

abstract class dbfunction {
  Future<void> addtransaction(transactionclass value);
  Future<List<transactionclass>> gettransactions();
  Future<void> deletetransaction(String id);
  Future<void> refresh();
}

class transactiondb implements dbfunction {
  transactiondb._internal();
  static final transactiondb instance = transactiondb._internal();
  factory transactiondb() => instance;

  ValueNotifier<List<transactionclass>> transactionlistnotifier =
      ValueNotifier([]);

  @override
  Future<void> addtransaction(transactionclass value) async {
    final db = await Hive.openBox<transactionclass>('db');
    await db.put(value.id, value);
    await refresh();
  }

  @override
  Future<List<transactionclass>> gettransactions() async {
    final db = await Hive.openBox<transactionclass>('db');
    return db.values.toList();
  }

  @override
  Future<void> deletetransaction(String id) async {
    final db = await Hive.openBox<transactionclass>('db');
    await db.delete(id);
  }

  @override
  Future<void> refresh() async {
    final transactionlist = await gettransactions();
    transactionlist.sort(
      (a, b) => b.datetime.compareTo(a.datetime),
    );
    transactionlistnotifier.value.clear();
    transactionlistnotifier.value.addAll(transactionlist);
    transactionlistnotifier.notifyListeners();
  }
}
