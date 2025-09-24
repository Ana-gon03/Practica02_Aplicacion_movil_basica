// lib/theme/theme_manager.dart
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'light_theme.dart';
import 'dark_theme.dart';

class ThemeManager extends ChangeNotifier {
  static const String _themeKey = 'isDarkModeEnabled';
  bool _isDarkMode = false;

  bool get isDarkMode => _isDarkMode;

  ThemeManager() {
    _loadThemeFromPrefs();
  }

  // Cargar tema desde SharedPreferences (equivalente a leer en onCreate)
  void _loadThemeFromPrefs() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      _isDarkMode = prefs.getBool(_themeKey) ?? false;
      notifyListeners();
    } catch (e) {
      debugPrint('Error loading theme preference: $e');
      _isDarkMode = false;
    }
  }

  // Cambiar tema y guardar en SharedPreferences (equivalente a guardar preferencia)
  Future<void> toggleTheme() async {
    try {
      _isDarkMode = !_isDarkMode;
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setBool(_themeKey, _isDarkMode);
      notifyListeners();
    } catch (e) {
      debugPrint('Error saving theme preference: $e');
      // Revertir cambio si no se pudo guardar
      _isDarkMode = !_isDarkMode;
    }
  }

  // Establecer tema específico
  Future<void> setTheme(bool isDark) async {
    if (_isDarkMode != isDark) {
      try {
        _isDarkMode = isDark;
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setBool(_themeKey, _isDarkMode);
        notifyListeners();
      } catch (e) {
        debugPrint('Error setting theme: $e');
        // Revertir cambio si no se pudo guardar
        _isDarkMode = !_isDarkMode;
      }
    }
  }

  // Resetear tema a claro
  Future<void> resetToLightTheme() async {
    await setTheme(false);
  }

  // Obtener tema claro
  ThemeData get lightTheme => LightTheme.theme;

  // Obtener tema oscuro
  ThemeData get darkTheme => DarkTheme.theme;

  // Obtener tema actual
  ThemeData get currentTheme => _isDarkMode ? darkTheme : lightTheme;

  // Obtener colores del tema actual
  ColorScheme get currentColorScheme => _isDarkMode
      ? darkTheme.colorScheme
      : lightTheme.colorScheme;

  // Método para verificar si es tema oscuro sin context
  bool get isCurrentlyDark => _isDarkMode;

  // Método para obtener color primario actual
  Color get primaryColor => _isDarkMode
      ? DarkTheme.primaryColor
      : LightTheme.primaryColor;

  // Método para obtener color de superficie actual
  Color get surfaceColor => _isDarkMode
      ? DarkTheme.surfaceColor
      : LightTheme.surfaceColor;

  // Método para obtener color de fondo actual
  Color get backgroundColor => _isDarkMode
      ? DarkTheme.backgroundColor
      : LightTheme.backgroundColor;

  // Método para obtener colores de gradiente adaptables
  List<Color> get adaptiveGradientColors => _isDarkMode
      ? DarkTheme.gradientColors
      : LightTheme.gradientColors;

  // Método para obtener color de texto sobre gradiente
  Color get gradientTextColor => _isDarkMode
      ? Colors.white
      : const Color(0xFF1A1A1A);

  // Método para obtener color de texto secundario sobre gradiente
  Color get gradientSecondaryTextColor => _isDarkMode
      ? Colors.white70
      : const Color(0xFF424242);

  // Método para obtener color de texto sobre superficie
  Color get onSurfaceColor => _isDarkMode
      ? DarkTheme.onSurfaceColor
      : LightTheme.onSurfaceColor;

  // Método para obtener color de texto sobre fondo
  Color get onBackgroundColor => _isDarkMode
      ? DarkTheme.onBackgroundColor
      : LightTheme.onBackgroundColor;

  // Método para obtener el nombre del tema actual
  String get currentThemeName => _isDarkMode ? 'Tema Oscuro' : 'Tema Claro';

  // Método para obtener descripción del tema actual
  String get currentThemeDescription => _isDarkMode
      ? 'Optimizado para condiciones de poca luz'
      : 'Perfecto para uso durante el día';

  // Método para obtener icono del tema actual
  IconData get currentThemeIcon => _isDarkMode
      ? Icons.dark_mode
      : Icons.light_mode;

  // Método para obtener icono del tema opuesto (para el switch)
  IconData get oppositeThemeIcon => _isDarkMode
      ? Icons.light_mode
      : Icons.dark_mode;
}