import 'package:flutter/material.dart';
import '../../../../data/repositories/songs/song_repository.dart';
import '../../../states/player_state.dart';
import '../../../../model/songs/song.dart';

class LibraryViewModel extends ChangeNotifier {
  final SongRepository songRepository;
  final PlayerState playerState;

  LibraryViewModel({required this.songRepository, required this.playerState});
  List<Song> _songs = [];
  List<Song> get songs => _songs;

  Song? get currentSong => playerState.currentSong;

  void init() {
    _songs = songRepository.fetchSongs();
    playerState.addListener(() {
      notifyListeners();
    });

    notifyListeners();
  }

  bool isSongPlaying(Song song) => playerState.currentSong == song;

  void play(Song song) {
    playerState.start(song);

  }

  void stop(Song song) {
    playerState.stop();

  }
}
