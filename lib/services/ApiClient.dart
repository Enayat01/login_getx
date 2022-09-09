import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../../models/response_data.dart';
import '../models/user_data.dart';
part 'ApiClient.g.dart';

@RestApi(baseUrl: "http://restapi.adequateshop.com/")
abstract class ApiClient {
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;
  @POST("/api/authaccount/registration") //User registration
  Future<ResponseData> register(
    @Field("name") String name,
    @Field("email") String email,
    @Field("password") String password,
  );
  @POST("/api/authaccount/login") //User login
  Future<ResponseData> login(
    @Field("email") String email,
    @Field("password") String password,
  );
  @GET("/api/users?page=1")
  Future<UserData> getAllUsersData(
    @Header("Authorization") String token,
  );
}
