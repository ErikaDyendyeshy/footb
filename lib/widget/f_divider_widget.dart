import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum DividerType { withText, withoutText }

class FDividerWidget extends StatelessWidget {
  final DividerType? type;

  final double? lineWidth;
  final double? lineHeight;
  final Color? lineColor;
  final EdgeInsetsGeometry? linePadding;

  final String? text;
  final TextStyle? textStyle;
  final EdgeInsetsGeometry? textPadding;

  const FDividerWidget({
    Key? key,
    this.type,
    this.lineWidth,
    this.lineHeight,
    this.lineColor,
    this.linePadding,
    this.text,
    this.textStyle,
    this.textPadding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: linePadding ?? EdgeInsets.zero,
      child: SizedBox(
        width: lineWidth,
        child: Row(
          children: [
            Expanded(
              child: Divider(
                height: 0,
                thickness: lineHeight ?? 1,
                color: lineColor ?? Get.theme.dividerColor,
              ),
            ),
            if (type == DividerType.withText)
              ConstrainedBox(
                constraints: const BoxConstraints(minWidth: 10),
                child: Padding(
                  padding: textPadding ??
                      const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 4,
                      ),
                  child: Text(
                    text ?? '',
                    textAlign: TextAlign.center,
                    style: textStyle ??
                        Get.textTheme.bodySmall
                  ),
                ),
              ),
            Expanded(
              child: Divider(
                height: 0,
                thickness: lineHeight ?? 1,
                color: Get.theme.dividerColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}