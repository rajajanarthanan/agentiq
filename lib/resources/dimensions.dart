// lib/core/constants/dimensions.dart

import 'package:flutter/material.dart';

/// Breakpoints for responsiveness
class Breakpoints {
  static const double mobile = 600;
  static const double tablet = 1024;
  static const double desktop = 1440;
}

/// Global paddings & margins
class Insets {
  static const double xs = 4;
  static const double sm = 8;
  static const double md = 16;
  static const double lg = 24;
  static const double xl = 32;
  static const double xxl = 48;
}

/// Font sizes
class FontSizes {
  static const double xs = 10;
  static const double sm = 12;
  static const double md = 14;
  static const double lg = 18;
  static const double xl = 22;
  static const double xxl = 28;
  static const double huge = 34;
}

/// Border radii
class Corners {
  static const double sm = 6;
  static const double md = 12;
  static const double lg = 20;
  static const double xl = 32;

  static const BorderRadius roundedSm = BorderRadius.all(Radius.circular(sm));
  static const BorderRadius roundedMd = BorderRadius.all(Radius.circular(md));
  static const BorderRadius roundedLg = BorderRadius.all(Radius.circular(lg));
  static const BorderRadius roundedXl = BorderRadius.all(Radius.circular(xl));
}

/// Gaps for spacing between widgets
class Gaps {
  static const SizedBox h4 = SizedBox(height: 4);
  static const SizedBox h8 = SizedBox(height: 8);
  static const SizedBox h16 = SizedBox(height: 16);
  static const SizedBox h24 = SizedBox(height: 24);
  static const SizedBox h32 = SizedBox(height: 32);

  static const SizedBox w4 = SizedBox(width: 4);
  static const SizedBox w8 = SizedBox(width: 8);
  static const SizedBox w16 = SizedBox(width: 16);
  static const SizedBox w24 = SizedBox(width: 24);
  static const SizedBox w32 = SizedBox(width: 32);
}

/// Heights for common app bars, headers, footers
class Heights {
  static const double appBar = 56;
  static const double bottomNav = 72;
  static const double header = 120;
}

/// Widths for common app bars, headers, footers
class Widths {
  static const double appBar = 56;
  static const double bottomNav = 72;
  static const double header = 120;
}
