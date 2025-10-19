import 'package:flutter/material.dart';
import 'main_navigation.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
   final _emailController = TextEditingController();
   final _passwordController = TextEditingController();
   bool _isLogin = true;
   String _userType = 'user'; // 'user' or 'umkm'

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Warga Niaga'),
        backgroundColor: Colors.green[700],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // User Type Selection (shown initially)
            if (!_showAuthForm())
              _buildUserTypeSelection(),

            // Guest User Interface
            if (_userType == 'user' && _showAuthForm())
              _buildGuestLogin(),

            // UMKM Authentication Interface
            if (_userType == 'umkm' && _showAuthForm())
              _buildUmkmAuth(),
          ],
        ),
      ),
    );
  }

  bool _showAuthForm() {
    return _userType.isNotEmpty;
  }

  Widget _buildUserTypeSelection() {
    return Column(
      children: [
        const Text(
          'Pilih Tipe Akun',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        const Text(
          'Pilih jenis akun yang sesuai dengan kebutuhan Anda',
          style: TextStyle(fontSize: 16, color: Colors.grey),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 32),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(
            color: Colors.grey[100],
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            children: [
              const Text(
                'Pilih tipe akun:',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () => setState(() => _userType = 'user'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: _userType == 'user' ? Colors.green[700] : Colors.white,
                        foregroundColor: _userType == 'user' ? Colors.white : Colors.green[700],
                        side: BorderSide(color: Colors.green[700]!),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text('Pengguna'),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () => setState(() => _userType = 'umkm'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: _userType == 'umkm' ? Colors.green[700] : Colors.white,
                        foregroundColor: _userType == 'umkm' ? Colors.white : Colors.green[700],
                        side: BorderSide(color: Colors.green[700]!),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text('UMKM'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildGuestLogin() {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.green[50],
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Colors.green[200]!),
          ),
          child: Column(
            children: [
              const Icon(
                Icons.person_outline,
                size: 64,
                color: Colors.green,
              ),
              const SizedBox(height: 16),
              const Text(
                'Masuk sebagai Tamu',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text(
                'Akses terbatas untuk melihat UMKM dan informasi desa',
                style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  // Guest login - navigate directly to main app
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => const MainNavigation()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green[700],
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text('Masuk sebagai Tamu'),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        TextButton(
          onPressed: () => setState(() => _userType = ''),
          child: const Text('Kembali memilih tipe akun'),
        ),
      ],
    );
  }

  Widget _buildUmkmAuth() {
    return Column(
      children: [
        Text(
          _isLogin ? 'Masuk UMKM' : 'Daftar UMKM',
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Text(
          _isLogin ? 'Masuk ke akun UMKM Anda' : 'Buat akun UMKM baru',
          style: const TextStyle(fontSize: 16, color: Colors.grey),
        ),
        const SizedBox(height: 24),
        TextField(
          controller: _emailController,
          decoration: InputDecoration(
            labelText: 'Email',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            prefixIcon: const Icon(Icons.email),
          ),
        ),
        const SizedBox(height: 16),
        TextField(
          controller: _passwordController,
          obscureText: true,
          decoration: InputDecoration(
            labelText: 'Password',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            prefixIcon: const Icon(Icons.lock),
          ),
        ),
        const SizedBox(height: 24),
        ElevatedButton(
          onPressed: () {
            // UMKM authentication - navigate to main app
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => const MainNavigation()),
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green[700],
            minimumSize: const Size(double.infinity, 50),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: Text(_isLogin ? 'Masuk' : 'Daftar'),
        ),
        TextButton(
          onPressed: () => setState(() => _isLogin = !_isLogin),
          child: Text(_isLogin ? 'Belum punya akun? Daftar' : 'Sudah punya akun? Masuk'),
        ),
        const SizedBox(height: 16),
        TextButton(
          onPressed: () => setState(() => _userType = ''),
          child: const Text('Kembali memilih tipe akun'),
        ),
      ],
    );
  }
}