// ===========================================================
// widgets/glass_card.dart
// - Reusable glass-morphism "floating card"
// - Blurred background, translucent fill, soft border & glow
// ===========================================================
import 'dart:ui';
import 'package:flutter/material.dart';

class GlassCard extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry padding;
  final double borderRadius;
  final double blurSigma;
  final double opacity;

  const GlassCard({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.all(16),
    this.borderRadius = 18,
    this.blurSigma = 16,
    this.opacity = 0.14, // translucency of the fill
  });

  @override
  Widget build(BuildContext context) {
    final radius = BorderRadius.circular(borderRadius);

    return ClipRRect(
      borderRadius: radius,
      child: BackdropFilter(
        // Frosted glass blur
        filter: ImageFilter.blur(sigmaX: blurSigma, sigmaY: blurSigma),
        child: Container(
          padding: padding,
          decoration: BoxDecoration(
            // Semi-transparent fill over the blurred background
            color: Colors.white.withOpacity(opacity),
            borderRadius: radius,
            // Gentle glassy border + subtle inner gradient
            border: Border.all(
              color: Colors.white.withOpacity(0.35),
              width: 1,
            ),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.white.withOpacity(opacity + 0.06),
                Colors.white.withOpacity(opacity - 0.02),
              ],
            ),
            // Soft drop shadow to "float" the card
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.10),
                blurRadius: 20,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: child,
        ),
      ),
    );
  }
}
