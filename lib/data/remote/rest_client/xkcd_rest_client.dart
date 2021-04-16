import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:xkcd_comics_viewer/data/remote/model/xkcd_comic.dart';

part 'xkcd_rest_client.g.dart';

@RestApi(baseUrl: 'https://xkcd.com')
abstract class XkcdRestClient {
  factory XkcdRestClient(Dio dio, {String baseUrl}) = _XkcdRestClient;

  @GET("/info.0.json")
  Future<XkcdComic> getLatestComic();

  @GET("/{id}/info.0.json")
  Future<XkcdComic> getComic(@Path("id") int id);
}
