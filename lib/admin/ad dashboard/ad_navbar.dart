import 'package:flutter/material.dart';

class AdNavbar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const AdNavbar({
    Key? key,
    required this.currentIndex,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget buildNavItem({required IconData icon, required String label, required int index}) {
      bool isSelected = currentIndex == index;
      return GestureDetector(
        onTap: () => onTap(index),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              color: isSelected ? Colors.white : Colors.grey,
              size: isSelected ? 28 : 24,
            ),
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
      padding: const EdgeInsets.symmetric(vertical: 20),
      decoration: const BoxDecoration(
        color: Color(0xFF15132B),
        borderRadius: BorderRadius.vertical(top: Radius.circular(50)),
      ),
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              if (currentIndex != 0) buildNavItem(icon: Icons.dashboard, label: 'Dashboard', index: 0),
              if (currentIndex != 1) buildNavItem(icon: Icons.show_chart, label: 'Orders', index: 1),
              if (currentIndex != 2) buildNavItem(icon: Icons.file_copy_outlined, label: 'Approvals', index: 2),
            ],
          ),
          Positioned(
            bottom: 1,
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
                    currentIndex == 0
                        ? Icons.dashboard
                        : currentIndex == 1
                            ? Icons.show_chart
                            : Icons.file_copy_outlined,
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
