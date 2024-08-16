import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:islamic_app/api/api_manager.dart';
import 'package:islamic_app/homepage/radio_tap/radio_navigator.dart';
import 'package:islamic_app/model/RadioResponse.dart';

class RadioTapViewModel extends ChangeNotifier {
  late RadioNavigator navigator;
  final player = AudioPlayer();
  bool isPlayed = false;
  List<Radios>? listRadio;
  int index = 0;

  Future<void> play() async {
    if (listRadio != null && listRadio!.isNotEmpty) {
      if (!isPlayed) {
        await player.play(UrlSource(listRadio![index].url!));
        isPlayed = true;
      } else {
        await pause();
      }
      notifyListeners();
      navigator.rebluid();
    }
  }

  Future<void> playNext() async {
    if (listRadio != null && index < listRadio!.length - 1) {
      index++;
      await pause();
      await play();
    } else {
      navigator.showSnakeBar('Reached the end');
      print('Reached the end of the list.');
    }
  }

  Future<void> playPrevious() async {
    if (listRadio != null && index > 0) {
      index--;
      await pause();
      await play();
    } else {
      navigator.showSnakeBar('Already at the beginning');
      print('Already at the beginning of the list.');
    }
  }

  Future<void> pause() async {
    if (isPlayed) {
      await player.pause();
      isPlayed = false;
      notifyListeners();
      navigator.rebluid();
    }
  }



  Future<void> getRadioList(String languageCode) async {
    RadioResponse response = await ApiManager.getFromApi(languageCode);
    listRadio = response.radios;
    print('Number of radios fetched: ${listRadio?.length}');
    notifyListeners();
    navigator.rebluid();
  }
}
