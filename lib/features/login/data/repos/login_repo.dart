import 'package:doctor_appointment_app/core/networking/api_error_handler.dart';
import 'package:doctor_appointment_app/core/networking/api_result.dart';
import 'package:doctor_appointment_app/core/networking/api_service.dart';
import 'package:doctor_appointment_app/features/login/data/models/login_request_body.dart';

class LoginRepo {
  // Repo depend on service and service depend on dio
  // Do dependency between repo and services
  final ApiService _apiService;

  LoginRepo(this._apiService);

  Future<ApiResult> login(LoginRequestBody loginRequestBody) async{
    try{
      final response = await _apiService.login(loginRequestBody);
      return ApiResult.success(response);
    }catch(error){
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}