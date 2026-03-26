import '../../../model/artists/artists.dart';

abstract class ArtistRepository {
  Future<List<Artist>> fetchArtists();
}
