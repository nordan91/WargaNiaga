# Etalase Digital UMKM Kelurahan Duren Sawit - Project Plan

## Latar Belakang (Background)
Warga Kelurahan Duren Sawit sering menghadapi kesulitan dalam menemukan informasi mengenai UMKM yang ada di lingkungan sekitarnya. Sementara itu, pihak kelurahan juga membutuhkan sistem pendataan yang terpusat dan akurat untuk mendukung berbagai program pemberdayaan ekonomi lokal. Berdasarkan permasalahan tersebut, kami mengusulkan pengembangan "Etalase Digital UMKM Kelurahan Duren Sawit", yaitu sebuah platform non-transaksional yang berfungsi sebagai katalog online untuk menampilkan profil serta produk dari para pelaku UMKM. Platform ini dirancang dalam dua bentuk: aplikasi bagi pengguna untuk mencari dan menelusuri UMKM, serta website bagi pihak admin untuk melakukan pengelolaan dan pembaruan data secara terpusat.

## Tujuan Proyek (Project Objectives)
Proyek ini bertujuan untuk membangun aplikasi etalase digital yang menjadi sarana promosi aman dan etis bagi UMKM lokal untuk menampilkan profil serta produk mereka. Selain itu, platform ini akan menyediakan sistem pendataan terpusat bagi pihak kelurahan untuk analisis potensi ekonomi. Sebagai fitur unggulan, aplikasi ini akan mengimplementasikan chat interakif berbasis chatbot untuk memberikan rekomendasi produk kepada konsumen.

## Ruang Lingkup Proyek (Project Scope)
Proyek ini meliputi analisis kebutuhan, perancangan sistem, implementasi aplikasi berbasis web dan mobile, pengujian, serta penerapan chat interakif berbasis chatbot untuk memberikan rekomendasi produk kepada konsumen. Proyek akan dikelola menggunakan Notion sebagai alat perencanaan dan kolaborasi tim.

## Batasan Masalah (Problem Limitations)
1. Aplikasi tidak menyediakan fitur transaksi jual-beli online.
2. Fokus hanya pada pelaku UMKM yang berada di wilayah Kelurahan Duren Sawit.
3. Pengumpulan data UMKM dilakukan secara manual melalui pihak kelurahan.
4. Chatbot hanya digunakan untuk chat interaktif dan rekomendasi produk.

## Metodologi Pengembangan (Development Methodology)
Metode pengembangan yang digunakan adalah metode Agile dengan pendekatan iteratif. Setiap sprint berfokus pada penyelesaian modul tertentu dengan evaluasi mingguan.

## Arsitektur Sistem (System Architecture)
- **Frontend User**: Aplikasi mobile Flutter untuk pengguna akhir (Android/iOS).
- **Frontend Admin**: Website untuk admin (kemungkinan Flutter Web atau framework web terpisah seperti React/Vue).
- **Backend**: API server untuk data UMKM, autentikasi, dan chatbot. Menggunakan Firebase atau server custom (Node.js/Express, atau Dart dengan Aqueduct).
- **Database**: Firestore (NoSQL) atau PostgreSQL/MySQL untuk data UMKM.
- **Chatbot**: Integrasi dengan Dialogflow atau custom AI untuk rekomendasi produk.

## Fitur Utama (Key Features)
### Aplikasi User (Flutter)
- Halaman beranda dengan katalog UMKM.
- Pencarian dan filter UMKM berdasarkan kategori, lokasi.
- Detail profil UMKM dan produk.
- Chatbot interaktif untuk rekomendasi produk.
- Favorit dan bookmark UMKM.

### Website Admin
- Dashboard untuk mengelola data UMKM (tambah, edit, hapus).
- Upload gambar produk.
- Laporan analisis ekonomi.
- Manajemen pengguna (jika diperlukan).

## Teknologi Stack (Tech Stack)
- **Mobile App**: Flutter (Dart).
- **Web Admin**: React (for web-specific optimizations).
- **Backend**: Firebase (for simplicity and scalability).
- **Database**: Firestore (NoSQL).
- **Chatbot**: Simple rule-based system.

## Rencana Implementasi (Implementation Plan)
1. Analisis dan desain UI/UX.
2. Setup backend dan database.
3. Implementasi aplikasi user (prototype).
4. Implementasi website admin.
5. Integrasi chatbot.
6. Testing dan deployment.

## Prototype Aplikasi User
Buat prototype sederhana dengan:
- Halaman beranda dengan list UMKM dummy.
- Navigasi dasar.
- Mock data untuk katalog.

## Timeline dan Milestones (Timeline and Milestones)
Menggunakan metode Agile dengan sprint 1-2 minggu.

- **Sprint 1**: Analisis kebutuhan, desain arsitektur, setup proyek Flutter dan Firebase. (1 minggu)
- **Sprint 2**: Implementasi prototype user app (home, catalog, navigation). (1 minggu)
- **Sprint 3**: Setup admin web dengan React, integrasi backend. (2 minggu)
- **Sprint 4**: Implementasi fitur admin (CRUD UMKM), testing. (2 minggu)
- **Sprint 5**: Integrasi chatbot, final testing, deployment. (2 minggu)

Total estimasi: 8 minggu.

## Diagram Arsitektur (Architecture Diagram)
```mermaid
graph TD
    A[User App - Flutter] --> B[Backend API]
    C[Admin Web] --> B
    B --> D[Database]
    A --> E[Chatbot Service]
    E --> B