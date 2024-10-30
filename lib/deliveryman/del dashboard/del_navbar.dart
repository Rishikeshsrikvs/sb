import 'package:flutter/material.dart';

class DelNavbar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const DelNavbar({
    Key? key,
    required this.currentIndex,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.dashboard),
          label: 'Dashboard',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.show_chart),
          label: 'Orders',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.file_copy_outlined),
          label: 'Earnings',
        ),
      ],
      currentIndex: currentIndex,
      onTap: onTap,
      selectedItemColor: Colors.blueAccent,
      unselectedItemColor: Colors.grey,
      backgroundColor: const Color(0xFF15132B),
    );
  }
}
