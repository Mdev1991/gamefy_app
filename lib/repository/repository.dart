import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';
import 'package:GameFy/model/game_response.dart';

class GameRepository {
  static String mainUrl = "https://api.igdb.com/v4";
  var gameListUrl = '$mainUrl/games';
  final String clientId = "ikefu3gjaojsnnt21ik7orxyofnztq";
  final String bearerToken = "Bearer 7uv1sowo4x4i6caxgdafq58tczc8f8";
  final Dio _dio = Dio();

  Future<GameResponse> getGames() async {
    try {
      _dio.interceptors
          .add(InterceptorsWrapper(onRequest: (RequestOptions options) async {
        options.headers["Client-ID, Authorization"] = "$clientId, $bearerToken";
        _dio.interceptors.requestLock.unlock();
        return options;
      }));
      Response response = await _dio.post(gameListUrl,
          data:
              "fields artworks,bundles,category,checksum,collection,cover.*,created_at,first_release_date,follows,game_engines.*,game_modes.*,genres.*,hypes,keywords.*,multiplayer_modes,name,parent_game,platforms.*, platforms.platform_logo.*, player_perspectives.*,rating,rating_count,screenshots.*,slug,standalone_expansions,status,storyline,summary,tags,total_rating,total_rating_count,updated_at,url,version_parent,version_title,videos.*;");
      return GameResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return GameResponse.withError("$error");
    }
  }

  Future<GameResponse> getGames2(int platformId) async {
    var response = await http.post(gameListUrl,
        headers: {"Client-ID": "$clientId", "Authorization": "$bearerToken"},
        body:
            "fields artworks,bundles,category,checksum,collection,cover.*,created_at,first_release_date,follows,game_engines.*,game_modes.*,release_dates, genres.*,hypes,keywords.*,multiplayer_modes,name,parent_game,platforms.*, platforms.platform_logo.*, player_perspectives.*,rating,rating_count,screenshots.*,slug,standalone_expansions,status,storyline,summary,tags,total_rating,total_rating_count,updated_at,url,version_parent,version_title,videos.*;where cover.image_id != null & genres != null & videos != null & created_at > 1252214987 & platforms = $platformId & rating > 80; limit 100;");
    print("${response.body}");
    return GameResponse.fromJson(jsonDecode(response.body));
  }

  Future<GameResponse> getSlider(int platformId) async {
    var response = await http.post(gameListUrl,
        headers: {"Client-ID": "$clientId", "Authorization": "$bearerToken"},
        body:
            "fields artworks,bundles,category,checksum,collection,cover.*,created_at,first_release_date,follows,game_engines.*,game_modes.*,release_dates, genres.*,hypes,keywords.*,multiplayer_modes,name,parent_game,platforms.*, platforms.platform_logo.*, player_perspectives.*,rating,rating_count,screenshots.*,slug,standalone_expansions,status,storyline,summary,tags,total_rating,total_rating_count,updated_at,url,version_parent,version_title,videos.*;where cover.image_id != null & screenshots != null & created_at > 1252214987 & platforms = $platformId; limit 100; sort created_at asc;");
    print("${response.body}");
    return GameResponse.fromJson(jsonDecode(response.body));
  }
}
