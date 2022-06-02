class LoginResponseModel{
  bool? success;
  ResponseData? data;
  var message;

  LoginResponseModel({
    this.success,
    this.data,
    this.message
  });

  LoginResponseModel.fromJson(Map<String, dynamic> json){
    success = json['success'];
    data = ResponseData.fromJson(json['data']);
    message = json['message'];
  }
}

class ResponseData{
  var token;
  var user;

  ResponseData({
    this.token,
    this.user
  });

  ResponseData.fromJson(Map<String, dynamic> json){
    token = json['token'];
    user = json['user'];
  }

  Map<String, dynamic> toJson(){
    Map<String, dynamic> data = Map();
    data['token'] = token;
    data['user'] = user;

    return data;
  }
}