import 'package:doctor_appointment_app/core/theming/styles.dart';
import 'package:doctor_appointment_app/core/widgets/app_text_button.dart';
import 'package:doctor_appointment_app/features/login/ui/widgets/terms_and_conditions_text.dart';
import 'package:doctor_appointment_app/features/sign_up/logic/sign_uo_cubit.dart';
import 'package:doctor_appointment_app/features/sign_up/ui/widgets/already_have_account_text.dart';
import 'package:doctor_appointment_app/features/sign_up/ui/widgets/sign_up_bloc_listener.dart';
import 'package:doctor_appointment_app/features/sign_up/ui/widgets/sign_up_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.h),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Create Account',
                  style: TextStyles.font24BlueBold,
                ),
                SizedBox(
                  height: 8.h,
                ),
                Text(
                  'Sign up now and start exploring all that our app has to offer. We\'re excited to welcome you to our community!',
                  style: TextStyles.font14GrayRegular,
                ),
                SizedBox(
                  height: 36.h,
                ),
                Column(
                  children: [
                    const SignupForm(),
                    SizedBox(
                      height: 40.h,
                    ),
                    AppTextButton(
                      buttonText: "Create Account",
                      textStyle: TextStyles.font16WhiteSemiBold,
                      onPressed: () {
                        validateThenDoSignup(context);
                      },
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    const TermsAndConditionsText(),
                    SizedBox(
                      height: 30.h,
                    ),
                    const AlreadyHaveAccountText(),
                    const SignupBlocListener(),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void validateThenDoSignup(BuildContext context) {
    if (context.read<SignupCubit>().formKey.currentState!.validate()) {
      context.read<SignupCubit>().emitSignupStates();
    }
  }
}