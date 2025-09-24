<<<<<<< HEAD
# Practica02_Aplicacion_movil_basica
=======
# 🌍🐾 Viaje Zoológico Inmersivo  

## 📌 Descripción de la aplicación  
**Viaje Zoológico Inmersivo** es una aplicación diseñada para ofrecer una experiencia interactiva sobre el mundo natural.  
La navegación sigue una jerarquía de **tres niveles**:  

1. **Ecosistemas globales** – El usuario elige entre distintos ecosistemas (selva, desierto, océano, sabana, montaña, bosque).  
2. **Hábitats específicos** – Dentro de cada ecosistema se despliegan hábitats más detallados (ej. en la selva: Suelo del Bosque, Copa de los árboles, Río selvático).  
3. **Animales representativos** – Finalmente, el usuario descubre un animal característico de ese hábitat con información visual, textual y multimedia.  


---

## ⚙️ Instrucciones de Instalación y Ejecución

### 🔧 Prerrequisitos  
- **Android Studio**  
- **SDK de Android**  
- **Dispositivo Android** con depuración USB habilitada o **emulador configurado** 

1. **Clonar el repositorio**  
   ```bash
   git clone https://github.com/Ana-gon03/Tarea02_moviles.git

2. **Abrir en Android Studio**
 - Ejecutar Android Studio
 - Seleccionar "Open an existing Android Studio project"
 - Navegar hasta la carpeta del proyecto y seleccionarla

2. **Sincronizar dependencias**
 - Android Studio automáticamente iniciará la sincronización de Gradle 
 -Esperar a que se complete el proceso

4. **Configurar el dispositivo**
 - Conectar un dispositivo Android con depuración USB habilitada, o
 - Iniciar un emulador desde Android Studio

5. **Ejecutar la aplicación**
 - Hacer clic en el botón "Run" (▶️) o usar el atajo Shift + F10
 - Seleccionar el dispositivo de destino
 - La aplicación se instalará y ejecutará automáticamente


---

## 🎨 Decisiones de Diseño y Mecanismos de Transición

### Arquitectura de Navegación
La aplicación implementa una navegación jerárquica de tres niveles usando Activities separadas:

**Nivel 1 - Ecosistema:** Pantalla principal con vista global de ecosistemas
**Nivel 2 - Habitat:** Vista específica de hábitats dentro del ecosistema seleccionado
**Nivel 3 - Animal:** Información detallada del animal seleccionado

### Decisiones de Diseño Visual
**Paleta de Colores**

- Tonos calidos
- Azules profundos
- Grises y azules fríos

### Elementos Visuales
- Fondos degradados que evocan cada ecosistema
- Imagenes
  - Ecosistemas
  - Habitat
  - Animales
 
## Mecanismos de Transición
Transición Nivel 1 → Nivel 2 -> nIVEL 3: "Inmersión Gradual"
- **Tipo:** Transición combinada Fade + Scale
- **Efecto:** La pantalla nueva aparece gradualmente (fade-in) mientras se escala desde un tamaño pequeño al normal

---

## 🔧 Retos y Soluciones

## Reto 1: Diseño de la Interfaz de Usuario
 Al inicio del proyecto, no sabía como diseñarla. No sabía cómo crear una experiencia visual que fuera atractiva.

**Solución Implementada:**

- Estudio de aplicaciones similares para inspiración en paletas de colores y layouts
- Uso de Material Design como guía base para componentes y espaciado
- Iteración constante del diseño basándome en pruebas visuales

## Reto 2: Gestión de Dependencias y Configuración
Durante el desarrollo enfrenté múltiples errores relacionados con dependencias faltantes en el archivo pubspec.yaml. Los errores más comunes fueron:
- Conflictos de versiones entre dependencias

**Solución Implementada:**

- Ejecución sistemática de flutter pub get después de cada cambio
- Verificación de compatibilidad de versiones en pub.dev
- Uso de flutter clean y flutter pub get para limpiar caché corrupto
- Implementación gradual: añadir una dependencia a la vez y probar

## Reto3: Organización del Código y Arquitectura
Al principio, todo mi código estaba en un solo archivo, lo que hacía difícil el mantenimiento y la escalabilidad del proyecto.
  
- Separación gradual de código en archivos específicos por funcionalidad
- Creación de modelos de datos para cada entidad (Ecosistema, Hábitat, Animal)
- Implementación de widgets reutilizables para elementos comunes

-----
### 📸 Capturas de Pantalla

## 🌍 Nivel 1 – Ecosistemas


Vista general con ecosistema: Selva

<p align="center">
  <img src="assets/screenshots/Ecosistema1.jpg" alt="Vista general con ecosistema: Selva" width="500"/>
</p>

Vista general con ecosistema: Desierto y Océano

<p align="center">
  <img src="assets/screenshots/Ecosistema2.jpg" alt="Vista general con ecosistema: Desierto y Océano" width="500"/>
</p>

Vista general con ecosistema: Sabana y Bosque

<p align="center">
  <img src="assets/screenshots/Ecosistema3.jpg" alt="Vista general con ecosistema: Sabana y Bosque" width="500"/>
</p>

--------

## 🏞️ Nivel 2 – Hábitat

**Ecosistema Selva**
Hábitats disponibles: Río selvático, Copa de los árboles, Suelo del bosque

<p align="center">
  <img src="assets/screenshots/selva1.jpg" alt="Habitat" width="500"/>
</p>


**Ecosistema Desierto**
Hábitats disponibles: Dunas de arena, Oasis, Montañas rocosas

<p align="center">
  <img src="assets/screenshots/Desierto1.jpg" alt="Habitat" width="500"/>
</p>


**Ecosistema Océano**
Hábitats disponibles: Superficie, Arrecife de coral, Profundidades marinas

<p align="center">
  <img src="assets/screenshots/oceano1.jpg" alt="Habitat" width="500"/>
</p>


**Ecosistema Sabana**
Hábitats disponibles: Praderas, Aguadas

<p align="center">
  <img src="assets/screenshots/sabana1.jpg" alt="Habitat" width="500"/>
</p>


**Bosque Templado**
Hábitats disponibles: Bosque de Coníferas, Bosque caducifolio

<p align="center">
  <img src="assets/screenshots/bosque1.jpg" alt="Habitat" width="500"/>
</p>


--------

## 🐆 Nivel 3 – Animal

**Selva - Río**

<p align="center">
  <img src="assets/screenshots/rio_selva.jpg" alt="Habitat" width="500"/>
</p>

<p align="center">
  <img src="assets/screenshots/animal_rio_selva.jpg" alt="Habitat" width="500"/>
</p>

<p align="center">
  <img src="assets/screenshots/animal_rio_selva_jaguar.jpg" alt="Habitat" width="500"/>
</p>



**Selva - Copa**

<p align="center">
  <img src="assets/screenshots/copa.jpg" alt="Habitat" width="500"/>
</p>

<p align="center">
  <img src="assets/screenshots/animal_copa.jpg" alt="Habitat" width="500"/>
</p>


**Selva - Suelo**

<p align="center">
  <img src="assets/screenshots/dunas.jpg" alt="Habitat" width="500"/>
</p>

<p align="center">
  <img src="assets/screenshots/dunas_animal.jpg" alt="Habitat" width="500"/>
</p>


**Desierto - Dunas**

<p align="center">
  <img src="assets/screenshots/dunas.jpg" alt="Habitat" width="500"/>
</p>

<p align="center">
  <img src="assets/screenshots/dunas_animal.jpg" alt="Habitat" width="500"/>
</p>


**Desierto - Oasis**

<p align="center">
  <img src="assets/screenshots/oasis.jpg" alt="Habitat" width="500"/>
</p>

<p align="center">
  <img src="assets/screenshots/oasis_animal.jpg" alt="Habitat" width="500"/>
</p>

<p align="center">
  <img src="assets/screenshots/oasis_animal_dro.jpg" alt="Habitat" width="500"/>
</p>




**Desierto - Montañas**

<p align="center">
  <img src="assets/screenshots/monta.jpg" alt="Habitat" width="500"/>
</p>

<p align="center">
  <img src="assets/screenshots/monta_animal.jpg" alt="Habitat" width="500"/>
</p>


**Océano - Superficie**

<p align="center">
  <img src="assets/screenshots/super.jpg" alt="Habitat" width="500"/>
</p>

<p align="center">
  <img src="assets/screenshots/super_animal.jpg" alt="Habitat" width="500"/>
</p>



**Océano - Arrecife**

<p align="center">
  <img src="assets/screenshots/arre.jpg" alt="Habitat" width="500"/>
</p>

<p align="center">
  <img src="assets/screenshots/arre_animal.jpg" alt="Habitat" width="500"/>
</p>


**Océano - Profundidades**

<p align="center">
  <img src="assets/screenshots/profu.jpg" alt="Habitat" width="500"/>
</p>

<p align="center">
  <img src="assets/screenshots/profu_animal.jpg" alt="Habitat" width="500"/>
</p>

<p align="center">
  <img src="assets/screenshots/profu_animal_pez.jpg" alt="Habitat" width="500"/>
</p>




**Sabana - pradera**

<p align="center">
  <img src="assets/screenshots/pradera.jpg" alt="Habitat" width="500"/>
</p>

<p align="center">
  <img src="assets/screenshots/pradera_animal.jpg" alt="Habitat" width="500"/>
</p>

<p align="center">
  <img src="assets/screenshots/pradera_animal_leon.jpg" alt="Habitat" width="500"/>
</p>




**Sabana - Aguadas**

<p align="center">
  <img src="assets/screenshots/aguadas.jpg" alt="Habitat" width="500"/>
</p>

<p align="center">
  <img src="assets/screenshots/aguadas_animal.jpg" alt="Habitat" width="500"/>
</p>


**Bosque - Coníferas**

<p align="center">
  <img src="assets/screenshots/coni.jpg" alt="Habitat" width="500"/>
</p>

<p align="center">
  <img src="assets/screenshots/coni_animal.jpg" alt="Habitat" width="500"/>
</p>



**Bosque - caducifolio**

<p align="center">
  <img src="assets/screenshots/cadu.jpg" alt="Habitat" width="500"/>
</p>

<p align="center">
  <img src="assets/screenshots/cadu_animal.jpg" alt="Habitat" width="500"/>
</p>

<p align="center">
  <img src="assets/screenshots/cadu_animal_ardi.jpg" alt="Habitat" width="500"/>
</p>

## Video







https://github.com/user-attachments/assets/916031f6-853b-4a9e-9697-f338fae41a47





 
>>>>>>> 26556a2 (Practica02)
