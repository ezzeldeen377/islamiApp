import 'package:flutter/material.dart';
import 'package:islamic_app/appcolor.dart';
import 'package:islamic_app/homepage/hadeth/hadethtap.dart';
import 'package:islamic_app/provider/AppProvider.dart';
import 'package:provider/provider.dart';

class HadethDetails extends StatefulWidget {
  static const String routeName='hadeth_details';

  @override
  State<HadethDetails> createState() => _HadethDetailsState();
}

class _HadethDetailsState extends State<HadethDetails> {
  double fontsize=20;

  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<AppProvider>(context);
    Ahadeth args=ModalRoute.of(context)?.settings.arguments as Ahadeth;
    return Stack(
        children: [
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
            title: Text(args.title),
          ),
          body: Stack(
              alignment: Alignment.bottomRight ,
              children:[ Container(
              margin: EdgeInsets.symmetric(
                vertical: MediaQuery.of(context).size.height * 0.05,
                horizontal: MediaQuery.of(context).size.width * 0.06,
              ),
              decoration:provider.isDark()?
              BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Appcolor.primaryDarkColor,
              ):
              BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Appcolor.whiteColor,
              ),
             child: ListView.builder(
                 itemBuilder: (context,index){
                   return Text(args.content[index],style: provider.isDark()?
                   Theme.of(context).textTheme.bodySmall?.copyWith(
                       fontSize: fontsize,
                       color: Appcolor.yellowColor
                   ):
                   Theme.of(context).textTheme.bodySmall?.copyWith(
                       fontSize: fontsize,
                       color: Appcolor.blackColor
                   ),textAlign: TextAlign.center,);
                 },

                 itemCount: args.content.length),
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
                      Icon(Icons.add,color: Appcolor.primaryLightColor,),),
                      SizedBox(height: 1,),
                      FloatingActionButton(
                        backgroundColor:Colors.transparent,
                        onPressed: (){
                        if(fontsize>20) {
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
          )
      )
    ]);
  }
}
