import 'package:flutter/material.dart';

class DelNavbar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const DelNavbar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    Widget buildNavItem({required IconData icon, required String label, required int index}) {
      bool isSelected = currentIndex == index;
      return GestureDetector(
        onTap: () => onTap(index),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: isSelected ? Colors.white : Colors.grey, size: isSelected ? 28 : 24),
            if (!isSelected)
              Text(
                label,
                style: const TextStyle(color: Colors.grey),
              ),
          ],
        ),
      );
    }

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20), // Adjusted padding for spacing
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 67, 60, 146),
        borderRadius: BorderRadius.vertical(top: Radius.circular(50)),
      ),
      child: Stack(
        clipBehavior: Clip.none, // Prevent clipping for the floating icon
        alignment: Alignment.center,
        children: [
          // Navigation items arranged in a Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              if (currentIndex != 0) buildNavItem(icon: Icons.dashboard, label: 'Dashboard', index: 0),
              if (currentIndex != 1) buildNavItem(icon: Icons.show_chart, label: 'Orders', index: 1),
              if (currentIndex != 2) buildNavItem(icon: Icons.file_copy_outlined, label: 'Earnings', index: 2),
            ],
          ),
          // Floating centered highlighted icon
          Positioned(
            bottom: 1, // Negative bottom value to make it float above the bar
            child: Container(
              decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.black,
                  ),
                   padding: const EdgeInsets.all(20),
              child: Center(
                child: Container(
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.blueAccent,
                  ),
                  padding: const EdgeInsets.all(16),
                  child: Icon(
                    currentIndex == 0 ? Icons.dashboard : currentIndex == 1 ? Icons.show_chart : Icons.file_copy_outlined,
                    color: Colors.white,
                    size: 28,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
