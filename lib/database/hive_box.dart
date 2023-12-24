import 'package:cash/database/transfer_data.dart';
import 'package:hive/hive.dart';

abstract class HiveBox{
  static final Box<TransferData> transfers = Hive.box<TransferData>('transfers');
}