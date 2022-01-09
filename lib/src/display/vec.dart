import 'dart:math';
import 'package:test_scribble/src/model/sketch/point/point.dart';

/// Various (mostly vector) math helpers. Each function returns a new Point.
Point neg(Point A) {
  return Point(-A.x, -A.y, pressure: A.pressure);
}

Point add(Point A, Point B) {
  return Point(A.x + B.x, A.y + B.y, pressure: B.pressure);
}

Point sub(Point A, Point B) {
  return Point(A.x - B.x, A.y - B.y, pressure: B.pressure);
}

Point mulV(Point A, Point B) {
  return Point(A.x * B.x, A.y * B.y, pressure: B.pressure);
}

Point divV(Point A, Point B) {
  return Point(A.x / B.x, A.y / B.y, pressure: B.pressure);
}

Point mul(Point A, double s) {
  return Point(A.x * s, A.y * s, pressure: A.pressure);
}

Point div(Point A, double s) {
  return Point(A.x / s, A.y / s, pressure: A.pressure);
}

Point per(Point A) {
  return Point(A.y, -A.x, pressure: A.pressure);
}

Point uni(Point A) {
  return div(A, len(A));
}

Point lrp(Point A, Point B, double t) {
  return add(A, mul(sub(B, A), t));
}

Point med(Point A, Point B) {
  return lrp(A, B, .5);
}

Point prj(Point A, Point B, double d) {
  return add(A, mul(B, d));
}

Point rotAround(Point A, Point C, double r) {
  final s = sin(r);
  final c = cos(r);
  final px = A.x - C.x;
  final py = A.y - C.y;
  final nx = px * c - py * s;
  final ny = px * s + py * c;
  return Point(nx + C.x, ny + C.y);
}

bool isEqual(Point A, Point B) {
  return A.x == B.x && A.y == B.y;
}

double len(Point A) {
  return sqrt(len2(A));
}

double len2(Point A) {
  return A.x * A.x + A.y * A.y;
}

double dist2(Point A, Point B) {
  return len2(sub(A, B));
}

double dist(Point A, Point B) {
  return len(sub(A, B));
}

double dpr(Point A, Point B) {
  return A.x * B.x + A.y * B.y;
}