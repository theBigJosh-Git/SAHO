import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  // ─────────────────────────────────────────────
  // SAHO Brand
  // ─────────────────────────────────────────────

  /// Main SAHO brand green.
  /// Used for primary actions, highlights and brand elements.
  static const Color primary = Color(0xFF16A34A);

  /// Darker SAHO green.
  /// Used for emphasis, pressed states and darker brand elements.
  static const Color primaryDark = Color(0xFF15803D);

  /// Supporting SAHO blue.
  /// Used for secondary interactive elements where appropriate.
  static const Color secondary = Color(0xFF2563EB);

  /// Deep navy used throughout the SAHO identity.
  static const Color navy = Color(0xFF0F172A);

  /// Warm accent inspired by the service/wrench element.
  /// Use sparingly for highlights — not primary actions.
  static const Color accent = Color(0xFFF97316);

  // ─────────────────────────────────────────────
  // Backgrounds
  // ─────────────────────────────────────────────

  static const Color background = Color(0xFFF8FAFC);
  static const Color surface = Color(0xFFFFFFFF);
  static const Color surfaceSoft = Color(0xFFF1F5F9);

  /// Soft brand-tinted background.
  static const Color primarySoft = Color(0xFFDCFCE7);

  /// Soft blue background for supporting information.
  static const Color secondarySoft = Color(0xFFE0F2FE);

  // ─────────────────────────────────────────────
  // Text
  // ─────────────────────────────────────────────

  static const Color textPrimary = navy;
  static const Color textSecondary = Color(0xFF64748B);
  static const Color textOnPrimary = Color(0xFFFFFFFF);

  // ─────────────────────────────────────────────
  // UI
  // ─────────────────────────────────────────────

  static const Color border = Color(0xFFE2E8F0);

  // Semantic colours
  static const Color success = Color(0xFF22C55E);
  static const Color warning = Color(0xFFF59E0B);
  static const Color error = Color(0xFFDC2626);
}
