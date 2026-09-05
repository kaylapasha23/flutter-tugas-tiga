import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey[100],
        body: const Center(
          child: TieredPricingCard(),
        ),
      ),
    );
  }
}

class TieredPricingCard extends StatelessWidget {
  const TieredPricingCard({super.key});

  @override
  Widget build(BuildContext context) {
    // Layer Dasar (Pembungkus Utama)
    return Container(
      width: 300,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      // Badge Melayang (Penggunaan Stack)
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          // Isi Utama Kartu
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),

                // Header Paket (Penggunaan Column)
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.laptop_mac,
                      size: 40,
                      color: Colors.blueAccent,
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Paket Profesional',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'Solusi terbaik untuk kebutuhan sistem dan pengembangan IT Anda.',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 20),

                // Harga & Durasi (Penggunaan Row dengan baseline alignment)
                const Row(
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text(
                      'Rp 5.000.000',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueAccent,
                      ),
                    ),
                    SizedBox(width: 4),
                    Text(
                      '/ proyek',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 20),

                // Daftar Fitur Layanan (Kombinasi Column & Row)
                const Column(
                  children: [
                    FeatureItem(text: 'Desain UI/UX Khusus'),
                    SizedBox(height: 8),
                    FeatureItem(text: 'Setup Database'),
                    SizedBox(height: 8),
                    FeatureItem(text: 'Integrasi API'),
                    SizedBox(height: 8),
                    FeatureItem(text: 'Dukungan Teknis 24/7'),
                  ],
                ),

                const SizedBox(height: 24),

                // Tombol Call-to-Action (SizedBox width double.infinity agar membentang)
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueAccent,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 12),
                    ),
                    child: const Text(
                      'Pilih Paket',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Badge Melayang (Positioned di sudut kanan atas)
          Positioned(
            top: 15,
            right: 15,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Text(
                'Rekomendasi',
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Widget tambahan untuk item fitur layanan (Row dengan Icon centang dan Text)
class FeatureItem extends StatelessWidget {
  final String text;

  const FeatureItem({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(
          Icons.check,
          color: Colors.green,
          size: 18,
        ),
        const SizedBox(width: 8),
        Text(
          text,
          style: const TextStyle(fontSize: 14),
        ),
      ],
    );
  }
}