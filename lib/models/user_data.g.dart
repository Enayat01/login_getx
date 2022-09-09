// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserData _$UserDataFromJson(Map<String, dynamic> json) => UserData(
      page: json['page'] as int,
      per_page: json['per_page'] as int,
      totalrecord: json['totalrecord'] as int,
      total_pages: json['total_pages'] as int,
      data: (json['data'] as List<dynamic>)
          .map((e) =>
              e == null ? null : Data.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$UserDataToJson(UserData instance) => <String, dynamic>{
      'page': instance.page,
      'per_page': instance.per_page,
      'totalrecord': instance.totalrecord,
      'total_pages': instance.total_pages,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      id: json['id'] as int,
      name: json['name'] as String,
      email: json['email'] as String,
      profilepicture: json['profilepicture'] as String,
      location: json['location'] as String,
      createdat: json['createdat'] as String,
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'profilepicture': instance.profilepicture,
      'location': instance.location,
      'createdat': instance.createdat,
    };
