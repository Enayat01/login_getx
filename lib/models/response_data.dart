import 'package:json_annotation/json_annotation.dart';
part 'response_data.g.dart';

@JsonSerializable()
class ResponseData {
  ResponseData({
    required this.code,
    required this.message,
    required this.data,
  });

  final int code;
  final String message;
  final Data? data;

  factory ResponseData.fromJson(Map<String, dynamic> json) =>
      _$ResponseDataFromJson(json);

  Map<String, dynamic> toJson() => _$ResponseDataToJson(this);
}

@JsonSerializable()
class Data {
  Data({
    required this.Id,
    required this.Name,
    required this.Email,
    required this.Token,
  });

  final int Id;
  final String Name;
  final String Email;
  final String Token;

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}
