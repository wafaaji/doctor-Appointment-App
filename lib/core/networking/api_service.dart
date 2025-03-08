import 'package:dio/dio.dart';
import 'package:doctor_appointment_app/core/networking/api_constants.dart';
import 'package:doctor_appointment_app/features/login/data/models/login_request_body.dart';
import 'package:doctor_appointment_app/features/login/data/models/login_response.dart';
import 'package:doctor_appointment_app/features/sign_up/data/models/sign_up_request_body.dart';
import 'package:doctor_appointment_app/features/sign_up/data/models/sign_up_response.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';

part 'api_service.g.dart';

// RestApi annotation for retrofit
@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class ApiService{
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @POST(ApiConstants.login)
  Future<LoginResponse> login(
      @Body() LoginRequestBody loginRequestBody,
      );
  //
  @POST(ApiConstants.signup)
  Future<SignupResponse> signup(
      @Body() SignupRequestBody signupRequestBody,
      );
}