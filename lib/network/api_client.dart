import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:projects/network/url.dart';
import 'package:retrofit/retrofit.dart';
import 'dart:convert';

part 'api_client.g.dart';

@RestApi(baseUrl: apiUrl)
abstract class RestClient {
  factory RestClient(Dio dio, {String? baseUrl}) = _RestClient;

  // @POST(login)
  // Future<LoginModel> userLogin(@Body() Map<String, String> map);
  //
}
