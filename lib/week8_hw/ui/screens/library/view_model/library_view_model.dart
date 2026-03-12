import 'package:flutter/material.dart';
import '../../../../data/repositories/songs/song_repository.dart';
import '../../../states/player_state.dart';
import '../../../../model/songs/song.dart';

enum LibraryState { error, loading, success }

class LibraryViewModel extends ChangeNotifier {
  final SongRepository songRepository;
  final PlayerState playerState;

  List<Song>? _songs;
  LibraryState state = LibraryState.loading;

  LibraryViewModel({required this.songRepository, required this.playerState}) {
    playerState.addListener(notifyListeners);

    // init
    _init();
  }

  List<Song> get songs => _songs == null ? [] : _songs!;

  @override
  void dispose() {
    playerState.removeListener(notifyListeners);
    super.dispose();
  }
  String? errorMessage;
  
  void _init() async {
    // 1 - Fetch songs
    state = LibraryState.loading;

    try {
      _songs = await songRepository.fetchSongs();
      state = LibraryState.success;
    } catch (e) {
      state = LibraryState.error;
      errorMessage = e.toString();
    }
    // 2 - notify listeners
    notifyListeners();
  }

  bool isSongPlaying(Song song) => playerState.currentSong == song;

  void start(Song song) => playerState.start(song);
  void stop(Song song) => playerState.stop();
}
