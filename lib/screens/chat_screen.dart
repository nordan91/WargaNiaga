import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chatbot'),
        backgroundColor: Colors.green[700],
      ),
      body: const Center(
        child: Text('Chatbot Rekomendasi Produk - Segera hadir'),
      ),
    );
  }
}