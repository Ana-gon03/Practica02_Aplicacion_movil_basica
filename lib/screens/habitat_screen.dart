// lib/screens/habitat_screen.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../models/ecosystem.dart';
import '../models/habitat.dart';
import '../models/animal.dart';
import '../theme/theme_manager.dart';
import 'animal_screen.dart';

class HabitatScreen extends StatelessWidget {
  final Ecosystem ecosystem;

  HabitatScreen({required this.ecosystem});

  @override
  Widget build(BuildContext context) {
    final List<Habitat> habitats = _getHabitatsForEcosystem(ecosystem.name);

    return Consumer<ThemeManager>(
      builder: (context, themeManager, child) {
        return Scaffold(
          body: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: themeManager.adaptiveGradientColors,
              ),
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 60, left: 16, right: 16),
                    child: InkWell(
                      onTap: () => Navigator.pop(context),
                      child: Row(
                        children: [
                          Icon(Icons.arrow_back, color: themeManager.gradientTextColor, size: 24),
                          const SizedBox(width: 8),
                          Text(
                            'Volver',
                            style: GoogleFonts.poppins(
                                color: themeManager.gradientTextColor,
                                fontSize: 18
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            ecosystem.name,
                            style: GoogleFonts.poppins(
                                color: themeManager.gradientTextColor,
                                fontSize: 36,
                                fontWeight: FontWeight.bold
                            ),
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            ecosystem.description,
                            style: GoogleFonts.poppins(
                                color: themeManager.gradientSecondaryTextColor,
                                fontSize: 16
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(
                                Icons.location_on,
                                color: themeManager.isDarkMode
                                    ? const Color(0xFFE4F00E)
                                    : themeManager.primaryColor,
                                size: 28
                            ),
                            const SizedBox(width: 8),
                            Text(
                              'Hábitats Disponibles',
                              style: GoogleFonts.poppins(
                                color: themeManager.gradientTextColor,
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Cada hábitat alberga especies únicas adaptadas a sus condiciones específicas. Explora y descubre la vida que prospera en cada rincón.',
                          style: GoogleFonts.poppins(
                            color: themeManager.gradientSecondaryTextColor,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: GridView.count(
                      crossAxisCount: 2,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                      childAspectRatio: 0.7,
                      children: habitats.map((habitat) {
                        return _buildHabitatGridCard(context, habitat, themeManager);
                      }).toList(),
                    ),
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildHabitatGridCard(BuildContext context, Habitat habitat, ThemeManager themeManager) {
    return InkWell(
      onTap: () {
        _showHabitatDetails(context, habitat, themeManager);
      },
      child: Card(
        elevation: 8,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        clipBehavior: Clip.antiAlias,
        child: Stack(
          children: [
            Positioned.fill(
              child: Image.asset(
                habitat.imagePath,
                fit: BoxFit.cover,
              ),
            ),
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      Colors.black.withOpacity(0.6),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 12,
              left: 12,
              right: 12,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    habitat.name,
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    '${habitat.animals.length} especies',
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 8,
              right: 8,
              child: Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.4),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.info_outline,
                  color: Colors.white,
                  size: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showHabitatDetails(BuildContext context, Habitat habitat, ThemeManager themeManager) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return Container(
          decoration: BoxDecoration(
            color: themeManager.surfaceColor,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(30.0),
              topRight: Radius.circular(30.0),
            ),
          ),
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  height: 5,
                  width: 50,
                  decoration: BoxDecoration(
                    color: themeManager.onSurfaceColor.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              Text(
                habitat.name,
                style: GoogleFonts.poppins(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: themeManager.onSurfaceColor,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                habitat.description,
                style: GoogleFonts.poppins(
                    color: themeManager.onSurfaceColor.withOpacity(0.7),
                    fontSize: 16
                ),
              ),
              const SizedBox(height: 24),
              Text(
                'Características Clave',
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: themeManager.onSurfaceColor,
                ),
              ),
              ...habitat.keyPoints.map((point) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: Row(
                    children: [
                      Icon(
                          Icons.circle,
                          color: themeManager.isDarkMode
                              ? const Color(0xFFE4F00E)
                              : themeManager.primaryColor,
                          size: 8
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          point,
                          style: GoogleFonts.poppins(
                              color: themeManager.onSurfaceColor.withOpacity(0.7),
                              fontSize: 14
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildDetailItem(
                    icon: Icons.thermostat_outlined,
                    label: 'Temperatura',
                    value: habitat.temperature,
                    iconColor: Colors.redAccent,
                    themeManager: themeManager,
                  ),
                  _buildDetailItem(
                    icon: Icons.opacity,
                    label: 'Humedad',
                    value: habitat.humidity,
                    iconColor: Colors.blueAccent,
                    themeManager: themeManager,
                  ),
                  _buildDetailItem(
                    icon: Icons.waves,
                    label: 'Corriente',
                    value: habitat.flow,
                    iconColor: Colors.lightBlue,
                    themeManager: themeManager,
                  ),
                ],
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: themeManager.isDarkMode
                          ? [
                        const Color(0xFF005640), // Verde más oscuro
                        const Color(0xFF00897B), // Verde un poco menos oscuro
                      ]
                          : [
                        themeManager.primaryColor,
                        themeManager.primaryColor.withOpacity(0.8),
                      ],
                    ),
                  ),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        PageRouteBuilder(
                          transitionDuration: const Duration(milliseconds: 800),
                          reverseTransitionDuration: const Duration(milliseconds: 600),
                          pageBuilder: (context, animation, secondaryAnimation) =>
                              AnimalScreen(animals: habitat.animals),
                          transitionsBuilder: (context, animation, secondaryAnimation, child) {
                            // Animación de deslizamiento desde la derecha con efecto de desvanecimiento
                            const begin = Offset(1.0, 0.0);
                            const end = Offset.zero;
                            const curve = Curves.easeInOutCubic;

                            var slideTween = Tween(begin: begin, end: end).chain(
                              CurveTween(curve: curve),
                            );

                            var fadeTween = Tween<double>(begin: 0.0, end: 1.0).chain(
                              CurveTween(curve: curve),
                            );

                            var scaleTween = Tween<double>(begin: 0.8, end: 1.0).chain(
                              CurveTween(curve: curve),
                            );

                            return SlideTransition(
                              position: animation.drive(slideTween),
                              child: FadeTransition(
                                opacity: animation.drive(fadeTween),
                                child: ScaleTransition(
                                  scale: animation.drive(scaleTween),
                                  child: child,
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    },
                    child: Text(
                      'Explorar Animales',
                      style: GoogleFonts.poppins(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildDetailItem({
    required IconData icon,
    required String label,
    required String value,
    required Color iconColor,
    required ThemeManager themeManager
  }) {
    return Column(
      children: [
        Icon(icon, color: iconColor, size: 30),
        const SizedBox(height: 4),
        Text(
          label,
          style: GoogleFonts.poppins(
              color: themeManager.onSurfaceColor.withOpacity(0.7),
              fontSize: 12
          ),
        ),
        Text(
          value,
          style: GoogleFonts.poppins(
              color: themeManager.onSurfaceColor,
              fontWeight: FontWeight.bold
          ),
        ),
      ],
    );
  }


  List<Habitat> _getHabitatsForEcosystem(String ecosystemName) {
    if (ecosystemName == 'Selva') {
      return [
        // ---------------- SELVA ----------------
        Habitat(
          name: 'Río selvático',
          description: 'Aguas cristalinas que fluyen entre la densa vegetación tropical, hogar de depredadores y peces únicos.',
          imagePath: 'assets/eco_selva/rio_selva.jpg',
          keyPoints: ['Corrientes lentas', 'Alta biodiversidad', 'Aguas ricas en nutrientes'],
          temperature: '26°C',
          humidity: '95%',
          flow: 'Moderado',
          animals: [
            Animal(
              name: 'Jaguar',
              scientificName: 'Panthera onca',
              imagePath: 'assets/eco_selva/jaguar.jpg',
              description: 'El felino más grande de América y excelente nadador, capaz de cazar incluso dentro del agua.',
              weight: '56-96 kg',
              length: '1.1-1.8 m',
              conservationStatus: 'Casi Amenazado',
              galleryImages: ['assets/jaguar.jpg', 'assets/jaguar2.jpg'],
            ),
            Animal(
              name: 'Anaconda verde',
              scientificName: 'Eunectes murinus',
              imagePath: 'assets/eco_selva/anaconda.jpg',
              description: 'Una de las serpientes más grandes del mundo, habita ríos y pantanos en la selva.',
              weight: '30-250 kg',
              length: '4-9 m',
              conservationStatus: 'Preocupación Menor',
              galleryImages: ['assets/anaconda.jpg', 'assets/anaconda2.jpg'],
            ),
            Animal(
              name: 'Piraña',
              scientificName: 'Pygocentrus nattereri',
              imagePath: 'assets/eco_selva/pirana.jpg',
              description: 'Pez carnívoro de agua dulce conocido por sus afilados dientes y su comportamiento en cardúmenes.',
              weight: '1-3 kg',
              length: '15-40 cm',
              conservationStatus: 'Preocupación Menor',
              galleryImages: ['assets/pirana.jpg', 'assets/pirana2.jpg'],
            ),
          ],
        ),
        Habitat(
          name: 'Copa de los árboles',
          description: 'La parte más alta de los árboles, donde abunda la luz solar y habitan aves y primates.',
          imagePath: 'assets/eco_selva/copa_selva.jpg',
          keyPoints: ['Alta luminosidad', 'Gran variedad de aves y primates', 'Vegetación densa'],
          temperature: '28°C',
          humidity: '90%',
          flow: 'N/A',
          animals: [
            Animal(
              name: 'Mono aullador',
              scientificName: 'Alouatta',
              imagePath: 'assets/eco_selva/mono_aullador.jpg',
              description: 'Primate conocido por sus fuertes vocalizaciones que pueden escucharse a varios kilómetros.',
              weight: '4-10 kg',
              length: '40-70 cm',
              conservationStatus: 'Vulnerable',
              galleryImages: ['assets/mono_aullador.jpg', 'assets/mono_aullador2.jpg'],
            ),
            Animal(
              name: 'Tucán toco',
              scientificName: 'Ramphastos toco',
              imagePath: 'assets/eco_selva/tucan.jpg',
              description: 'Ave tropical famosa por su gran pico de colores brillantes.',
              weight: '500-860 g',
              length: '55-65 cm',
              conservationStatus: 'Preocupación Menor',
              galleryImages: ['assets/eco_selva/tucan.jpg', 'assets/eco_selva/tucan2.jpg'],
            ),
            Animal(
              name: 'Perezoso de tres dedos',
              scientificName: 'Bradypus variegatus',
              imagePath: 'assets/eco_selva/perezoso.jpg',
              description: 'Mamífero lento que pasa la mayor parte de su vida en los árboles.',
              weight: '4-8 kg',
              length: '50-60 cm',
              conservationStatus: 'Preocupación Menor',
              galleryImages: ['assets/perezoso.jpg', 'assets/perezoso2.jpg'],
            ),
          ],
        ),
        Habitat(
          name: 'Suelo del bosque',
          description: 'Oscuro y húmedo, con poca luz solar y una rica capa de hojas en descomposición.',
          imagePath: 'assets/eco_selva/suelo_selva.jpg',
          keyPoints: ['Alta humedad', 'Baja luminosidad', 'Rico en nutrientes'],
          temperature: '25°C',
          humidity: '98%',
          flow: 'N/A',
          animals: [
            Animal(
              name: 'Tapir amazónico',
              scientificName: 'Tapirus terrestris',
              imagePath: 'assets/eco_selva/tapir.jpg',
              description: 'Mamífero herbívoro que se alimenta de hojas y frutas, esencial para la dispersión de semillas.',
              weight: '150-250 kg',
              length: '1.8-2.5 m',
              conservationStatus: 'Vulnerable',
              galleryImages: ['assets/tapir.jpg', 'assets/tapir2.jpg'],
            ),
            Animal(
              name: 'Hormiga cortadora de hojas',
              scientificName: 'Atta cephalotes',
              imagePath: 'assets/eco_selva/hormiga.jpg',
              description: 'Hormiga que corta hojas para cultivar hongos, su alimento principal.',
              weight: '3-5 mg',
              length: '6-12 mm',
              conservationStatus: 'Preocupación Menor',
              galleryImages: ['assets/hormiga.jpg', 'assets/hormiga2.jpg'],
            ),
            Animal(
              name: 'Rana venenosa dorada',
              scientificName: 'Phyllobates terribilis',
              imagePath: 'assets/eco_selva/rana_venenosa.jpg',
              description: 'Una de las ranas más venenosas del mundo, de colores brillantes como advertencia.',
              weight: '1 g',
              length: '3-5 cm',
              conservationStatus: 'En Peligro Crítico',
              galleryImages: ['assets/rana_venenosa.jpg', 'assets/rana_venenosa2.jpg'],
            ),
          ],
        ),
      ];
    }
    if (ecosystemName == 'Desierto') {
      return [
        // ---------------- DESIERTO ----------------
        Habitat(
          name: 'Dunas de arena',
          description: 'Extensas montañas de arena formadas por el viento, con temperaturas extremas entre el día y la noche.',
          imagePath: 'assets/eco_desier/dunas.jpg',
          keyPoints: ['Altas temperaturas diurnas', 'Fuerte radiación solar', 'Escasa vegetación'],
          temperature: '40°C día / 10°C noche',
          humidity: '15%',
          flow: 'N/A',
          animals: [
            Animal(
              name: 'Camello dromedario',
              scientificName: 'Camelus dromedarius',
              imagePath: 'assets/eco_desier/camello.jpg',
              description: 'Mamífero adaptado al desierto, capaz de almacenar agua y sobrevivir sin beber por varios días.',
              weight: '300-600 kg',
              length: '2.2-3.5 m',
              conservationStatus: 'Doméstico',
              galleryImages: ['assets/eco_desier/camello.jpg', 'assets/eco_desier/camello2.jpg'],
            ),
            Animal(
              name: 'Escorpión del desierto',
              scientificName: 'Androctonus australis',
              imagePath: 'assets/eco_desier/escorpion.jpg',
              description: 'Arácnido venenoso que se oculta bajo la arena para cazar presas pequeñas.',
              weight: '1-6 g',
              length: '10-12 cm',
              conservationStatus: 'Preocupación Menor',
              galleryImages: ['assets/eco_desier/escorpion.jpg', 'assets/eco_desier/escorpion2.jpg'],
            ),
            Animal(
              name: 'Zorro del desierto (fennec)',
              scientificName: 'Vulpes zerda',
              imagePath: 'assets/eco_desier/zorro_desierto.jpg',
              description: 'Pequeño zorro con grandes orejas que ayudan a disipar el calor y escuchar presas bajo la arena.',
              weight: '0.8-1.5 kg',
              length: '24-41 cm',
              conservationStatus: 'Preocupación Menor',
              galleryImages: ['assets/eco_desier/zorro_desierto.jpg', 'assets/eco_desier/zorro_desierto2.jpg'],
            ),
          ],
        ),
        Habitat(
          name: 'Oasis',
          description: 'Pequeña área fértil en medio del desierto, con agua subterránea que permite la vida vegetal y animal.',
          imagePath: 'assets/eco_desier/oasis.jpg',
          keyPoints: ['Presencia de agua', 'Palmeras y vegetación', 'Refugio para animales'],
          temperature: '32°C',
          humidity: '25%',
          flow: 'Bajo',
          animals: [
            Animal(
              name: 'Serpiente de cascabel',
              scientificName: 'Crotalus atrox',
              imagePath: 'assets/eco_desier/cascabel.jpg',
              description: 'Reptil venenoso que utiliza su cascabel como advertencia antes de atacar.',
              weight: '1-2 kg',
              length: '60-120 cm',
              conservationStatus: 'Preocupación Menor',
              galleryImages: ['assets/eco_desier/cascabel.jpg', 'assets/eco_desier/cascabel2.jpg'],
            ),
            Animal(
              name: 'Flamenco',
              scientificName: 'Phoenicopterus roseus',
              imagePath: 'assets/eco_desier/flamenco.jpg',
              description: 'Ave de plumaje rosado que se alimenta filtrando pequeños crustáceos y algas del agua.',
              weight: '2-4 kg',
              length: '80-145 cm',
              conservationStatus: 'Preocupación Menor',
              galleryImages: ['assets/eco_desier/flamenco.jpg', 'assets/eco_desier/flamenco2.jpg'],
            ),
            Animal(
              name: 'Dromedario',
              scientificName: 'Camelus dromedarius',
              imagePath: 'assets/eco_desier/dromedario.jpg',
              description: 'Similar al camello, pero con una sola joroba; es un animal de carga esencial en los oasis.',
              weight: '400-600 kg',
              length: '2.2-3.4 m',
              conservationStatus: 'Doméstico',
              galleryImages: ['assets/eco_desier/dromedario.jpg', 'assets/eco_desier/dromedario2.jpg'],
            ),
          ],
        ),
        Habitat(
          name: 'Montañas rocosas',
          description: 'Zonas áridas de gran altitud con fuertes cambios de temperatura y escasa vegetación.',
          imagePath: 'assets/eco_desier/montanas_rocosas.jpg',
          keyPoints: ['Terreno pedregoso', 'Temperaturas variables', 'Refugios naturales en cuevas'],
          temperature: '20°C día / 5°C noche',
          humidity: '10%',
          flow: 'N/A',
          animals: [
            Animal(
              name: 'Águila real',
              scientificName: 'Aquila chrysaetos',
              imagePath: 'assets/eco_desier/aguila.jpg',
              description: 'Ave rapaz de gran envergadura, considerada símbolo de fuerza y libertad.',
              weight: '3-6 kg',
              length: '70-90 cm (cuerpo), 2 m (envergadura)',
              conservationStatus: 'Preocupación Menor',
              galleryImages: ['assets/eco_desier/aguila.jpg', 'assets/eco_desier/aguila2.jpg'],
            ),
            Animal(
              name: 'Caracal',
              scientificName: 'Caracal caracal',
              imagePath: 'assets/eco_desier/caracal.jpg',
              description: 'Felino de tamaño mediano conocido por sus orejas puntiagudas con penachos negros.',
              weight: '8-19 kg',
              length: '60-105 cm',
              conservationStatus: 'Preocupación Menor',
              galleryImages: ['assets/eco_desier/caracal.jpg', 'assets/eco_desier/caracal2.jpg'],
            ),
            Animal(
              name: 'Lagarto de cola espinosa',
              scientificName: 'Uromastyx',
              imagePath: 'assets/eco_desier/lagarto.jpg',
              description: 'Reptil herbívoro adaptado a zonas áridas, con una cola robusta cubierta de escamas espinosas.',
              weight: '300-500 g',
              length: '25-75 cm',
              conservationStatus: 'Preocupación Menor',
              galleryImages: ['assets/eco_desier/lagarto.jpg', 'assets/eco_desier/lagarto2.jpg'],
            ),
          ],
        ),
      ];
    }
    if (ecosystemName == 'Océano') {
      return [
        // ---------------- OCÉANO ----------------
        Habitat(
          name: 'Superficie',
          description: 'Zona iluminada donde interactúan aire, agua y vida marina.',
          imagePath: 'assets/eco_oceano/superficie.jpg',
          keyPoints: ['Alta luminosidad', 'Temperatura variable', 'Gran biodiversidad'],
          temperature: '20-25°C',
          humidity: 'N/A',
          flow: 'Dinámico (olas, corrientes)',
          animals: [
            Animal(
              name: 'Delfín',
              scientificName: 'Delphinus delphis',
              imagePath: 'assets/eco_oceano/delfin.jpg',
              description: 'Mamífero marino altamente social e inteligente.',
              weight: '80-150 kg',
              length: '2-4 m',
              conservationStatus: 'Preocupación Menor',
              galleryImages: ['assets/eco_oceano/delfin.jpg', 'assets/eco_oceano/delfin2.jpg'],
            ),
            Animal(
              name: 'Tortuga marina',
              scientificName: 'Cheloniidae',
              imagePath: 'assets/eco_oceano/tortuga.jpg',
              description: 'Reptil marino que migra grandes distancias.',
              weight: '70-200 kg',
              length: '0.8-1.2 m',
              conservationStatus: 'Vulnerable',
              galleryImages: ['assets/eco_oceano/tortuga.jpg', 'assets/eco_oceano/tortuga2.jpg'],
            ),
            Animal(
              name: 'Gaviota',
              scientificName: 'Larus argentatus',
              imagePath: 'assets/eco_oceano/gaviota.jpg',
              description: 'Ave costera oportunista y adaptable.',
              weight: '0.8-1.5 kg',
              length: '40-60 cm',
              conservationStatus: 'Preocupación Menor',
              galleryImages: ['assets/eco_oceano/gaviota.jpg', 'assets/eco_oceano/gaviota2.jpg'],
            ),
          ],
        ),
        Habitat(
          name: 'Arrecife de coral',
          description: 'Estructuras submarinas formadas por corales, hogar de miles de especies.',
          imagePath: 'assets/eco_oceano/arrecife.jpg',
          keyPoints: ['Alta biodiversidad', 'Ecosistema frágil', 'Aguas cálidas'],
          temperature: '20-28°C',
          humidity: 'N/A',
          flow: 'Moderado',
          animals: [
            Animal(
              name: 'Pez payaso',
              scientificName: 'Amphiprioninae',
              imagePath: 'assets/eco_oceano/pez_payaso.jpg',
              description: 'Pez colorido que vive en simbiosis con anémonas.',
              weight: '100-250 g',
              length: '10-18 cm',
              conservationStatus: 'Preocupación Menor',
              galleryImages: ['assets/eco_oceano/pez_payaso.jpg', 'assets/eco_oceano/pez_payaso2.jpg'],
            ),
            Animal(
              name: 'Tiburón de arrecife',
              scientificName: 'Carcharhinus perezi',
              imagePath: 'assets/eco_oceano/tiburon_arrecife.jpg',
              description: 'Depredador marino que habita en aguas poco profundas.',
              weight: '70-100 kg',
              length: '2-2.5 m',
              conservationStatus: 'Casi Amenazado',
              galleryImages: ['assets/eco_oceano/tiburon_arrecife.jpg', 'assets/eco_oceano/tiburon_arrecife2.jpg'],
            ),
            Animal(
              name: 'Pulpo',
              scientificName: 'Octopoda',
              imagePath: 'assets/eco_oceano/pulpo.jpg',
              description: 'Molusco marino con gran capacidad de camuflaje.',
              weight: '5-15 kg',
              length: '0.5-1 m',
              conservationStatus: 'Preocupación Menor',
              galleryImages: ['assets/eco_oceano/pulpo.jpg', 'assets/eco_oceano/pulpo2.jpg'],
            ),
          ],
        ),
        Habitat(
          name: 'Profundidades marinas',
          description: 'Región oscura y fría donde habitan criaturas adaptadas a la presión extrema.',
          imagePath: 'assets/eco_oceano/profundidades.jpg',
          keyPoints: ['Baja luminosidad', 'Alta presión', 'Baja temperatura'],
          temperature: '2-5°C',
          humidity: 'N/A',
          flow: 'Lento',
          animals: [
            Animal(
              name: 'Calamar gigante',
              scientificName: 'Architeuthis dux',
              imagePath: 'assets/eco_oceano/calamar_gigante.jpg',
              description: 'Uno de los invertebrados más grandes del planeta.',
              weight: '200-500 kg',
              length: '10-13 m',
              conservationStatus: 'Datos Insuficientes',
              galleryImages: ['assets/eco_oceano/calamar_gigante.jpg', 'assets/eco_oceano/calamar_gigante2.jpg'],
            ),
            Animal(
              name: 'Pez linterna',
              scientificName: 'Myctophidae',
              imagePath: 'assets/eco_oceano/pez_linterna.jpg',
              description: 'Pez abisal bioluminiscente que vive en aguas profundas.',
              weight: '50-150 g',
              length: '6-15 cm',
              conservationStatus: 'Preocupación Menor',
              galleryImages: ['assets/eco_oceano/pez_linterna.jpg', 'assets/eco_oceano/pez_linterna2.jpg'],
            ),
            Animal(
              name: 'Tiburón anguila',
              scientificName: 'Chlamydoselachus anguineus',
              imagePath: 'assets/eco_oceano/tiburon_anguila.jpg',
              description: 'Especie primitiva de tiburón que vive en aguas profundas.',
              weight: '20-30 kg',
              length: '1.5-2 m',
              conservationStatus: 'Casi Amenazado',
              galleryImages: ['assets/eco_oceano/tiburon_anguila.jpg', 'assets/eco_oceano/tiburon_anguila2.jpg'],
            ),
          ],
        ),
      ];
    }
    if (ecosystemName == 'Sabana') {
      return [
        // ---------------- SABANA ----------------
        Habitat(
          name: 'Praderas',
          description: 'Vastas extensiones de hierba alta y baja, intercaladas con árboles aislados.',
          imagePath: 'assets/eco_sabana/praderas.jpg',
          keyPoints: ['Espacios abiertos', 'Migraciones masivas', 'Condiciones secas'],
          temperature: '25-30°C',
          humidity: '30%',
          flow: 'Viento',
          animals: [
            Animal(
              name: 'León',
              scientificName: 'Panthera leo',
              imagePath: 'assets/eco_sabana/leon.jpg',
              description: 'El "rey de la selva" es un gran depredador social de la sabana, que caza en manadas.',
              weight: '150-250 kg',
              length: '1.8-2.5 m',
              conservationStatus: 'Vulnerable',
              galleryImages: ['assets/leon.jpg', 'assets/leon2.jpg'],
            ),
            Animal(
              name: 'Jirafa',
              scientificName: 'Giraffa camelopardalis',
              imagePath: 'assets/eco_sabana/jirafa.jpg',
              description: 'El animal terrestre más alto, se alimenta de hojas en las copas de los árboles.',
              weight: '800-1900 kg',
              length: '4.3-5.7 m',
              conservationStatus: 'Vulnerable',
              galleryImages: ['assets/jirafa.jpg', 'assets/jirafa2.jpg'],
            ),
            Animal(
              name: 'Cebra',
              scientificName: 'Equus quagga',
              imagePath: 'assets/eco_sabana/cebra.jpg',
              description: 'Equino de rayas blancas y negras, conocido por sus grandes migraciones.',
              weight: '200-450 kg',
              length: '2.2-2.6 m',
              conservationStatus: 'Preocupación Menor',
              galleryImages: ['assets/cebra.jpg', 'assets/cebra2.jpg'],
            ),
          ],
        ),
        Habitat(
          name: 'Aguadas',
          description: 'Puntos de agua vitales para la supervivencia de la fauna, especialmente en la estación seca.',
          imagePath: 'assets/eco_sabana/aguadas.jpg',
          keyPoints: ['Puntos de hidratación', 'Atrae a muchos animales', 'Terreno fangoso'],
          temperature: '28°C',
          humidity: '40%',
          flow: 'Estacionario',
          animals: [
            Animal(
              name: 'Elefante africano',
              scientificName: 'Loxodonta africana',
              imagePath: 'assets/eco_sabana/elefante.jpg',
              description: 'El mamífero terrestre más grande, vital para el ecosistema de la sabana.',
              weight: '3000-6000 kg',
              length: '6-7.5 m',
              conservationStatus: 'En Peligro',
              galleryImages: ['assets/elefante.jpg', 'assets/elefante2.jpg'],
            ),
            Animal(
              name: 'Hipopótamo',
              scientificName: 'Hippopotamus amphibius',
              imagePath: 'assets/eco_sabana/hipopotamo.jpg',
              description: 'Mamífero semi-acuático que pasa el día en el agua para protegerse del sol.',
              weight: '1500-3200 kg',
              length: '2.9-5 m',
              conservationStatus: 'Vulnerable',
              galleryImages: ['assets/hipopotamo.jpg', 'assets/hipopotamo2.jpg'],
            ),
            Animal(
              name: 'Cocodrilo del Nilo',
              scientificName: 'Crocodylus niloticus',
              imagePath: 'assets/eco_sabana/cocodrilo.jpg',
              description: 'Gran reptil depredador que espera a sus presas en las orillas de los ríos y lagos.',
              weight: '225-750 kg',
              length: '3-5 m',
              conservationStatus: 'Preocupación Menor',
              galleryImages: ['assets/cocodrilo.jpg', 'assets/cocodrilo2.jpg'],
            ),
          ],
        ),
      ];
    }
    if (ecosystemName == 'Bosque templado') {
      return [
        // ---------------- BOSQUE TEMPLADO ----------------
        Habitat(
          name: 'Bosque de coníferas',
          description: 'Hábitat dominado por árboles de hoja perenne como pinos y abetos, adaptado a inviernos fríos.',
          imagePath: 'assets/eco_bosque_templado/coniferas.jpg',
          keyPoints: ['Invierno frío', 'Suelo ácido', 'Poca luz solar en el sotobosque'],
          temperature: '5-15°C',
          humidity: '70%',
          flow: 'Moderado',
          animals: [
            Animal(
              name: 'Oso pardo',
              scientificName: 'Ursus arctos',
              imagePath: 'assets/eco_bosque_templado/oso_pardo.jpg',
              description: 'Omnívoro adaptable que busca comida en ríos, bosques y praderas.',
              weight: '180-360 kg',
              length: '1.5-2.8 m',
              conservationStatus: 'Preocupación Menor',
              galleryImages: ['assets/oso_pardo.jpg', 'assets/oso_pardo2.jpg'],
            ),
            Animal(
              name: 'Lince',
              scientificName: 'Lynx lynx',
              imagePath: 'assets/eco_bosque_templado/lince.jpg',
              description: 'Felino solitario con garras retráctiles y un excelente oído para cazar.',
              weight: '18-30 kg',
              length: '0.8-1.3 m',
              conservationStatus: 'Preocupación Menor',
              galleryImages: ['assets/lince.jpg', 'assets/lince2.jpg'],
            ),
            Animal(
              name: 'Búho real',
              scientificName: 'Bubo bubo',
              imagePath: 'assets/eco_bosque_templado/buho.jpg',
              description: 'Ave rapaz nocturna con grandes ojos y un vuelo sigiloso.',
              weight: '1.5-4 kg',
              length: '55-70 cm',
              conservationStatus: 'Preocupación Menor',
              galleryImages: ['assets/buho.jpg', 'assets/buho2.jpg'],
            ),
          ],
        ),
        Habitat(
          name: 'Bosque caducifolio',
          description: 'Caracterizado por árboles que pierden sus hojas en otoño, creando un tapiz de colores y un ciclo de vida estacional.',
          imagePath: 'assets/eco_bosque_templado/caducifolio.jpg',
          keyPoints: ['Cuatro estaciones marcadas', 'Suelo rico y fértil', 'Cambios estacionales'],
          temperature: '10-20°C',
          humidity: '60%',
          flow: 'Moderado',
          animals: [
            Animal(
              name: 'Ciervo',
              scientificName: 'Cervus elaphus',
              imagePath: 'assets/eco_bosque_templado/ciervo.jpg',
              description: 'Herbívoro de gran tamaño con cuernos, se alimenta de hojas, brotes y hierbas.',
              weight: '75-240 kg',
              length: '1.6-2.6 m',
              conservationStatus: 'Preocupación Menor',
              galleryImages: ['assets/ciervo.jpg', 'assets/ciervo2.jpg'],
            ),
            Animal(
              name: 'Ardilla',
              scientificName: 'Sciurus carolinensis',
              imagePath: 'assets/eco_bosque_templado/ardilla.jpg',
              description: 'Pequeño roedor que almacena nueces y semillas para el invierno.',
              weight: '300-600 g',
              length: '20-30 cm',
              conservationStatus: 'Preocupación Menor',
              galleryImages: ['assets/ardilla.jpg', 'assets/ardilla2.jpg'],
            ),
            Animal(
              name: 'Zorro rojo',
              scientificName: 'Vulpes vulpes',
              imagePath: 'assets/eco_bosque_templado/zorro.jpg',
              description: 'Cánido astuto y omnívoro que se ha adaptado a diversos entornos.',
              weight: '3-14 kg',
              length: '45-90 cm',
              conservationStatus: 'Preocupación Menor',
              galleryImages: ['assets/zorro.jpg', 'assets/zorro2.jpg'],
            ),
          ],
        ),
      ];
    }
    return [];
  }
}