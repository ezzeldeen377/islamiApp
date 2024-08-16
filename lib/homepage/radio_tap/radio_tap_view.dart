import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:islamic_app/appcolor.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islamic_app/homepage/radio_tap/radio_navigator.dart';
import 'package:islamic_app/homepage/radio_tap/radio_tap_view_model.dart';
import 'package:islamic_app/provider/AppProvider.dart';
import 'package:provider/provider.dart';

class RadioTapView extends StatefulWidget {

  @override
  State<RadioTapView> createState() => _RadioTapViewState();
}

class _RadioTapViewState extends State<RadioTapView> implements RadioNavigator {
  RadioTapViewModel viewModel= RadioTapViewModel();
  late AppProvider provider;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.getRadioList('ar');
    viewModel.navigator=this;

  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    viewModel.pause();
  }
  @override
  Widget build(BuildContext context) {
     provider=Provider.of<AppProvider>(context);
    return  ChangeNotifierProvider(
      create: (context)=>viewModel,
      child: Center(
        child: Column(
          children: [
            if(viewModel.listRadio!=null)
            Padding(
              padding: const EdgeInsets.symmetric(vertical:40),
              child: Text(viewModel.listRadio?[viewModel.index].name??'',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: provider.isDark()?
                  Appcolor.yellowColor:Appcolor.primaryLightColor,
                ),),
            ),
            Image.asset('assets/images/radio_logo.png',height: 250,),
            Text(AppLocalizations.of(context)!.quran_radio,style: Theme.of(context).textTheme.bodyLarge,),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                PlayIcons(icon: Icons.skip_previous,onClick:viewModel.playPrevious,),
                viewModel.listRadio==null?
                CircularProgressIndicator(color:provider.isDark()?
                Appcolor.yellowColor:Appcolor.primaryLightColor,
                ):
                !viewModel.isPlayed?
                PlayIcons(icon: Icons.play_arrow,onClick: viewModel.play,):
                PlayIcons(icon: Icons.pause ,onClick: viewModel.pause,),
                PlayIcons(icon: Icons.skip_next,onClick: viewModel.playNext,)



              ],
            )

          ],
        ),
      ),
    );
  }

  @override
  void rebluid() {
    // TODO: implement rebluid
    setState(() {

    });
  }

  @override
  void showSnakeBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: provider.isDark()?Appcolor.primaryDarkColor:Appcolor.primaryLightColor,

          content: Text(message,
          style: TextStyle(color: provider.isDark()?Appcolor.yellowColor:Appcolor.whiteColor),))
    );
  }
}
class PlayIcons extends StatefulWidget{
  IconData icon;
  Function onClick;
  PlayIcons({ required this.icon,required this.onClick});

  @override
  State<PlayIcons> createState() => _PlayIconsState();
}

class _PlayIconsState extends State<PlayIcons> {
  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<AppProvider>(context);
    return InkWell(
      onTap: (){
              widget.onClick.call();
              setState(() {
                print('here');
              });
      },
      child:Icon(widget.icon,
        color:provider.isDark()? Appcolor.yellowColor:Appcolor.primaryLightColor,
        size: 50,),
    );
  }
}