import 'package:test_scribble/scribble.dart';

import 'get_stroke_outline_points.dart';
import 'get_stroke_points.dart';
import 'package:test_scribble/src/model/sketch/point/point.dart';

/// Get an array of points describing a polygon that surrounds the input [points].
///
/// The [size] argument sets the base diameter for the shape.
///
/// The [thinning] argument sets the effect of pressure on the stroke's size.
///
/// The [smoothing] argument sets the density of points along the stroke's edges.
///
/// The [streamline] argument sets the level of variation allowed in the input points.
///
/// The [taperStart] argument sets the distance to taper the front of the stroke.
///
/// The [capStart] argument sets whether to add a cap to the start of the stroke.
///
/// The [taperEnd] argument sets the distance to taper the end of the stroke.
///
/// The [capEnd] argument sets whether to add a cap to the end of the stroke.
///
/// The [simulatePressure] argument sets whether to simulate pressure or use the point's provided pressures.
///
/// The [isComplete] argument sets whether the line is complete.
List<Point> getStroke(
    SketchLine line, {
      required double pressureFactor,
      required double minWidthFactor,
      required double speedFactor,
      double smoothing = 0.0,
      double streamline = 1.0,
      double taperStart = 0.0,
      double taperEnd = 0.0,
      bool capStart = true,
      bool capEnd = true,
      bool isComplete = true,
    }) {
  return getStrokeOutlinePoints(
    getStrokePoints(
      line.points,
      size: line.width,
      pressureFactor: pressureFactor,
      minWidthFactor: minWidthFactor,
      speedFactor: speedFactor,
      smoothing: smoothing,
      streamline: streamline,
      taperStart: taperStart,
      capStart: capStart,
      taperEnd: taperEnd,
      capEnd: capEnd,
      isComplete: isComplete,
    ),
    size: line.width,
    pressureFactor: pressureFactor,
    minWidthFactor: minWidthFactor,
    speedFactor: speedFactor,
    smoothing: smoothing,
    streamline: streamline,
    taperStart: taperStart,
    capStart: capStart,
    taperEnd: taperEnd,
    capEnd: capEnd,
    isComplete: isComplete,
  );
}