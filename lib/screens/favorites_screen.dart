import 'package:flutter/material.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorit'),
        backgroundColor: Colors.green[700],
      ),
      body: const Center(
        child: Text('Halaman Favorit - Belum ada UMKM favorit'),
      ),
    );
  }
}