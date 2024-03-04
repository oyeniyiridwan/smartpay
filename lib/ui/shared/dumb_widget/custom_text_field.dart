import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_pay/utils/constants/app_styles.dart';
import 'package:smart_pay/utils/constants/colors.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {Key? key,
      this.enable = true,
      this.hintText,
      this.textEditingController,
      this.hasSuffixIcon = false,
      this.onSuffixIconPressed,
      this.suffixIcon,
      this.focusNode,
      this.initialValue,
      this.keyboardType,
      this.inputFormatters,
      this.readOnly,
      this.suffixIconSize,
      this.obscureText = false,
      this.onChanged,
      this.maxLines,
      this.onTap,
      this.formHeight,
      this.scrollPadding,
      this.showFloat = true,
      this.suffixButton,
      this.maxLength,
      this.onEditingComplete,
      this.onSaved,
      this.onTapOutside,
      this.onFieldSubmitted,
      this.validator})
      : super(key: key);

  final bool? enable;
  final EdgeInsets? scrollPadding;
  final String? hintText;
  final Widget? suffixButton;
  final String? initialValue;
  final double? suffixIconSize;
  final bool showFloat;
  final bool? readOnly;
  final int? maxLines;
  final int? maxLength;
  final bool hasSuffixIcon;
  final bool obscureText;
  final double? formHeight;
  final IconData? suffixIcon;
  final FocusNode? focusNode;
  final TextInputType? keyboardType;
  final TextEditingController? textEditingController;
  final List<TextInputFormatter>? inputFormatters;
  final void Function()? onSuffixIconPressed;
  final void Function()? onEditingComplete;
  final void Function(String?)? onSaved;
  final void Function(String)? onChanged;
  final void Function()? onTap;
  final void Function(String)? onFieldSubmitted;

  final void Function(PointerDownEvent event)? onTapOutside;
  final FormFieldValidator<String>? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: enable,
      obscuringCharacter: '•',
      maxLines: maxLines ?? 1,
      maxLength: maxLength,
      readOnly: readOnly ?? false,
      obscureText: obscureText,
      initialValue: initialValue,
      focusNode: focusNode,
      controller: textEditingController,
      validator: validator,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      style: AppStyles.mainTextNormal(18.sp).copyWith(
        color: AppColors.primaryColor,
        // letterSpacing: obscureText ? 0.5.w : null
      ),
      onFieldSubmitted: onFieldSubmitted,
      showCursor: true,
      autocorrect: false,
      cursorColor: AppColors.primaryColor,
      keyboardType: keyboardType ?? TextInputType.text,
      inputFormatters: inputFormatters ?? [],
      onChanged: onChanged,
      onSaved: onSaved,
      onEditingComplete: onEditingComplete,
      onTapOutside: onTapOutside,
      onTap: onTap,
      decoration: InputDecoration(
        fillColor: AppColors.greyColor,
        constraints: BoxConstraints(maxHeight: 80.h, minHeight: 60.h),
        filled: true,
        errorStyle: AppStyles.mainTextNormal(10.sp).copyWith(
          color: Colors.red,

          // letterSpacing: obscureText ? 0.5.w : null
        ),
        alignLabelWithHint: false,
        suffixIconColor: AppColors.inActiveColor,
        hintText: hintText ?? '',
        hintStyle: TextStyle(
          color: AppColors.inActiveColor,
          fontSize: 15.sp,
          fontWeight: FontWeight.w400,
        ),
        focusColor: AppColors.greyColor,
        suffixIcon: hasSuffixIcon == true ? suffixButton : null,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(20.r),
          ),
          borderSide: BorderSide(
            width: 1.h,
            color: AppColors.greyColor,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(20.r),
          ),
          borderSide: BorderSide(
            width: 1.sp,
            color: AppColors.activeTextFormColor,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(20.r),
          ),
          borderSide: BorderSide(
            width: 1.h,
            color: AppColors.greyColor,
          ),
        ),
      ),
    );
  }
}
