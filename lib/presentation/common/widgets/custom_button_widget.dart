import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

// ignore: must_be_immutable
class CustomButtonWidget extends StatelessWidget {
  /// Primary button:
  /// Always have colorButton,that is primary3, non border, dont have icon
  /// textButtonColor always is white
  factory CustomButtonWidget.primary({
    required String textButton,
    Color? color,
    Color? colorText,
    double? fontSize,
    FontWeight? fontWeight,
    double? width,
    EdgeInsets? padding,
    bool isPrefixIcon = false,
    String prefixIcon = '',
    Color? colorIcon,
    VoidCallback? onTap,
    bool? isDisable,
    double? height,
    double? radius,
    TextStyle? textStyle,
    Color? colorDisable,
  }) {
    return CustomButtonWidget(
      onTap: onTap,
      textButton: textButton,
      color: color ?? Colors.white,
      colorText: colorText,
      width: width,
      padding: padding,
      isPrefixIcon: isPrefixIcon,
      prefixIcon: prefixIcon,
      colorIcon: colorIcon,
      fontSize: fontSize,
      fontWeight: fontWeight,
      isDisable: isDisable,
      height: height,
      radius: radius,
      textStyle: textStyle,
      colorDisable: colorDisable,
    );
  }

  /// secondary button:
  /// always have border, colorButton can tranparent, dont have icon
  factory CustomButtonWidget.secondary({
    required String textButton,
    Color color = Colors.transparent,
    Color? colorBorder,
    Color? colorText,
    double? fontSize,
    FontWeight? fontWeight,
    double? width,
    EdgeInsets? padding,
    bool isPrefixIcon = false,
    String prefixIcon = '',
    Color? colorIcon,
    VoidCallback? onTap,
    bool? isDisable,
    double? height,
    double? radius,
    double? widthBorder,
    TextStyle? textStyle,
  }) {
    return CustomButtonWidget(
      onTap: onTap,
      textButton: textButton,
      color: color,
      colorBorder: colorBorder ?? Colors.white,
      width: width,
      colorText: colorText ?? Colors.white,
      fontWeight: fontWeight,
      isPrefixIcon: isPrefixIcon,
      prefixIcon: prefixIcon,
      colorIcon: colorIcon,
      fontSize: fontSize,
      padding: padding,
      isDisable: isDisable,
      height: height,
      radius: radius,
      widthBorder: widthBorder,
      textStyle: textStyle,
    );
  }

  // padding
  late EdgeInsets? padding;

  // style of text
  late TextStyle? textStyle;

  // content text button
  final String? textButton;

  // Color button
  late Color? color;

  // event when tap button
  final VoidCallback? onTap;

  // colorBorder of button, transparent if null
  final Color? colorBorder;

  // check button disable
  final bool? isDisable;

  // check if have suffix icon
  /// if true, suffixIcon can not null
  late bool? isSuffixIcon;

  // check if have prefix icon
  /// if true, prefixIcon can not null
  late bool? isPrefixIcon;

  // name suffix icon
  final String? suffixIcon;

  // name prefix icon
  final String? prefixIcon;

  // size of icon both
  final double? sizeIcon;

  // color of icon both
  final Color? colorIcon;

  // radius of button
  late double? radius;

  // set width of button
  final double? width;
  final double? height;

  // margin
  final EdgeInsets? margin;

  // color text button
  final Color? colorText;

  final Color? colorDisable;

  // fontSize text
  late double? fontSize;

  // fontSize text
  late FontWeight? fontWeight;

  late Widget? prefixWidget;
  late double? widthBorder;

  CustomButtonWidget({
    super.key,
    this.padding,
    this.textStyle,
    this.textButton,
    this.color,
    this.onTap,
    this.colorBorder,
    this.isDisable,
    this.isSuffixIcon,
    this.isPrefixIcon,
    this.suffixIcon,
    this.prefixIcon,
    this.sizeIcon,
    this.colorIcon,
    this.radius,
    this.width,
    this.height,
    this.margin,
    this.colorText,
    this.fontSize,
    this.fontWeight,
    this.prefixWidget,
    this.colorDisable,
    this.widthBorder,
  }) {
    isSuffixIcon = isSuffixIcon ?? false;
    isPrefixIcon = isPrefixIcon ?? false;
    radius = radius ?? 100;
    padding = padding ??
        EdgeInsets.symmetric(
          vertical: 10,
          horizontal: isSuffixIcon! || isPrefixIcon! ? 10 : 28,
        );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      height: height,
      width: width,
      child: ElevatedButton(
        onPressed: isDisable == true ? null : onTap,
        style: _buttonStyle(),
        child: SizedBox(
          width: width,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              prefixWidget ?? const SizedBox.shrink(),
              // prefixIcon
              isPrefixIcon!
                  ? _buildIcon(
                      prefixIcon ?? '',
                      true,
                    )
                  : const SizedBox.shrink(),
              // text
              Text(
                textButton ?? '',
                style: isDisable == true
                    ? textStyle?.copyWith(
                        color: colorText,
                      )
                    : textStyle?.copyWith(
                        color: colorText,
                        fontSize: fontSize,
                      ),
              ),
              // suffixIcon
              isSuffixIcon!
                  ? _buildIcon(
                      suffixIcon ?? '',
                      false,
                    )
                  : const SizedBox.shrink(),
            ],
          ),
        ),
      ),
    );
  }

  ButtonStyle _buttonStyle() {
    return ButtonStyle(
      elevation: WidgetStateProperty.resolveWith((states) {
        return 0;
      }),
      overlayColor: WidgetStateProperty.resolveWith((states) {
        return isDisable == true ? colorDisable ?? Colors.grey : (color ?? Colors.blue).withOpacity(0.5);
      }),
      padding: WidgetStateProperty.all<EdgeInsets>(
        padding!,
      ),
      backgroundColor: WidgetStateProperty.resolveWith((states) {
        return isDisable != null && isDisable == true ? colorDisable ?? Colors.grey : color ?? Colors.transparent;
      }),
      side: WidgetStateProperty.resolveWith((states) {
        return BorderSide(
          color: isDisable != null && isDisable == true ? Colors.transparent : colorBorder ?? Colors.transparent,
          width: colorBorder != null ? (widthBorder ?? 1.5) : 0,
        );
      }),
      shape: WidgetStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius!),
        ),
      ),
    );
  }

  _buildIcon(
    String icon,
    bool leftOrRight,
  ) {
    return Padding(
      padding: EdgeInsets.only(
        right: leftOrRight ? 12 : 0,
        left: leftOrRight ? 0 : 12,
      ),
      child: SvgPicture.asset(
        icon,
        colorFilter: isDisable == null || isDisable == false
            ? ColorFilter.mode(colorIcon!, BlendMode.srcIn)
            : const ColorFilter.mode(Colors.grey, BlendMode.srcIn),
        width: sizeIcon ?? 16,
        height: sizeIcon ?? 16,
      ),
    );
  }
}
