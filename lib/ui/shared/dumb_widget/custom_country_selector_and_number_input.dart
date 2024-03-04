import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_pay/utils/constants/app_styles.dart';

class CustomCountrySelector extends StatelessWidget {
  const CustomCountrySelector({
    Key? key,
    required this.onTap,
    this.labelText,
    this.focusNode,
    this.initialCountryCode,
    this.showFloat = false,
    this.height,
  }) : super(key: key);

  final String? labelText;
  final FocusNode? focusNode;
  final Function(CountryCode) onTap;
  final String? initialCountryCode;
  final bool showFloat;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return CountryCodePicker(
      hideMainText: true,
      onChanged: (selectedCountry) {
        onTap(selectedCountry);
      },
      showFlagMain: true,
      padding: EdgeInsets.all(0),
      initialSelection: initialCountryCode ?? 'NG',
      showFlagDialog: true,
      textStyle: AppStyles.mainTextNormal(17.sp),
      dialogSize: Size(double.infinity, 0.7.sh),
      flagWidth: 40.w,
      searchDecoration: InputDecoration(
        hintText: 'Select your country',
        hintStyle: AppStyles.mainTextNormal(17.sp),
      ),
    );
  }
}
