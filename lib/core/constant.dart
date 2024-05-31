import 'package:flutter/material.dart';

class colors{
  static int  correctAnswers=0;
  static Color primary=Color(0xFFB1666E);
  static Color secandry=Color(0xFF8D376F);
 static RadialGradient radialGradient=const RadialGradient(
                radius: 0.6,
                center: Alignment.center,
                stops: [0.1,1.0],
                colors: [
                  Color(0xFFB1666E),
                  Color(0xFF8D376F),
                ]
            );
}