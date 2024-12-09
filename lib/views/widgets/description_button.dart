import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

class DescriptionButton extends StatelessWidget {
  final int index;
  final String title;
  final int selectedIndex;
  final Function(int) onPressed;

  const DescriptionButton({
    Key? key,
    required this.index,
    required this.title,
    required this.selectedIndex,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isSelected = selectedIndex == index;

    return Expanded(
      child: Container(
        height: 60,
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: isSelected ? Color(0xFFB71C1C) : Colors.transparent,
              width: 3.0,
            ),
          ),
        ),
        child: ElevatedButton(
          onPressed: () => onPressed(index),
          child: Text(
            title,
            style: TextStyle(
              fontSize: 15,
              color: isSelected ? Color(0xFFB71C1C) : Colors.white,
            ),
          ),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(const Color(0xFF070420)),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.zero,
              ),
            ),
            elevation: MaterialStateProperty.all<double>(0),
          ),
        ),
      ),
    );
  }
}
