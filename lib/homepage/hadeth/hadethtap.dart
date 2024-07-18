import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islamic_app/appcolor.dart';
import 'package:islamic_app/homepage/hadeth/hadeth_details.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islamic_app/provider/AppProvider.dart';
import 'package:provider/provider.dart';

class HadethTap extends StatefulWidget {
  @override
  State<HadethTap> createState() => _HadethTapState();
}

class _HadethTapState extends State<HadethTap> {
  List<Ahadeth> hadeths=[];

  late String title;

  late List<String> content;

  void readfile()async{
     String ahadeth= await rootBundle.loadString('assets/files/ahadeth.txt');
        List<String> hadeth=ahadeth.split("#\r\n");
        for(int i=0;i < hadeth.length;i++){
          List<String>lines=hadeth[i].split('\n');

          title=lines[0];
          lines.removeAt(0);
          content=lines;
          hadeths.add(Ahadeth(title: title, content: content));
          setState(() {

          });
        }

  }

  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<AppProvider>(context);
    readfile();
    return Column(
      children: [
        Image.asset('assets/images/hadeth_logo.png',
          height: 170,
          ),
        provider.isDark()?
        Divider(
          thickness: 3,
          color: Appcolor.yellowColor,
        )
            :
        Divider(
          thickness: 3,
          color: Appcolor.primaryLightColor,
        ),
        Text(AppLocalizations.of(context)!.hadeth_name,style: Theme.of(context).textTheme.bodyLarge,),
        provider.isDark()?
        Divider(
          thickness: 3,
          color: Appcolor.yellowColor,
        )
            :
        Divider(
          thickness: 3,
          color: Appcolor.primaryLightColor,
        ),
        Expanded(
          child:hadeths.isEmpty?
              Center(
                child: CircularProgressIndicator(
                  color: Appcolor.primaryLightColor,
                ),
              ):
          ListView.separated(
            separatorBuilder:(context,index){
              return provider.isDark()?
              Divider(
                thickness: 1,
                color: Appcolor.yellowColor,
              )
                  :
              Divider(
                thickness: 1,
                color: Appcolor.primaryLightColor,
              );
            },
            itemBuilder: (context, index) {
              return InkWell(
                onTap: (){
                  Navigator.of(context).pushNamed(HadethDetails.routeName,arguments: hadeths[index]);
                },
                child: Text(hadeths[index].title,style: Theme.of(context).textTheme.bodyMedium,
                textAlign:TextAlign.center,),
              );
            },
            itemCount: hadeths.length,
          ),
        )
      ],
    );
  }
}
class Ahadeth{
  String title;
  List<String> content;
  Ahadeth({required this.title,required this.content});
}
