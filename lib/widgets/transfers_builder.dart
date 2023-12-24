import 'package:cash/generated/locale_keys.g.dart';
import 'package:cash/utils/provider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';


import '../database/hive_box.dart';
import '../database/transfer_data.dart';
import '../utils/colors.dart';

class TransfersBuilder extends StatefulWidget {
  const TransfersBuilder({Key? key}) : super(key: key);

  @override
  State<TransfersBuilder> createState() => _TransfersBuilderState();
}

class _TransfersBuilderState extends State<TransfersBuilder> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return
         Flexible(
            child: ValueListenableBuilder(
              valueListenable: HiveBox.transfers.listenable(),

              builder: (context, Box<TransferData> transfers, _) {

                final allTransfers = transfers.values.toList();
                final prov = Provider.of<TransferProvider>(context, listen: true);

                return ListView.builder(
                    shrinkWrap: true,
                    itemCount: allTransfers.length,
                    scrollDirection: Axis.vertical,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      final bool isSpend = !allTransfers[index].isIncome;
                      return Row(
                        mainAxisAlignment: isSpend ? MainAxisAlignment.start : MainAxisAlignment.end,
                        children: [
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: size.width * .03, vertical: 10),
                            height: size.height * 0.06,
                            width: size.width * .45,
                            padding: EdgeInsets.only(left: isSpend ? 15 : 0, right: isSpend ? 0 : 15),
                            decoration: BoxDecoration(color: isSpend ? Colors.redAccent : AppColors.textColor, borderRadius: BorderRadius.circular(10)),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: isSpend ? CrossAxisAlignment.start : CrossAxisAlignment.end,
                              children: [
                                Text(
                            isSpend ?  prov.transferList()[0] :  prov.transferList()[1],
                                  style: TextStyle(color: isSpend ? Colors.white : Colors.deepPurple, letterSpacing: 2),
                                ),
                                Row(
                                  mainAxisAlignment: isSpend ? MainAxisAlignment.start : MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      "${isSpend ? "-" : "+"}${allTransfers[index].transCost.toString()} ",
                                      style: TextStyle(color: isSpend ? Colors.white : Colors.deepPurple, fontSize: 18, letterSpacing: 2),
                                    ),
                                     Text(
                                      LocaleKeys.minutes.tr(),
                                      style: const TextStyle(fontSize: 11, letterSpacing: 2),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      );
                    });
              }
            ),
          );
  }
}
