import '../../../../config.dart';
import 'package:flutter/services.dart';

class CommonTextBox extends StatelessWidget {
  final TextEditingController? controller;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String hinText;
  final String labelText;
  final InputBorder? border;
  final Color? fillColor;
  final FormFieldValidator<String>? validator;
  final bool filled;
  final bool obscureText;
  final bool readOnly;
  final FocusNode? focusNode;
  final TextInputAction? textInputAction;
  final TextInputType? keyboardType;
  final ValueChanged<String>? onFieldSubmitted;
  final String? errorText;
  final int? maxLength;
  final int? maxLines;
  final GestureTapCallback? onTap;
  final ValueChanged<String>? onChanged;
  final List<TextInputFormatter>? inputFormatters;

  const CommonTextBox(
      {Key? key,
      this.controller,
      this.suffixIcon,
      this.prefixIcon,
      this.border,
      this.hinText = "",
      this.labelText = "",
      this.fillColor,
      this.validator,
      this.focusNode,
      this.errorText,
      this.obscureText = false,
      this.readOnly = false,
      this.keyboardType,
      this.textInputAction,
      this.maxLength,
      this.maxLines,
      this.onTap,
      this.onFieldSubmitted,
      this.onChanged,
      this.inputFormatters,
      this.filled = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    InputBorder inputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppRadius.r5),
      borderSide: BorderSide.none,
    );
    return GetBuilder<AppController>(builder: (appCtrl) {
      return TextFormField(
          controller: controller,
          onChanged: onChanged,
          validator: validator,
          focusNode: focusNode,
          keyboardType: keyboardType,
          maxLines: maxLines,
          textInputAction: textInputAction,
          obscureText: obscureText,
          onFieldSubmitted: onFieldSubmitted,
          onTap: onTap,
          readOnly: readOnly,
          inputFormatters: inputFormatters,
          style: AppCss.outfitLight14
              .textColor(appCtrl.appTheme.blackColor1)
              .letterSpace(.2),
          maxLength: maxLength,
          decoration: InputDecoration(
              filled: true,
              fillColor: appCtrl.appTheme.fillColor,
              hintText: hinText.tr,
              errorText: errorText,
              counterText: "",
              hintStyle: AppCss.outfitLight14
                  .textColor(appCtrl.appTheme.txt)
                  .letterSpace(.2),
              isDense: true,
              contentPadding: const EdgeInsets.symmetric(
                  horizontal: Insets.i15, vertical: Insets.i20),
              border: border ?? inputBorder,
              focusedBorder: border ?? inputBorder,
              disabledBorder: border ?? inputBorder,
              enabledBorder: border ?? inputBorder,
              prefixIcon: prefixIcon,
              suffixIcon: suffixIcon));
    });
  }
}
