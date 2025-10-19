import 'package:flutter/material.dart';
import '../data/mock_data.dart';
import '../models/umkm.dart';
import 'umkm_detail_screen.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String _searchQuery = '';
  String _selectedCategory = 'Semua';
  final bool _isLoggedIn = false; // Mock login state

  List<String> get categories => ['Semua', ...mockUmkmData.map((e) => e.category).toSet()];

  List<Umkm> get filteredUmkm {
    var list = mockUmkmData;
    if (_selectedCategory != 'Semua') {
      list = list.where((umkm) => umkm.category == _selectedCategory).toList();
    }
    if (_searchQuery.isNotEmpty) {
      list = list.where((umkm) =>
          umkm.name.toLowerCase().contains(_searchQuery.toLowerCase()) ||
          umkm.description.toLowerCase().contains(_searchQuery.toLowerCase())).toList();
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cari UMKM'),
        backgroundColor: Colors.green[700],
        actions: [
          if (_isLoggedIn)
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: () {
                // Navigate to add product screen
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Tambah produk - fitur segera hadir')),
                );
              },
            ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              onChanged: (value) => setState(() => _searchQuery = value),
              decoration: InputDecoration(
                hintText: 'Cari UMKM...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
          ),
          Container(
            height: 50,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: categories.map((category) {
                final categoryCount = category == 'Semua'
                    ? mockUmkmData.length
                    : mockUmkmData.where((umkm) => umkm.category == category).length;

                return Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: FilterChip(
                    label: Text('$category ($categoryCount)'),
                    selected: _selectedCategory == category,
                    onSelected: (selected) {
                      setState(() => _selectedCategory = category);
                    },
                    backgroundColor: Colors.green[100],
                    selectedColor: Colors.green[300],
                  ),
                );
              }).toList(),
            ),
          ),
          // Search results info
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Ditemukan ${filteredUmkm.length} UMKM',
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 14,
                  ),
                ),
                if (_selectedCategory != 'Semua')
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.green[100],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      'Kategori: $_selectedCategory',
                      style: TextStyle(
                        color: Colors.green[800],
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
              ],
            ),
          ),
          Expanded(
            child: filteredUmkm.isEmpty
                ? const Center(child: Text('Tidak ada UMKM ditemukan'))
                : ListView.builder(
                    itemCount: filteredUmkm.length,
                    itemBuilder: (context, index) {
                      final umkm = filteredUmkm[index];
                      return Card(
                        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        elevation: 4,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: InkWell(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => UmkmDetailScreen(umkm: umkm),
                              ),
                            );
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(16),
                            child: Row(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Image.network(
                                    umkm.imageUrl,
                                    width: 80,
                                    height: 80,
                                    fit: BoxFit.cover,
                                    errorBuilder: (context, error, stackTrace) =>
                                        Container(
                                          width: 80,
                                          height: 80,
                                          color: Colors.grey[300],
                                          child: const Icon(Icons.store, size: 40),
                                        ),
                                  ),
                                ),
                                const SizedBox(width: 16),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        umkm.name,
                                        style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(height: 4),
                                      Chip(
                                        label: Text(umkm.category),
                                        backgroundColor: Colors.green[100],
                                        labelStyle: TextStyle(color: Colors.green[800]),
                                      ),
                                      const SizedBox(height: 8),
                                      Text(
                                        umkm.description,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(color: Colors.grey[600]),
                                      ),
                                      const SizedBox(height: 8),
                                      Text(
                                        'Produk: ${umkm.products.take(2).join(", ")}${umkm.products.length > 2 ? "..." : ""}',
                                        style: TextStyle(
                                          color: Colors.green[600],
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}