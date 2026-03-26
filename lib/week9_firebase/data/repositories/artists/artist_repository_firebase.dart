import 'dart:convert';

import '../../../data/dtos/artist_dto.dart';
import '../../../data/repositories/artists/artist_repository.dart';
import '../../../model/artists/artists.dart';
import 'package:http/http.dart' as http;

class ArtistRepositoryFirebase extends ArtistRepository {
  final Uri artistUri = Uri.http(
    'w9-database-81acf-default-rtdb.asia-southeast1.firebasedatabase.app',
    '/artists.json',
  );

  @override
  Future<List<Artist>> fetchArtists() async {
    final http.Response response = await http.get(artistUri);

    if (response.statusCode == 200) {
      Map<String, dynamic> artistJson = json.decode(response.body);
      List<Artist> artists = [];

      for (var artist in artistJson.entries) {
        artists.add(ArtistDto.fromJson(artist.key, artist.value));
      }
      return artists;
    } else {
      throw Exception('Failed to laod artist');
    }
  }
}
