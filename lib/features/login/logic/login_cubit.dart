import 'package:doctor_appointment_app/features/login/data/models/login_request_body.dart';
import 'package:doctor_appointment_app/features/login/data/repos/login_repo.dart';
import 'package:doctor_appointment_app/features/login/logic/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepo _loginRepo;
  LoginCubit(this._loginRepo) : super(const LoginState.initial());

  // create the TextEditingController and formKey here
  // 1. because if i want to use it in multi files
  // 2. to get the all logic out of screen
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  void emitLoginStates() async {
    emit(const LoginState.loading());
    final response = await _loginRepo.login(
      LoginRequestBody(
        email: emailController.text,
        password: passwordController.text,
      ),
    );
    response.when(
        success: (loginResponse) async {
          // await saveUserToken(loginResponse.userData?.token ?? '');
          emit(LoginState.success(loginResponse));
        }, failure: (error) {
      emit(LoginState.error(error: error.apiErrorModel.message ?? ''));
    });
  }

// Future<void> saveUserToken(String token) async {
//   await SharedPrefHelper.setSecuredString(SharedPrefKeys.userToken, token);
//   DioFactory.setTokenIntoHeaderAfterLogin(token);
// }
}
