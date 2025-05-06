# whatstats

WhatStats by CyborgApps

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

lib/
│
├── main.dart                      # Punto de entrada
│
├── core/                          # Utilidades generales y constantes
│   ├── theme.dart                 # Temas y estilos globales
│   ├── constants.dart             # Constantes reutilizables
│   └── helpers.dart               # Funciones auxiliares
│
├── models/                        # Clases de datos (por ejemplo: Usuario, Archivo)
│   └── usuario_model.dart
│
├── services/                      # Lógica de backend, APIs, almacenamiento, etc.
│   ├── zip_service.dart
│   ├── file_service.dart
│   └── audio_service.dart
│
├── providers/                     # Lógica de estado (con Provider, Riverpod, etc.)
│   └── usuario_provider.dart
│
├── screens/                       # Pantallas completas de la app
│   ├── home_screen.dart
│   ├── perfil_screen.dart
│   └── leaderboard_screen.dart
│
├── widgets/                       # Widgets reutilizables
│   ├── archivo_card.dart
│   └── ranking_tile.dart
│
├── data/                          # Archivos JSON, datos mock, recursos estáticos
│   └── dummy_leaderboard.json
│
└── routes/                        # Rutas centralizadas (si no usas GoRouter)
└── app_routes.dart

