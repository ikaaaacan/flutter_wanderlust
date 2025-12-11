import 'package:flutter/material.dart';

class UnderConstructionPage extends StatelessWidget {
  const UnderConstructionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "We're sorry!",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF616161), // Abu-abu tua
                  ),
                ),
                
                const SizedBox(height: 24),

                // Ikon Konstruksi (Menggunakan Icon bawaan yang mirip)
                // Jika ingin persis kerucut, biasanya menggunakan aset gambar (Image.asset)
                // Tapi Icons.construction / Icons.warning_amber bisa jadi alternatif
                const Icon(
                  Icons.construction, // Ikon alat/konstruksi
                  size: 100,
                  color: Colors.grey,
                ),

                const SizedBox(height: 24),

                const Text(
                  "This page is still under\nconstruction.\nCome back later!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                    height: 1.5, // Jarak antar baris teks
                  ),
                ),

                const SizedBox(height: 48),

                // Tombol "go back"
                SizedBox(
                  width: 150, // Lebar tombol
                  child: OutlinedButton(
                    onPressed: () {
                      Navigator.pop(context); // Kembali ke halaman sebelumnya
                    },
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: Colors.grey, width: 2),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 12),
                    ),
                    child: const Text(
                      "go back",
                      style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}