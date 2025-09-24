// lib/theme/light_theme.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LightTheme {
  // Colores específicos del tema claro
  static const Color primaryColor = Color(0xFF00C6FF);        // Azul vibrante
  static const Color secondaryColor = Color(0xFF00E676);      // Verde vibrante
  static const Color tertiaryColor = Color(0xFFE4F00E);       // Amarillo vibrante
  static const Color backgroundColor = Color(0xFFFFFFFF);     // Blanco puro
  static const Color surfaceColor = Color(0xFFF8F9FA);       // Gris muy claro
  static const Color onPrimaryColor = Colors.white;
  static const Color onSurfaceColor = Color(0xFF1A1A1A);     // Negro para texto
  static const Color onBackgroundColor = Color(0xFF1A1A1A);

  // Gradientes para el tema claro
  static const List<Color> gradientColors = [
    Color(0xFF87CEEB), // Azul claro (sky blue)
    Color(0xFFE0F6FF), // Azul muy claro
    Color(0xFFF0F8FF), // Alice blue
  ];

  static ThemeData get theme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,

      // Esquema de colores para modo día
      colorScheme: ColorScheme.light(
        primary: primaryColor,
        onPrimary: onPrimaryColor,
        primaryContainer: const Color(0xFFE3F2FD),
        onPrimaryContainer: const Color(0xFF0D47A1),

        secondary: secondaryColor,
        onSecondary: Colors.black,
        secondaryContainer: const Color(0xFFE8F5E8),
        onSecondaryContainer: const Color(0xFF1B5E20),

        tertiary: tertiaryColor,
        onTertiary: Colors.black,
        tertiaryContainer: const Color(0xFFFFF9C4),
        onTertiaryContainer: const Color(0xFF827717),

        surface: surfaceColor,
        onSurface: onSurfaceColor,
        surfaceVariant: const Color(0xFFF5F5F5),
        onSurfaceVariant: const Color(0xFF424242),

        background: backgroundColor,
        onBackground: onBackgroundColor,

        error: const Color(0xFFD32F2F),
        onError: Colors.white,
        errorContainer: const Color(0xFFFFEBEE),
        onErrorContainer: const Color(0xFFB71C1C),

        outline: const Color(0xFFBDBDBD),
        outlineVariant: const Color(0xFFE0E0E0),

        shadow: const Color(0xFF000000),
        scrim: const Color(0xFF000000),
        inverseSurface: const Color(0xFF2E2E2E),
        onInverseSurface: const Color(0xFFF1F1F1),
        inversePrimary: const Color(0xFF64B5F6),
      ),

      // AppBar para tema claro
      appBarTheme: AppBarTheme(
        backgroundColor: backgroundColor,
        foregroundColor: onSurfaceColor,
        surfaceTintColor: Colors.transparent,
        elevation: 2,
        shadowColor: Colors.black.withOpacity(0.1),
        centerTitle: true,
        titleTextStyle: GoogleFonts.poppins(
          color: onSurfaceColor,
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
        iconTheme: const IconThemeData(
          color: onSurfaceColor,
          size: 24,
        ),
      ),

      scaffoldBackgroundColor: surfaceColor,

      // Cards para tema claro
      cardTheme: CardTheme(
        color: backgroundColor,
        surfaceTintColor: Colors.transparent,
        elevation: 3,
        shadowColor: Colors.black.withOpacity(0.1),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        margin: const EdgeInsets.all(8),
      ),

      // Botones elevados
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryColor,
          foregroundColor: onPrimaryColor,
          surfaceTintColor: Colors.transparent,
          elevation: 2,
          shadowColor: Colors.black.withOpacity(0.2),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          textStyle: GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),

      // Botones de texto
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: primaryColor,
          textStyle: GoogleFonts.poppins(
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),

      // Tipografía del tema claro
      textTheme: TextTheme(
        headlineLarge: GoogleFonts.poppins(
          fontSize: 32,
          fontWeight: FontWeight.bold,
          color: onSurfaceColor,
          height: 1.2,
        ),
        headlineMedium: GoogleFonts.poppins(
          fontSize: 28,
          fontWeight: FontWeight.bold,
          color: onSurfaceColor,
          height: 1.3,
        ),
        headlineSmall: GoogleFonts.poppins(
          fontSize: 24,
          fontWeight: FontWeight.w600,
          color: onSurfaceColor,
          height: 1.3,
        ),
        titleLarge: GoogleFonts.poppins(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: onSurfaceColor,
          height: 1.4,
        ),
        titleMedium: GoogleFonts.poppins(
          fontSize: 18,
          fontWeight: FontWeight.w500,
          color: onSurfaceColor,
          height: 1.4,
        ),
        titleSmall: GoogleFonts.poppins(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: const Color(0xFF424242),
          height: 1.4,
        ),
        bodyLarge: GoogleFonts.poppins(
          fontSize: 16,
          fontWeight: FontWeight.normal,
          color: onSurfaceColor,
          height: 1.5,
        ),
        bodyMedium: GoogleFonts.poppins(
          fontSize: 14,
          fontWeight: FontWeight.normal,
          color: const Color(0xFF424242),
          height: 1.5,
        ),
        bodySmall: GoogleFonts.poppins(
          fontSize: 12,
          fontWeight: FontWeight.normal,
          color: const Color(0xFF666666),
          height: 1.4,
        ),
      ),

      // Iconos para tema claro
      iconTheme: const IconThemeData(
        color: onSurfaceColor,
        size: 24,
      ),

      // FloatingActionButton
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: primaryColor,
        foregroundColor: onPrimaryColor,
        elevation: 4,
        shape: CircleBorder(),
      ),

      // Switch para tema claro
      switchTheme: SwitchThemeData(
        thumbColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.selected)) {
            return primaryColor;
          }
          return const Color(0xFF757575);
        }),
        trackColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.selected)) {
            return primaryColor.withOpacity(0.5);
          }
          return const Color(0xFFE0E0E0);
        }),
      ),
    );
  }
}