import 'package:flutter/material.dart';

class MapScreen extends StatelessWidget {
  const MapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Peta UMKM'),
        backgroundColor: Colors.green[700],
      ),
      body: const Center(
        child: Text('Peta untuk melihat UMKM di sekitar - fitur segera hadir'),
      ),
    );
  }
}