import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islamic_app/appcolor.dart';
import 'package:islamic_app/homepage/quran/qurantap.dart';
import 'package:islamic_app/provider/AppProvider.dart';
import 'package:provider/provider.dart';

class SuraDetails extends StatefulWidget {
  static const String routeName = 'suradetails';

  @override
  State<SuraDetails> createState() => _SuraDetailsState();
}

class _SuraDetailsState extends State<SuraDetails> {
  double fontsize=20;
  List<String> verses = [];

  void readfile(int index) async {
    String content = await rootBundle.loadString('assets/files/${index + 1}.txt');
    content = content.trim();
    List<String> contentLines = content.split('\n');
    setState(() {
      verses = contentLines;
    });
  }

  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<AppProvider>(context);
    SuraArgs args = ModalRoute.of(context)?.settings.arguments as SuraArgs;
    if (verses.isEmpty) {
      readfile(args.index);
    }
    return Stack(children: [
      provider.isDark()?
      Image.asset("assets/images/background_dark.png",
        width: double.infinity,
        height: double.infinity,
        fit: BoxFit.fill,
      )
          :
      Image.asset("assets/images/background.png",
        width: double.infinity,
        height: double.infinity,
        fit: BoxFit.fill,
      ),
      Scaffold(
        appBar: AppBar(
          title: Text(args.title,style: Theme.of(context).textTheme.bodyLarge,),
        ),
        body: Stack(
          alignment: Alignment.bottomRight,
          children:[ Container(
            margin: EdgeInsets.symmetric(
              vertical: MediaQuery.of(context).size.height * 0.05,
              horizontal: MediaQuery.of(context).size.width * 0.06,
            ),
            decoration: provider.isDark()?
            BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Appcolor.primaryDarkColor,
            ):
            BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Appcolor.whiteColor,
            ),
            child: verses.isEmpty
                ? Center(child: CircularProgressIndicator(color: Appcolor.primaryLightColor,))
                : ListView.separated(
              itemCount: verses.length,
              itemBuilder: (context, index) {
                return Container(
                  padding: EdgeInsets.all(2),
                  child: Text(
                    '${verses[index]} (${index+1})',
                    textAlign: TextAlign.center,
                    textDirection:TextDirection.rtl,
                    style: provider.isDark()?
                    Theme.of(context).textTheme.bodySmall?.copyWith(
                      fontSize: fontsize,
                      color: Appcolor.yellowColor
                    ):
                    Theme.of(context).textTheme.bodySmall?.copyWith(
                        fontSize: fontsize,
                        color: Appcolor.blackColor
                    ),

                  ),
                );
              },
              separatorBuilder: (context, index) {
                return Divider(thickness: 1, color: Appcolor.primaryLightColor);
              },
            ),
          ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  FloatingActionButton(
                    backgroundColor: Colors.transparent,

                    onPressed: (){
                      if(fontsize<50) {
                        fontsize += 5;
                      }
                      setState(() {

                      });
                    },child: provider.isDark()?
                  Icon(Icons.add,color: Appcolor.yellowColor,):
                  Icon(Icons.add,color: Appcolor.primaryLightColor,),

                  ),
                  SizedBox(height: 1,),
                  FloatingActionButton(
                    backgroundColor: Colors.transparent,
                    onPressed: (){
                      if(fontsize>15) {
                        fontsize -= 5;
                        setState(() {

                        });
                      }
                    },child:provider.isDark()?
                  Icon(Icons.remove,color: Appcolor.yellowColor,):
                  Icon(Icons.remove,color: Appcolor.primaryLightColor,),)
                ],
              ),
            )
        ]
        ),
      ),
    ]);
  }
}
