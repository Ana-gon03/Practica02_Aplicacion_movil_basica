class Animal {
  final String name;
  final String scientificName;
  final String imagePath; // <-- Agrega esta línea
  final String conservationStatus;
  final String description;
  final String weight;
  final String length;
  final List<String> galleryImages;

  Animal({
    required this.name,
    required this.scientificName,
    required this.imagePath, // <-- Agrega este parámetro al constructor
    required this.conservationStatus,
    required this.description,
    required this.weight,
    required this.length,
    required this.galleryImages,
  });
}