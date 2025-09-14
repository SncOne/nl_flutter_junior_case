import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('Profil'),
      centerTitle: false,
      actions: [
        ElevatedButton(
          onPressed: () {
            // Handle search action
          },
          child: Text('Sınırlı Teklif'),
        ),
      ],
    );
  }
}
