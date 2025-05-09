import 'package:flutter/material.dart';
import 'package:whatstats/screens/home.dart';
import 'package:whatstats/screens/zip_selector.dart';
//import 'help.dart';
import 'package:whatstats/screens/view_stats.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  // Lista de pantallas a mostrar
  final List<Widget> _screens = [
    MyHomePage(title: 'hola'),
    ZipSelector(),
    ZipSelector(),
    StatsScreen(title: 'hola')
  ];

  // Lista de iconos para la barra
  final List<IconData> _icons = [
    Icons.home,
    Icons.receipt_long,
    Icons.help_outline,
    Icons.visibility,
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Muestra la pantalla activa
      body: _screens[_selectedIndex],

      // Barra de navegación inferior
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black.withOpacity(0.8),
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,

        // Tamaño de iconos
        selectedIconTheme: IconThemeData(size: 32),
        unselectedIconTheme: IconThemeData(size: 24),

        // Colores de iconos
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white70,

        // Ocultamos etiquetas si sólo queremos iconos
        showSelectedLabels: false,
        showUnselectedLabels: false,

        items: List.generate(4, (i) {
          return BottomNavigationBarItem(
            icon: Icon(_icons[i]),
            label: '',
          );
        }),
      ),
    );
  }
}
