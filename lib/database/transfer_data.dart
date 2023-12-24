import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
part 'transfer_data.g.dart';

@HiveType(typeId: 0)
class TransferData {

  @HiveField(0)
  bool isIncome;

  @HiveField(1)
  int transCost;

  @HiveField(2)
  late String date;



  TransferData({required this.isIncome, required this.transCost}){
    final DateTime dateTime = DateTime.now();
    date = DateFormat("dd,MM,yyyy").format(dateTime).toString();
  }
}