import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomSurffixIcon extends StatelessWidget {
  final String svgIcon;
  final double? width;
  final double? height;

  const CustomSurffixIcon({
    required this.svgIcon,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 20, 20, 20),
      child: SvgPicture.asset(
        svgIcon,
        width: width,
        height: height,
      ),
    );
  }
}
