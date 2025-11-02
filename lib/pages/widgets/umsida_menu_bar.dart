import 'package:flutter/material.dart';

class UmsidaMenuBar extends StatelessWidget {
  const UmsidaMenuBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 8),
      color: const Color.fromARGB(255, 7, 104, 184),
      child: Wrap(
        spacing: 50,
        alignment: WrapAlignment.center,
        children: [
          _menuTextButton(context, 'Home', '/home'),
          _menuTextButton(context, 'Visi Misi', '/visimisi'),
          _menuTextButton(context, 'Fakultas', '/fakultas'),
          _menuTextButton(context, 'Prodi', '/prodi'),
          _menuTextButton(context, 'Kontak', '/kontak'),
        ],
      ),
    );
  }

  Widget _menuTextButton(BuildContext context, String label, String route) {
    return TextButton(
      onPressed: () => Navigator.pushNamed(context, route),
      style: TextButton.styleFrom(foregroundColor: Colors.white),
      child: Text(label),
    );
  }
}
