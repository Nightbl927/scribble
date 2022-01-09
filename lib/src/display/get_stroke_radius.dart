import 'dart:math';

/// Get the stroke's radius, given its size, thinning and pressure.
double getStrokeRadius(double distance, double size, double pressureFactor,
    double minWidthFactor, double speedFactor, double pressure) {
  final speed = distance / (1000 / 60);
  final pressureInfluence = pressure * size * 2 * pressureFactor -
      size * pressureFactor;

  final speedInfluence = -size * speed * speedFactor;
  return max(size + pressureInfluence + speedInfluence, size * minWidthFactor);
}