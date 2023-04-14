import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marquee/marquee.dart';

class AnimationTextWelcome extends StatelessWidget {
  const AnimationTextWelcome({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 28,
      child: Marquee(
        text:
            'Gracias por visitar MARVEL APP. Encontremos tu personaje favorito.  ',
        style: GoogleFonts.marvel(
          textStyle: const TextStyle(shadows: [
            Shadow(
              color: Color.fromARGB(255, 255, 0, 0),
              offset: Offset(2, 2),
              blurRadius: 3,
            ),
          ], color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
        ),
        velocity: 50.0,
        pauseAfterRound: const Duration(milliseconds: 100),
        startPadding: 10.0,
        accelerationDuration: const Duration(seconds: 1),
        accelerationCurve: Curves.easeInBack,
        decelerationDuration: const Duration(milliseconds: 500),
        decelerationCurve: Curves.easeOut,
      ),
    );
  }
}
