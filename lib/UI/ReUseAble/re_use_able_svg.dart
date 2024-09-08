import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ReUseAbleSvg extends StatefulWidget {
  final String path;
  const ReUseAbleSvg({super.key , required this.path});

  @override
  State<ReUseAbleSvg> createState() => _ReUseAbleSvgState();
}

class _ReUseAbleSvgState extends State<ReUseAbleSvg> {
  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
        widget.path,
        semanticsLabel: 'Acme Logo',
      fit: BoxFit.cover,
    );
  }
}


