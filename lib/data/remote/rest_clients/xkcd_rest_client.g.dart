// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'xkcd_rest_client.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _XkcdRestClient implements XkcdRestClient {
  _XkcdRestClient(this._dio, {this.baseUrl}) {
    baseUrl ??= 'https://xkcd.com';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<XkcdComic> getLatestComic() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<XkcdComic>(
            Options(method: 'GET', headers: <String, dynamic>{}, extra: _extra)
                .compose(_dio.options, '/info.0.json',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = XkcdComic.fromJson(_result.data!);
    return value;
  }

  @override
  Future<XkcdComic> getComic(id) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<XkcdComic>(
            Options(method: 'GET', headers: <String, dynamic>{}, extra: _extra)
                .compose(_dio.options, '/$id/info.0.json',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = XkcdComic.fromJson(_result.data!);
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
