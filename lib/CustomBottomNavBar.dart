import 'package:flutter/material.dart';

class CustomBottomNavBar extends StatefulWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomBottomNavBar({
    Key? key,
    required this.currentIndex,
    required this.onTap,
  }) : super(key: key);

  @override
  _CustomBottomNavBarState createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  final List<IconData> _icons = [
    Icons.home,
    Icons.search,
    Icons.equalizer,
    Icons.person,
  ];

  final List<String> _titles = ["首页", "搜索", "发现", "我的"];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      height: 65,
      decoration: BoxDecoration(
        color: const Color(0xff42dee4),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(_icons.length, (index) {
          bool isSelected = index == widget.currentIndex;
          return GestureDetector(
            onTap: () {
              widget.onTap(index);
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                children: [
                  Icon(
                    _icons[index],
                    color: isSelected ? Colors.black : Colors.black54,
                    size: 24,
                  ),
                  if (isSelected)
                    const SizedBox(width: 6),
                  if (isSelected)
                    Text(
                      _titles[index],
                      style: const TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
