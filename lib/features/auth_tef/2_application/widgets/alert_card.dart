import 'package:empresas/configs/colors.dart';
import 'package:empresas/theme.dart';
import 'package:flutter/material.dart';

enum AlertCardType { success, info, warn, wrong }

class AlertCardColors {
  final Color borderColor;
  final Color backgroundColor;

  AlertCardColors({
    required this.borderColor, 
    required this.backgroundColor
  });
}

final Map<AlertCardType, AlertCardColors> _colors = {
  AlertCardType.success: AlertCardColors(borderColor: AppColors.colorSuccess100, backgroundColor: AppColors.colorSuccess10),
  AlertCardType.info: AlertCardColors(borderColor: AppColors.colorInfo100, backgroundColor: AppColors.colorInfo10),
  AlertCardType.warn: AlertCardColors(borderColor: AppColors.colorWarn100, backgroundColor: AppColors.colorWarn10),
  AlertCardType.wrong: AlertCardColors(borderColor: AppColors.colorWrong100, backgroundColor: AppColors.colorWrong10),
};

class AlertCard extends StatelessWidget {
  final String mainText;
  final List<TextSpan>? childrenText;
  final AlertCardType alertCardType;

  const AlertCard({
    super.key,
    required this.mainText,
    required this.alertCardType,
    this.childrenText
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: _colors[alertCardType]!.backgroundColor,
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: _colors[alertCardType]!.borderColor)
      ),
      child: RichText(
        text: TextSpan(
          text: mainText,
          style: const TextStyle(color: AppColors.fontColor, fontFamily: AppTheme.fontFamily, fontWeight: FontWeight.w400),
          children: childrenText,
        ),
      ),
    );
  }
}