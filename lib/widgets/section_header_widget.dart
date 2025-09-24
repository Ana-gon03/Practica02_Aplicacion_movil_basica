// lib/widgets/section_header_widget.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SectionHeaderWidget extends StatelessWidget {
  final IconData icon;
  final String title;
  final String? subtitle;
  final Color iconColor;

  const SectionHeaderWidget({
    Key? key,
    required this.icon,
    required this.title,
    this.subtitle,
    this.iconColor = const Color(0xFFE4F00E),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(icon, color: iconColor, size: 28),
            const SizedBox(width: 8),
            Text(
              title,
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        if (subtitle != null) ...[
          const SizedBox(height: 8),
          Text(
            subtitle!,
            style: GoogleFonts.poppins(
              color: Colors.white70,
              fontSize: 14,
            ),
          ),
        ],
      ],
    );
  }
}