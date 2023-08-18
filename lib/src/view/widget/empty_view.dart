import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import '../../res/assets.dart';

class Emptyview extends StatelessWidget {
  const Emptyview({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Lottie.asset(
          AnimationAsset.empty,
        ),
        Text(
          "there look empty here",
          style: GoogleFonts.poppins(
            fontSize: 20,
          ),
        ),
      ],
    );
  }
}
