import 'package:dio/dio.dart';


class RetroApiWithToken {
  Dio dioData() {
    final dio = Dio();
    // dio.options.headers["Accept"] = "application/json"; // config your dio headers globally
    // dio.options.headers["Authorization"] = "Bearer ${SessionManger.getData(tokenSess)}";
    // dio.options.headers["X-localization"] = "en";
    dio.options.followRedirects = false;
    dio.options.connectTimeout = 75000; //5s
    dio.options.receiveTimeout = 6000;
    return dio;
  }
}


class RetroApiWithOutToken {
  Dio dioData() {
    final dio = Dio();
    // dio.options.headers["Accept"] = "application/json"; // config your dio headers globally
    // dio.options.headers["x-access-token"] = "${prefs!.getString(sessionToken)}";
    dio.options.headers["X-localization"] = "en";
    dio.options.followRedirects = false;
    dio.options.connectTimeout = 75000; //5s
    dio.options.receiveTimeout = 3000;
    return dio;
  }
}
