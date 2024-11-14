
import 'package:hive/hive.dart';
part 'category class.g.dart';

@HiveType(typeId: 2)
class categoryclass {

  @HiveField(0)
   final String id;

  @HiveField(1)
   final String name;


  @HiveField(2)
   final bool isdeleted;

  @HiveField(3)
   final categorytype type;

   categoryclass(
       {required this.id,
       required this.name,
       required this.isdeleted,
       required this.type}
                );
}

@HiveType(typeId: 1)
enum categorytype {

  @HiveField(0)
  income,

  @HiveField(1)
  expense,
}