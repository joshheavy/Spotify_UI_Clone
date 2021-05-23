import 'package:flutter/material.dart';
import 'package:spotify_clone/models/models.dart';

class CurrentSongModel extends ChangeNotifier {
  Song? selected;

  void selectSong(Song song) {
    selected = song;
    notifyListeners();
  }
}
