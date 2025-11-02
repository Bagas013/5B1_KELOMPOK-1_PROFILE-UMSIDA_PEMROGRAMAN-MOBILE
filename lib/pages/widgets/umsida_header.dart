import 'package:flutter/material.dart';

class UmsidaHeader extends StatelessWidget {
  const UmsidaHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 1),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromARGB(255, 213, 223, 234),
            Color.fromARGB(255, 255, 255, 255),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/logo3.png',
            width: 400,
            height: 100,
            fit: BoxFit.contain,
          ),
          const SizedBox(width: 16),
          Expanded(child: Container()), // bisa isi tagline kalau mau
        ],
      ),
    );
  }
}
