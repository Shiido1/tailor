import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

// ignore: must_be_immutable
class PurpleBackgroundWidget extends StatelessWidget {
  PurpleBackgroundWidget({
    this.valueScaffold,
    this.onOptionTapped,
  });
  var valueScaffold;
  final VoidCallback onOptionTapped;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: Stack(
        children: [
          SvgPicture.asset('assets/rectangle.svg'),
          Positioned(
            top: 10,
            right: 10,
            bottom: 25,
            child: InkWell(
              onTap: onOptionTapped,
              child: SvgPicture.asset('assets/menu.svg'),
            ),
          ),
        ],
      ),
    );
  }
}
