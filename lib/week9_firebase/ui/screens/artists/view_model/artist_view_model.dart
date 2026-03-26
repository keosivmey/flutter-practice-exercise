import 'package:flutter/material.dart';
import '../../../../model/artists/artists.dart';
import '../../../../data/repositories/artists/artist_repository.dart';
import '../../../utils/async_value.dart';

class ArtistViewModel extends ChangeNotifier {
  final ArtistRepository artistRepository;

  AsyncValue<List<Artist>> artistValue = AsyncValue.loading();

  ArtistViewModel({required this.artistRepository}) {
    init(); //fetch the artist
  }

  void init() async {
    fetchArtists();
  }

  // fetch all artist
  void fetchArtists() async {
    artistValue = AsyncValue.loading();
    notifyListeners();

    try {
      List<Artist> artists = await artistRepository.fetchArtists();

      artistValue = AsyncValue.success(artists);
    } catch (e) {
      artistValue = AsyncValue.error(e);
    }

    notifyListeners();
  }
}
