// lib/widgets/theme_switch_widget.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/theme_manager.dart';

// Este widget es un interruptor de tema reutilizable con un diseño más elaborado.
class ThemeSwitchWidget extends StatelessWidget {
  final bool showLabel;
  final bool isCompact;

  const ThemeSwitchWidget({
    Key? key,
    this.showLabel = true,
    this.isCompact = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeManager>(
      builder: (context, themeManager, child) {
        return Container(
          padding: EdgeInsets.symmetric(
            horizontal: isCompact ? 8 : 16,
            vertical: isCompact ? 4 : 8,
          ),
          decoration: BoxDecoration(
            color: themeManager.surfaceColor,
            borderRadius: BorderRadius.circular(25),
            border: Border.all(
              color: themeManager.primaryColor.withOpacity(0.3),
              width: 1,
            ),
            boxShadow: [
              BoxShadow(
                color: themeManager.isDarkMode
                    ? Colors.black.withOpacity(0.3)
                    : Colors.black.withOpacity(0.1),
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Icono del tema actual
              Icon(
                themeManager.currentThemeIcon,
                color: themeManager.primaryColor,
                size: isCompact ? 20 : 24,
              ),

              if (showLabel) ...[
                SizedBox(width: isCompact ? 8 : 12),
                Text(
                  themeManager.currentThemeName,
                  style: GoogleFonts.poppins(
                    fontSize: isCompact ? 12 : 14,
                    fontWeight: FontWeight.w500,
                    color: themeManager.onSurfaceColor,
                  ),
                ),
              ],

              SizedBox(width: isCompact ? 8 : 12),

              // Switch personalizado animado
              GestureDetector(
                onTap: () => themeManager.toggleTheme(),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  width: isCompact ? 44 : 50,
                  height: isCompact ? 24 : 28,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    gradient: LinearGradient(
                      colors: themeManager.isDarkMode
                          ? [
                        themeManager.primaryColor,
                        themeManager.primaryColor.withOpacity(0.8),
                      ]
                          : [
                        themeManager.primaryColor.withOpacity(0.3),
                        themeManager.primaryColor.withOpacity(0.5),
                      ],
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: themeManager.primaryColor.withOpacity(0.3),
                        blurRadius: 8,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Stack(
                    children: [
                      AnimatedPositioned(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                        top: 2,
                        left: themeManager.isDarkMode
                            ? (isCompact ? 22 : 26)
                            : 2,
                        child: Container(
                          width: isCompact ? 20 : 24,
                          height: isCompact ? 20 : 24,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.2),
                                spreadRadius: 1,
                                blurRadius: 3,
                                offset: const Offset(0, 1),
                              ),
                            ],
                          ),
                          child: Icon(
                            themeManager.isDarkMode
                                ? Icons.nights_stay
                                : Icons.wb_sunny,
                            size: isCompact ? 12 : 14,
                            color: themeManager.isDarkMode
                                ? themeManager.primaryColor
                                : Colors.orange,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

// Widget para pantalla de configuración completa
class ThemeSettingsWidget extends StatelessWidget {
  const ThemeSettingsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeManager>(
      builder: (context, themeManager, child) {
        return Card(
          margin: const EdgeInsets.all(16),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.palette,
                      color: themeManager.primaryColor,
                      size: 28,
                    ),
                    const SizedBox(width: 12),
                    Text(
                      'Apariencia',
                      style: GoogleFonts.poppins(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: themeManager.onSurfaceColor,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),

                Text(
                  'Personaliza la apariencia de la aplicación según tus preferencias.',
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    color: themeManager.onSurfaceColor.withOpacity(0.7),
                  ),
                ),
                const SizedBox(height: 20),

                // Switch con descripción detallada
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            themeManager.currentThemeName,
                            style: GoogleFonts.poppins(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: themeManager.onSurfaceColor,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            themeManager.currentThemeDescription,
                            style: GoogleFonts.poppins(
                              fontSize: 12,
                              color: themeManager.onSurfaceColor.withOpacity(0.6),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const ThemeSwitchWidget(showLabel: false),
                  ],
                ),

                const SizedBox(height: 20),

                // Preview del tema actual
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: themeManager.backgroundColor,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: themeManager.primaryColor.withOpacity(0.3),
                      width: 1,
                    ),
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: themeManager.primaryColor,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Icon(
                          themeManager.currentThemeIcon,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Vista previa',
                              style: GoogleFonts.poppins(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: themeManager.onBackgroundColor,
                              ),
                            ),
                            Text(
                              'Así se ve tu tema actual',
                              style: GoogleFonts.poppins(
                                fontSize: 12,
                                color: themeManager.onBackgroundColor.withOpacity(0.7),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

// Widget para usar en AppBar (más compacto)
class AppBarThemeSwitchWidget extends StatelessWidget {
  const AppBarThemeSwitchWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeManager>(
      builder: (context, themeManager, child) {
        return IconButton(
          onPressed: () => themeManager.toggleTheme(),
          icon: AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            transitionBuilder: (Widget child, Animation<double> animation) {
              return RotationTransition(
                turns: animation,
                child: child,
              );
            },
            child: Icon(
              themeManager.oppositeThemeIcon,
              key: ValueKey(themeManager.isDarkMode),
              color: themeManager.onSurfaceColor,
            ),
          ),
          tooltip: themeManager.isDarkMode
              ? 'Cambiar a modo claro'
              : 'Cambiar a modo oscuro',
        );
      },
    );
  }
}
