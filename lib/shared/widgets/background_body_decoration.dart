import 'package:flutter/material.dart';

class BoxDecorationBackground extends BoxDecoration {
  BoxDecorationBackground({
    Image? image,
  }) : super(
          image: DecorationImage(
              colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.5), BlendMode.darken),
              image: const NetworkImage(
                  'https://img.freepik.com/free-photo/flat-lay-health-still-life-arrangement-with-copy-space_23-2148854064.jpg'),
              fit: BoxFit.cover),
        );
}
