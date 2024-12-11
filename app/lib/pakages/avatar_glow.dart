import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';

class AvatarGlowPackage extends StatelessWidget {
  const AvatarGlowPackage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: Center(
        child: AvatarGlow(
          glowColor: Colors.grey,
       
          child: const Icon(
            Icons.menu,
            size: 50.0,
          ),
        ),
      ),
    );
  }
}
