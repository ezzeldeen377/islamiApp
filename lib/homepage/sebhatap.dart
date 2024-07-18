import 'package:flutter/material.dart';
import 'package:islamic_app/appcolor.dart';
import "package:flutter_gen/gen_l10n/app_localizations.dart";
import 'package:islamic_app/provider/AppProvider.dart';
import 'package:provider/provider.dart';
class SebhaTap extends StatefulWidget {
  @override
  State<SebhaTap> createState() => _SebhaTapState();
}

class _SebhaTapState extends State<SebhaTap> {
  double _rotationAngle=0;
  int counter =0;
  int index=0;

  void rotateImage(){
    setState(() {
      _rotationAngle+=11;
    });
}
  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<AppProvider>(context);
    List<String> adaya=[AppLocalizations.of(context)!.sobhan_allah,
      AppLocalizations.of(context)!.allah_akbr,
      AppLocalizations.of(context)!.alhamdollah,

    ];
    return Center(
      child: Column(
        children: [
          GestureDetector(
              onTap: () {
                rotateImage();
                counter++;
                if(counter%33==0){
                  index++;
                  if(index==3){
                    index=0;
                  }
                }
              },
              child: Transform.rotate(
                angle: _rotationAngle * (3.141592653589793 / 180),
                  child: provider.isDark()?
                  Image.asset('assets/images/sebha_logo_dark.png'):
                  Image.asset('assets/images/sebha_logo.png')

              )
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            AppLocalizations.of(context)!.tasbeh_number,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: (){
              counter=0;
              _rotationAngle=0;
              index=0;
              setState(() {

              });
            },
            child: Container(
              decoration: provider.isDark()?
              BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Appcolor.primaryDarkColor,
              ):
              BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Appcolor.primaryLightColor,
              ),
              padding: EdgeInsets.all(20),
              child: Text(
                "$counter",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            decoration:provider.isDark()?
            BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Appcolor.yellowColor,
            ):
            BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Appcolor.primaryLightColor,
            ),
            padding: EdgeInsets.all(10),
            child: Text(
              '${adaya[index]}',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Appcolor.blackColor
              ),
            ),
          )
        ],
      ),
    );
  }
}
