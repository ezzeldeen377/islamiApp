import 'package:flutter/material.dart';
import 'package:islamic_app/appcolor.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islamic_app/provider/AppProvider.dart';
import 'package:provider/provider.dart';

class RadioTap extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<AppProvider>(context);
    return  Center(
      child: Column(
        children: [
          SizedBox(height: 100,),
          Image.asset('assets/images/radio_logo.png',height: 250,),
          Text(AppLocalizations.of(context)!.quran_radio,style: Theme.of(context).textTheme.bodyLarge,),
          SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [

              Icon(Icons.skip_previous,
                color:provider.isDark()? Appcolor.yellowColor:Appcolor.primaryLightColor,
                size: 50,),
              Icon(Icons.play_arrow,
                color:provider.isDark()? Appcolor.yellowColor:Appcolor.primaryLightColor,
                size: 50,),
              Icon(Icons.skip_next,
                color:provider.isDark()? Appcolor.yellowColor:Appcolor.primaryLightColor,
                size: 50,),


            ],
          )

        ],
      ),
    );
  }
}
