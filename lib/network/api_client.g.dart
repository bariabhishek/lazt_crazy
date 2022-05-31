// GENERATED CODE - D`O NOT MODIFY BY HAND

part of 'api_client.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _RestClient implements RestClient {
  final Dio _dio;
  String? baseUrl;

  _RestClient(this._dio, {this.baseUrl}) {
    baseUrl ??= apiUrl;
  }

  // @override
  // Future<LoginModel> userLogin(map) async {
  //   const _extra = <String, dynamic>{};
  //   final queryParameters = <String, dynamic>{};
  //   final _data = <String, dynamic>{};
  //   _data.addAll(map);
  //   final _result = await _dio.fetch<Map<String, dynamic>>(
  //       _setStreamType<LoginModel>(
  //           Options(method: 'POST', headers: <String, dynamic>{}, extra: _extra)
  //               .compose(_dio.options, login,
  //                   queryParameters: queryParameters, data: _data)
  //               .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
  //   final value = LoginModel.fromJson(_result.data!);
  //   if (kDebugMode) {
  //     log("userLogin response " + _result.data.toString());
  //   }
  //   return value;
  // }


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
