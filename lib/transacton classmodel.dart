import 'package:fluttermini/category%20class.dart';
import 'package:hive/hive.dart';
 part 'transacton classmodel.g.dart';
 
@HiveType(typeId: 3)
class transactionclass {
  @HiveField(0)
  final double amount;

  @HiveField(1)
  final categorytype type;

  @HiveField(2)
  final String purpose;

  @HiveField(3)
  final String datetime;

  @HiveField(4)
  final categoryclass category;

  @HiveField(5)
  String id = DateTime.now().microsecondsSinceEpoch.toString();

  transactionclass({
    required this.amount,
    required this.type,
    required this.category,
    required this.datetime,
    required this.purpose,
  });
}
