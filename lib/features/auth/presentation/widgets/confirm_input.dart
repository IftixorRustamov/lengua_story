import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lingua_story/core/common/constants/colors/app_colors.dart';
import 'package:pinput/pinput.dart';
import '../../../../core/utils/app_responsive.dart';

class ConfirmInput extends StatelessWidget {
  const ConfirmInput({
    super.key,
    this.pinController,
    this.focusNode,
    required this.onCompleted,
    this.validator,
    this.onChanged,
    this.length = 6,
    this.horizontalPadding = 12,
    this.errorText,
  });

  final TextEditingController? pinController;
  final FocusNode? focusNode;
  final int length;
  final int horizontalPadding;
  final String? Function(String? pin)? validator;
  final Function(String pin) onCompleted;
  final Function(String pin)? onChanged;
  final String? errorText;

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      margin: EdgeInsets.symmetric(horizontal: appW(2)),
      width: appW(46),
      height: appH(44),
      textStyle: Theme.of(context).textTheme.titleMedium?.copyWith(
        fontSize: 22,
        fontWeight: FontWeight.w700,
        color: Colors.black,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 6,
            offset: Offset(0, 6),
          ),
        ],
        border: Border.all(color: Colors.transparent),
      ),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Pinput(
          onChanged: onChanged,
          length: length,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          defaultPinTheme: defaultPinTheme,
          controller: pinController,
          focusNode: focusNode,
          validator: validator,
          onCompleted: onCompleted,
          cursor: Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: EdgeInsets.only(bottom: appH(8)),
              height: appH(3),
              width: appW(13),
              decoration: BoxDecoration(
                color: Theme.of(context).canvasColor,
                borderRadius: BorderRadius.circular(4),
              ),
            ),
          ),
          focusedPinTheme: defaultPinTheme.copyWith(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.08),
                  blurRadius: 20,
                  offset: Offset(0, 8),
                ),
              ],
              border: Border.all(color: AppColors.primary, width: appW(1.5)),
            ),
          ),
          errorPinTheme: defaultPinTheme.copyWith(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.red.withOpacity(0.08),
                  blurRadius: 20,
                  offset: Offset(0, 8),
                ),
              ],
              border: Border.all(color: Colors.red, width: appW(1)),
            ),
          ),
        ),

        // 👇 Error text below the pin input
        if (errorText != null)
          Padding(
            padding: EdgeInsets.only(top: appH(6), left: appW(8)),
            child: Text(
              errorText!,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                fontSize: 12,
                color: Colors.red,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
      ],
    );
  }
}
