// lib/theme/dark_theme.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DarkTheme {
  // Colores específicos del tema oscuro
  static const Color primaryColor = Color(0xFF64B5F6);        // Azul más suave
  static const Color secondaryColor = Color(0xFF66BB6A);      // Verde más suave
  static const Color tertiaryColor = Color(0xFFFFF176);       // Amarillo más suave
  static const Color backgroundColor = Color(0xFF121212);     // Negro material
  static const Color surfaceColor = Color(0xFF1E1E1E);       // Gris oscuro
  static const Color onPrimaryColor = Color(0xFF001D36);
  static const Color onSurfaceColor = Color(0xFFE3E3E3);     // Blanco para texto
  static const Color onBackgroundColor = Color(0xFFE3E3E3);

  // Gradientes para el tema oscuro
  static const List<Color> gradientColors = [
    Color(0xFF0F2027), // Azul muy oscuro
    Color(0xFF203A43), // Azul oscuro
    Color(0xFF2C5364), // Azul medio
  ];

  static ThemeData get theme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,

      // Esquema de colores para modo oscuro
      colorScheme: ColorScheme.dark(
        primary: primaryColor,
        onPrimary: onPrimaryColor,
        primaryContainer: const Color(0xFF004881),
        onPrimaryContainer: const Color(0xFFD1E4FF),

        secondary: secondaryColor,
        onSecondary: const Color(0xFF003A03),
        secondaryContainer: const Color(0xFF1B5E20),
        onSecondaryContainer: const Color(0xFFC8E6C9),

        tertiary: tertiaryColor,
        onTertiary: const Color(0xFF3E2723),
        tertiaryContainer: const Color(0xFF5D4037),
        onTertiaryContainer: const Color(0xFFF8BBD9),

        surface: surfaceColor,
        onSurface: onSurfaceColor,
        surfaceVariant: const Color(0xFF2A2A2A),
        onSurfaceVariant: const Color(0xFFBDBDBD),

        background: backgroundColor,
        onBackground: onBackgroundColor,

        error: const Color(0xFFCF6679),
        onError: const Color(0xFF690005),
        errorContainer: const Color(0xFF93000A),
        onErrorContainer: const Color(0xFFFFDAD6),

        outline: const Color(0xFF616161),
        outlineVariant: const Color(0xFF3A3A3A),

        shadow: const Color(0xFF000000),
        scrim: const Color(0xFF000000),
        inverseSurface: const Color(0xFFE3E3E3),
        onInverseSurface: const Color(0xFF2E2E2E),
        inversePrimary: const Color(0xFF0D47A1),
      ),

      // AppBar para tema oscuro
      appBarTheme: AppBarTheme(
        backgroundColor: surfaceColor,
        foregroundColor: onSurfaceColor,
        surfaceTintColor: Colors.transparent,
        elevation: 2,
        shadowColor: Colors.black.withOpacity(0.3),
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

      scaffoldBackgroundColor: backgroundColor,

      // Cards para tema oscuro
      cardTheme: CardTheme(
        color: surfaceColor,
        surfaceTintColor: Colors.transparent,
        elevation: 4,
        shadowColor: Colors.black.withOpacity(0.4),
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
          elevation: 3,
          shadowColor: Colors.black.withOpacity(0.4),
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

      // Tipografía del tema oscuro
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
          color: const Color(0xFFBDBDBD),
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
          color: const Color(0xFFBDBDBD),
          height: 1.5,
        ),
        bodySmall: GoogleFonts.poppins(
          fontSize: 12,
          fontWeight: FontWeight.normal,
          color: const Color(0xFF9E9E9E),
          height: 1.4,
        ),
      ),

      // Iconos para tema oscuro
      iconTheme: const IconThemeData(
        color: onSurfaceColor,
        size: 24,
      ),

      // FloatingActionButton
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: primaryColor,
        foregroundColor: onPrimaryColor,
        elevation: 6,
        shape: CircleBorder(),
      ),

      // Switch para tema oscuro
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
          return const Color(0xFF424242);
        }),
      ),

      // BottomNavigationBar
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: surfaceColor,
        selectedItemColor: primaryColor,
        unselectedItemColor: Color(0xFF757575),
        elevation: 8,
        type: BottomNavigationBarType.fixed,
      ),

      // Drawer
      drawerTheme: const DrawerThemeData(
        backgroundColor: surfaceColor,
        surfaceTintColor: Colors.transparent,
        elevation: 16,
      ),

      // Divider
      dividerTheme: const DividerThemeData(
        color: Color(0xFF3A3A3A),
        thickness: 1,
        space: 1,
      ),

      // SnackBar
      snackBarTheme: SnackBarThemeData(
        backgroundColor: const Color(0xFF2A2A2A),
        contentTextStyle: GoogleFonts.poppins(
          color: onSurfaceColor,
          fontSize: 14,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        behavior: SnackBarBehavior.floating,
      ),

      // Dialog
      dialogTheme: DialogTheme(
        backgroundColor: surfaceColor,
        surfaceTintColor: Colors.transparent,
        elevation: 24,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        titleTextStyle: GoogleFonts.poppins(
          color: onSurfaceColor,
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
        contentTextStyle: GoogleFonts.poppins(
          color: const Color(0xFFBDBDBD),
          fontSize: 14,
        ),
      ),
    );
  }
}