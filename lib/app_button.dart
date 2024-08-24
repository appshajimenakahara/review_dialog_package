import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.height,
    required this.width,
    required this.title,
    this.color,
    this.fontWeight,
    this.fontSize,
    this.fontColor,
    this.borderColor,
    this.showArrow,
    this.horizontalPadding,
    this.margin,
    required this.onPressed,
  });

  final double height;
  final double width;
  final String title;
  final Color? color;
  final double? fontSize;
  final Color? fontColor;
  final Color? borderColor;
  final bool? showArrow;
  final double? horizontalPadding;
  final FontWeight? fontWeight;
  final EdgeInsetsGeometry? margin;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      margin: margin != null ? margin! : const EdgeInsets.only(left: 2, right: 2, top: 5, bottom: 10),
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
          side: BorderSide(
            color: borderColor ?? Colors.transparent,
          ),
          backgroundColor: color ?? Colors.blue.shade800,
          textStyle: const TextStyle(
            fontSize: 20,
            fontFamily: 'HiraginoKakuGothicProN',
          ),
        ),
        onPressed: () async {
          onPressed();
        },
        child: Padding(
          padding: EdgeInsets.only(
            left: horizontalPadding != null ? horizontalPadding! : 4,
            right: showArrow == true ? 4 : (horizontalPadding != null ? horizontalPadding! : 4),
          ),
          child: (showArrow != true)
              ? Text(
            title,
            style: TextStyle(
              color: fontColor ?? Colors.white,
              fontFamily: 'HiraginoKakuGothicProN',
              fontWeight: fontWeight ?? FontWeight.normal,
              fontSize: fontSize ?? 20,
            ),
          )
              : Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(
                  color: fontColor ?? Colors.white,
                  fontFamily: 'HiraginoKakuGothicProN',
                  fontWeight: fontWeight ?? FontWeight.normal,
                  fontSize: fontSize ?? 20,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}