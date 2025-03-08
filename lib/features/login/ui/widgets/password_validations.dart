import 'package:doctor_appointment_app/core/theming/my_colors.dart';
import 'package:doctor_appointment_app/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PasswordValidations extends StatelessWidget {
  final bool hasLowerCase;
  final bool hasUpperCase;
  final bool hasSpecialCharacters;
  final bool hasNumber;
  final bool hasMinLength;

  const PasswordValidations({
    super.key,
    required this.hasLowerCase,
    required this.hasUpperCase,
    required this.hasSpecialCharacters,
    required this.hasNumber,
    required this.hasMinLength,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BuildValidationRow('At least 1 lowercase letter', hasLowerCase),
        SizedBox(
          height: 2.h,
        ),
        BuildValidationRow('At least 1 uppercase letter', hasUpperCase),
        SizedBox(
          height: 2.h,
        ),
        BuildValidationRow('At least 1 special character', hasSpecialCharacters),
        SizedBox(
          height: 2.h,
        ),
        BuildValidationRow('At least 1 number', hasNumber),
        SizedBox(
          height: 2.h,
        ),
        BuildValidationRow('At least 8 character long', hasMinLength),
      ],
    );
  }
  Widget BuildValidationRow(String text, bool hasValidated) {
    return Row(
      children: [
        const CircleAvatar(
          radius: 2.5,
          backgroundColor: MyColors.myGrey,
        ),
        SizedBox(
          width: 6.w,
        ),
        Text(
          text,
          style: TextStyles.font13DarkBlueRegular.copyWith(
            decoration:  hasValidated ? TextDecoration.lineThrough : null,
            decorationColor: Colors.green,
            decorationThickness: 2,
            color: hasValidated ? MyColors.myGrey : MyColors.myDarkBlue,
          ),
        )
      ],
    );
  }
}
