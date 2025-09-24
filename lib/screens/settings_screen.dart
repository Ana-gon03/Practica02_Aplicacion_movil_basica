// lib/screens/settings_screen.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/theme_manager.dart';
import '../widgets/theme_switch_widget.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeManager>(
      builder: (context, themeManager, child) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Configuración'),
            centerTitle: true,
            actions: [
              const AppBarThemeSwitchWidget(),
            ],
          ),
          body: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: themeManager.adaptiveGradientColors,
              ),
            ),
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                // Sección de Apariencia
                _buildSectionCard(
                  context,
                  themeManager,
                  title: 'Apariencia',
                  icon: Icons.palette,
                  children: [
                    _buildThemeOption(
                      context,
                      themeManager,
                      title: 'Tema de la aplicación',
                      subtitle: 'Personaliza la apariencia según tus preferencias',
                    ),
                    const SizedBox(height: 16),
                    _buildThemePreview(context, themeManager),
                  ],
                ),

                const SizedBox(height: 20),

                // Sección de Información
                _buildSectionCard(
                  context,
                  themeManager,
                  title: 'Información',
                  icon: Icons.info,
                  children: [
                    _buildInfoTile(
                      context,
                      themeManager,
                      title: 'Versión',
                      subtitle: '1.0.0',
                      icon: Icons.info_outline,
                    ),
                    _buildInfoTile(
                      context,
                      themeManager,
                      title: 'Desarrollado por',
                      subtitle: 'Zoológico Interactivo Team',
                      icon: Icons.person,
                    ),
                    _buildInfoTile(
                      context,
                      themeManager,
                      title: 'Acerca de',
                      subtitle: 'Explora la vida salvaje en ecosistemas fascinantes',
                      icon: Icons.nature,
                    ),
                  ],
                ),

                const SizedBox(height: 20),

                // Sección de Acciones
                _buildSectionCard(
                  context,
                  themeManager,
                  title: 'Acciones',
                  icon: Icons.settings,
                  children: [
                    _buildActionTile(
                      context,
                      themeManager,
                      title: 'Restablecer tema',
                      subtitle: 'Volver al tema claro por defecto',
                      icon: Icons.refresh,
                      onTap: () => _showResetDialog(context, themeManager),
                    ),
                    _buildActionTile(
                      context,
                      themeManager,
                      title: 'Información del tema',
                      subtitle: 'Ver detalles del tema actual',
                      icon: Icons.info_outline,
                      onTap: () => _showThemeInfoDialog(context, themeManager),
                    ),
                  ],
                ),

                const SizedBox(height: 40),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildSectionCard(
      BuildContext context,
      ThemeManager themeManager, {
        required String title,
        required IconData icon,
        required List<Widget> children,
      }) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  icon,
                  color: themeManager.primaryColor,
                  size: 28,
                ),
                const SizedBox(width: 12),
                Text(
                  title,
                  style: GoogleFonts.poppins(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: themeManager.onSurfaceColor,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            ...children,
          ],
        ),
      ),
    );
  }

  Widget _buildThemeOption(
      BuildContext context,
      ThemeManager themeManager, {
        required String title,
        required String subtitle,
      }) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: themeManager.onSurfaceColor,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                subtitle,
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  color: themeManager.onSurfaceColor.withOpacity(0.7),
                ),
              ),
            ],
          ),
        ),
        const ThemeSwitchWidget(showLabel: false),
      ],
    );
  }

  Widget _buildThemePreview(BuildContext context, ThemeManager themeManager) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: themeManager.backgroundColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: themeManager.primaryColor.withOpacity(0.3),
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Vista previa del tema',
            style: GoogleFonts.poppins(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: themeManager.onBackgroundColor,
            ),
          ),
          const SizedBox(height: 12),
          Row(
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
                      themeManager.currentThemeName,
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: themeManager.onBackgroundColor,
                      ),
                    ),
                    Text(
                      themeManager.currentThemeDescription,
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        color: themeManager.onBackgroundColor.withOpacity(0.7),
                      ),
                    ),
                  ],
                ),
              ),
              Icon(
                themeManager.isDarkMode ? Icons.check_circle : Icons.wb_sunny,
                color: themeManager.primaryColor,
                size: 24,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildInfoTile(
      BuildContext context,
      ThemeManager themeManager, {
        required String title,
        required String subtitle,
        required IconData icon,
      }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Icon(
            icon,
            color: themeManager.primaryColor,
            size: 24,
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: themeManager.onSurfaceColor,
                  ),
                ),
                Text(
                  subtitle,
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    color: themeManager.onSurfaceColor.withOpacity(0.7),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionTile(
      BuildContext context,
      ThemeManager themeManager, {
        required String title,
        required String subtitle,
        required IconData icon,
        required VoidCallback onTap,
      }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
        child: Row(
          children: [
            Icon(
              icon,
              color: themeManager.primaryColor,
              size: 24,
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: themeManager.onSurfaceColor,
                    ),
                  ),
                  Text(
                    subtitle,
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      color: themeManager.onSurfaceColor.withOpacity(0.7),
                    ),
                  ),
                ],
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: themeManager.onSurfaceColor.withOpacity(0.5),
              size: 16,
            ),
          ],
        ),
      ),
    );
  }

  void _showResetDialog(BuildContext context, ThemeManager themeManager) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Restablecer Tema',
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.bold,
            ),
          ),
          content: Text(
            '¿Estás seguro de que quieres restablecer el tema al modo claro por defecto?',
            style: GoogleFonts.poppins(),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text(
                'Cancelar',
                style: GoogleFonts.poppins(),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                themeManager.resetToLightTheme();
                Navigator.of(context).pop();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      'Tema restablecido al modo claro',
                      style: GoogleFonts.poppins(),
                    ),
                    behavior: SnackBarBehavior.floating,
                  ),
                );
              },
              child: Text(
                'Restablecer',
                style: GoogleFonts.poppins(),
              ),
            ),
          ],
        );
      },
    );
  }

  void _showThemeInfoDialog(BuildContext context, ThemeManager themeManager) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Row(
            children: [
              Icon(
                themeManager.currentThemeIcon,
                color: themeManager.primaryColor,
              ),
              const SizedBox(width: 12),
              Text(
                'Información del Tema',
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildInfoRow('Tema actual:', themeManager.currentThemeName),
              const SizedBox(height: 8),
              _buildInfoRow('Descripción:', themeManager.currentThemeDescription),
              const SizedBox(height: 8),
              _buildInfoRow('Color primario:', '#${themeManager.primaryColor.value.toRadixString(16).toUpperCase()}'),
              const SizedBox(height: 8),
              _buildInfoRow('Modo:', themeManager.isDarkMode ? 'Oscuro' : 'Claro'),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text(
                'Cerrar',
                style: GoogleFonts.poppins(),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.poppins(
            fontSize: 12,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            value,
            style: GoogleFonts.poppins(
              fontSize: 12,
            ),
          ),
        ),
      ],
    );
  }
}