import 'package:flutter/material.dart';

class PropertiesPage extends StatefulWidget {
  const PropertiesPage({super.key});

  @override
  State<PropertiesPage> createState() => _PropertiesPageState();
}

class _PropertiesPageState extends State<PropertiesPage> {
  int _selectedIndex = 1; // Index 1 karena ini halaman Properties (tengah)

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    // Logika pindah halaman nanti disatukan
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE0F7FA), // Background biru muda
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              // --- HEADER SECTION ---
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'My Properties',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF00838F),
                    ),
                  ),
                  const CircleAvatar(
                    radius: 24,
                    backgroundImage: NetworkImage('https://i.pravatar.cc/150?img=11'),
                  ),
                ],
              ),

              const SizedBox(height: 24),

              // --- ACTION BAR (ADD & SEARCH) ---
              Row(
                children: [
                  // Tombol "Add new property"
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () {
                        // Logika tambah properti
                      },
                      icon: const Icon(Icons.add_circle_outline, color: Colors.white),
                      label: const Text(
                        "Add new property",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF00838F), // Warna Teal tua
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  // Tombol Search (Bulat Putih)
                  Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.search, color: Colors.grey),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 24),

              // --- DAFTAR KARTU PROPERTI ---
              // Kita panggil fungsi helper 3 kali untuk membuat 3 kartu
              _buildPropertyCard(),
              const SizedBox(height: 16),
              _buildPropertyCard(),
              const SizedBox(height: 16),
              _buildPropertyCard(),
              
              // Tambahan jarak di bawah agar tidak tertutup nav bar
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),

      // --- BOTTOM NAVIGATION BAR ---
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Properties',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_balance_wallet),
            label: 'Account',
          ),
        ],
        currentIndex: _selectedIndex, 
        selectedItemColor: const Color(0xFF00838F),
        onTap: _onItemTapped,
        backgroundColor: Colors.white,
      ),
    );
  }

  // --- WIDGET HELPER: PROPERTY CARD ---
  // Fungsi ini membuat tampilan kartu agar kita tidak perlu copy-paste kode panjang 3 kali
  Widget _buildPropertyCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF26C6DA), // Warna dasar kartu (Cyan)
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          // BAGIAN ATAS: Gambar dan Info Statistik
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Gambar Tempat Wisata (Kiri)
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  'https://picsum.photos/200', // Gambar random dummy
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 16),
              
              // Info Statistik (Kanan)
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Sarae Hills",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    // Badge "Active"
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                      decoration: BoxDecoration(
                        color: const Color(0xFF76FF03), // Hijau terang
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: const Text(
                        "Active",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF1B5E20),
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    
                    // Statistik Grid Kecil (Baris 1)
                    Row(
                      children: [
                        _buildSmallStat(Icons.confirmation_number, "100 tickets"),
                        const SizedBox(width: 12),
                        _buildSmallStat(Icons.favorite, "54 favorites"),
                      ],
                    ),
                    const SizedBox(height: 4),
                    // Statistik Grid Kecil (Baris 2)
                    Row(
                      children: [
                        _buildSmallStat(Icons.monetization_on, "250 sold"),
                         const SizedBox(width: 12),
                        _buildSmallStat(Icons.touch_app, "400 Clicks"),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 16),

          // BAGIAN BAWAH: Tombol Actions dan View
          Row(
            children: [
              // Tombol Actions (Filled)
              Expanded(
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF006064), // Cyan lebih gelap
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text("Actions", style: TextStyle(color: Colors.white)),
                ),
              ),
              const SizedBox(width: 16),
              // Tombol View (Outlined / Border only)
              Expanded(
                child: OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: Colors.white, width: 2),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text("View", style: TextStyle(color: Colors.white)),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // Helper kecil untuk ikon dan teks statistik putih
  Widget _buildSmallStat(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, color: Colors.white, size: 14),
        const SizedBox(width: 4),
        Text(
          text,
          style: const TextStyle(color: Colors.white, fontSize: 10),
        ),
      ],
    );
  }
}