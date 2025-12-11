import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // Controller untuk mengambil teks dari input
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // Fungsi Logika Login Sederhana
  void _handleLogin() {
    String username = _usernameController.text;
    String password = _passwordController.text;

    // --- LOGIKA DUMMY CREDENTIALS ---
    
    // 1. ROLE: PEMILIK TEMPAT WISATA
    if (username == 'lambda123' && password == 'pass123') {
      // Masuk ke Dashboard Pemilik (yang sudah kita buat lengkap)
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const DashboardPage()),
      );
    } 
    // 2. ROLE: ADMINISTRATOR
    else if (username == 'admin' && password == 'admin123') {
      // Arahkan ke Under Construction dulu (atau Dashboard Admin jika nanti dibuat)
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const UnderConstructionPage()),
      );
    } 
    // 3. ROLE: WISATAWAN
    else if (username == 'user' && password == 'user123') {
      // Arahkan ke Under Construction dulu (atau Home Wisatawan jika nanti dibuat)
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const UnderConstructionPage()),
      );
    } 
    // GAGAL LOGIN
    else {
      // Tampilkan pesan error (Snackbar)
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Username atau Password salah!"),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 40),
              
              // --- LOGO SECTION ---
              // Menggunakan Container lingkaran dengan border teal sesuai gambar
              Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: const Color(0xFF00838F), width: 4),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  // Placeholder logo (Ganti dengan Image.asset('assets/logo.png') jika sudah ada)
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(Icons.travel_explore, size: 40, color: Color(0xFF00838F)),
                      Text(
                        "Wanderlust", 
                        style: TextStyle(
                          fontSize: 10, 
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF00838F)
                        )
                      )
                    ],
                  ),
                ),
              ),
              
              const SizedBox(height: 24),
              
              const Text(
                "Welcome back",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF00838F),
                ),
              ),

              const SizedBox(height: 40),

              // --- FORM INPUT SECTION ---
              
              // Input Email / Username
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Username / Email", // Label di luar
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF00838F),
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 8),
                  TextField(
                    controller: _usernameController,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(color: Color(0xFF00838F)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(color: Color(0xFF00838F)),
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              // Input Password
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Password",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF00838F),
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 8),
                  TextField(
                    controller: _passwordController,
                    obscureText: true, // Sembunyikan teks password
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(color: Color(0xFF00838F)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(color: Color(0xFF00838F)),
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 8),

              // Forgot Password
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                     // Arahkan ke Under Construction
                     Navigator.push(context, MaterialPageRoute(builder: (c) => const UnderConstructionPage()));
                  },
                  child: const Text(
                    "Forgot password?",
                    style: TextStyle(
                      color: Color(0xFF616161),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 24),

              // --- BUTTON LOGIN ---
              SizedBox(
                width: double.infinity, // Lebar penuh
                child: ElevatedButton(
                  onPressed: _handleLogin,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF00838F), // Warna Teal
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    "Log In",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 16),

              // Sign Up Text
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Don't have an account? ",
                    style: TextStyle(color: Color(0xFF616161)),
                  ),
                  GestureDetector(
                    onTap: () {
                      // Arahkan ke Under Construction
                      Navigator.push(context, MaterialPageRoute(builder: (c) => const UnderConstructionPage()));
                    },
                    child: const Text(
                      "Sign Up",
                      style: TextStyle(
                        color: Color(0xFF616161),
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}