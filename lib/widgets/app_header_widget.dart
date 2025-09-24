// lib/widgets/app_header_widget.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppHeaderWidget extends StatelessWidget {
  final String title;
  final String? subtitle;
  final bool showBackButton;
  final VoidCallback? onBackPressed;
  final bool showIcons;
  final List<Widget>? customIcons;

  const AppHeaderWidget({
    Key? key,
    required this.title,
    this.subtitle,
    this.showBackButton = false,
    this.onBackPressed,
    this.showIcons = false,
    this.customIcons,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 60.0, left: 24.0, right: 24.0, bottom: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Botón de volver si se requiere
          if (showBackButton)
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: InkWell(
                onTap: onBackPressed ?? () => Navigator.pop(context),
                child: Row(
                  children: [
                    const Icon(Icons.arrow_back, color: Colors.white, size: 24),
                    const SizedBox(width: 8),
                    Text(
                      'Volver',
                      style: GoogleFonts.poppins(color: Colors.white, fontSize: 18),
                    ),
                  ],
                ),
              ),
            ),

          // Iconos decorativos si se requieren
          if (showIcons && customIcons != null)
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: Row(
                children: customIcons!,
              ),
            ),

          // Título principal
          Text(
            title,
            textAlign: showBackButton ? TextAlign.left : TextAlign.center,
            style: GoogleFonts.poppins(
              color: const Color(0xFF00C6FF),
              fontSize: showBackButton ? 36 : 40,
              fontWeight: FontWeight.bold,
              height: 1.1,
            ),
          ),

          // Subtítulo si existe
          if (subtitle != null) ...[
            const SizedBox(height: 10),
            Text(
              subtitle!,
              textAlign: showBackButton ? TextAlign.left : TextAlign.center,
              style: GoogleFonts.poppins(
                  color: Colors.white70,
                  fontSize: 16
              ),
            ),
          ],
        ],
      ),
    );
  }
}

// Widget específico para la pantalla principal con iconos
class MainAppHeaderWidget extends StatelessWidget {
  const MainAppHeaderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppHeaderWidget(
      title: 'Zoológico Interactivo',
      subtitle: 'Embárcate en un viaje extraordinario por los ecosistemas más fascinantes del planeta. Descubre la vida salvaje en su hábitat natural.',
      showIcons: true,
      customIcons: [
        const Icon(Icons.public, color: Color(0xFF00C6FF), size: 38),
        const SizedBox(width: 15),
        const Icon(Icons.forest, color: Color(0xFF00E676), size: 38),
      ],
    );
  }
}

// Widget específico para pantallas secundarias con botón de volver
class SecondaryAppHeaderWidget extends StatelessWidget {
  final String title;
  final String? subtitle;
  final VoidCallback? onBackPressed;

  const SecondaryAppHeaderWidget({
    Key? key,
    required this.title,
    this.subtitle,
    this.onBackPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppHeaderWidget(
      title: title,
      subtitle: subtitle,
      showBackButton: true,
      onBackPressed: onBackPressed,
    );
  }
}