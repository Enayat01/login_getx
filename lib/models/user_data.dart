import 'package:json_annotation/json_annotation.dart';
part 'user_data.g.dart';

@JsonSerializable()
class UserData {
  UserData({
    required this.page,
    required this.per_page,
    required this.totalrecord,
    required this.total_pages,
    required this.data,
  });

  final int page;
  final int per_page;
  final int totalrecord;
  final int total_pages;
  final List<Data?> data;

  factory UserData.fromJson(Map<String, dynamic> json) =>
      _$UserDataFromJson(json);

  Map<String, dynamic> toJson() => _$UserDataToJson(this);
}

@JsonSerializable()
class Data {
  Data({
    required this.id,
    required this.name,
    required this.email,
    required this.profilepicture,
    required this.location,
    required this.createdat,
  });

  final int id;
  final String name;
  final String email;
  final String profilepicture;
  final String location;
  final String createdat;

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}
