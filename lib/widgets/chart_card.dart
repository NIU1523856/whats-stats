import 'package:flutter/material.dart';

class ChartCard extends StatelessWidget {
  final String title;
  final Widget chart; // puedes pasar cualquier gráfico

  const ChartCard({super.key, required this.chart, required this.title});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          title,
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
        Center(
          child: Container(
            width: screenWidth * 0.9, // 90% del ancho
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black45,
                  blurRadius: 12,
                  offset: Offset(0, 6),
                ),
              ],
            ),
            child: AspectRatio(
              aspectRatio: 16 / 9, // relación 16:9
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: Color(0xFFD0D0D0), // plateado claro
                    width: 2,
                  ),
                ),
                padding: const EdgeInsets.all(3),
                child: chart, // aquí se inyecta el gráfico
              ),
            ),
          ),
        ),
      ],
    );
  }
}
