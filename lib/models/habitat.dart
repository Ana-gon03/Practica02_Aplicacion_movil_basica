// lib/models/habitat.dart
import 'animal.dart';
import 'package:flutter/material.dart';

class Habitat {
  final String name;
  final String description;
  final String imagePath;
  // REMOVIDO: final int speciesCount; // No existe en tu código actual
  final List<String> keyPoints;
  final String temperature;
  final String humidity;
  final String flow;
  // AÑADIDO: La lista de animales
  final List<Animal> animals;

  Habitat({
    required this.name,
    required this.description,
    required this.imagePath,
    // REMOVIDO: required this.speciesCount,
    required this.keyPoints,
    required this.temperature,
    required this.humidity,
    required this.flow,
    // AÑADIDO: El parámetro requerido
    required this.animals,
  });
}