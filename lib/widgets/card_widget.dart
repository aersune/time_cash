import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../generated/locale_keys.g.dart';
import '../utils/colors.dart';
import '../utils/provider.dart';



class CardWidget extends StatelessWidget {
  const CardWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final prov = Provider.of<TransferProvider>(context, listen: true);
    final size = MediaQuery.of(context).size;

    return Container(
      margin: EdgeInsets.symmetric(horizontal: size.width * .03, vertical: size.height * .02),
      width: size.width,
      height: size.height * .3,
      decoration: BoxDecoration(color: Colors.black, borderRadius: BorderRadius.circular(15)),
      child: Stack(
        children: [
          Positioned(
              right: 0,
              top: 0,
              child: Padding(
                padding: const EdgeInsets.only(right: 30, top: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                     Text(
                      LocaleKeys.your_minutes.tr(),
                      style: const TextStyle(fontSize: 13, color: Colors.white, letterSpacing: 5),
                    ),
                    Text(
                      prov.minutes.toString(),
                      style: TextStyle(color: AppColors.textColor, fontSize: 35, letterSpacing: 8,  ),
                    )
                  ],
                ),
              )),
          Positioned(
              top: size.height * .17,
              child:  Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    timingWidget('${LocaleKeys.years.tr()} ', prov.years()),
                    const SizedBox(width: 15,),
                    timingWidget('${LocaleKeys.months.tr()}  ', prov.months()),
                    const SizedBox(width: 15,),
                    timingWidget('${LocaleKeys.days.tr()}  ', prov.days()),
                  ],
                ),
              )),
          Positioned(
              bottom: 0,
              left: 0,
              child: Padding(
                padding: const EdgeInsets.only(left: 10, bottom: 10),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                     Text(
                      LocaleKeys.number_card.tr(),
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14, letterSpacing: 4),
                    ),
                    Text(
                      '9124 1245 4724 2457',
                      style: TextStyle(color: AppColors.textColor, fontSize: 18,  letterSpacing: 5),
                    )
                  ],
                ),
              )),
          const Positioned(
              right: 20,
              bottom: 5,
              child: Text(
                'Life',
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'hacking',
                    fontSize: 35,
                    fontStyle: FontStyle.italic,
                    letterSpacing: 8,
                    fontWeight: FontWeight.w600),
              )),
          Positioned(child: Material(
            color: Colors.transparent,
            
            child: InkWell(
              onTap: (){},
              borderRadius: BorderRadius.circular(15),
              // splashColor: Colors.white.withOpacity(0.3),
              // highlightColor: Colors.transparent,
              // splashColor: Colors.white,
              child: Ink(
              ),
            ),
          ))
        ],
      ),
    );
  }
  Widget timingWidget(String title, String text){
    return Row(
      children: [
         Text(
          title,
          style: const TextStyle(fontSize: 16, color: Colors.white, letterSpacing: 3),
        ),
        Text(
          text,
          style:  TextStyle(fontSize: 16, color: AppColors.textColor, letterSpacing: 3),
        ),
      ],
    );
  }
}
