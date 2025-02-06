import 'package:flutter/material.dart';

class CustomSearchTextField extends StatelessWidget {
  const CustomSearchTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white, // White background
        borderRadius: BorderRadius.circular(12), // Rounded corners
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2), // Subtle shadow
            spreadRadius: 1,
            blurRadius: 8,
            offset: const Offset(0, 4), // Slightly lower shadow position
          ),
        ],
      ),
      child: TextField(
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(
              vertical: 12, horizontal: 16), // Padding for better spacing
          hintText: 'Search', // Hint text style
          hintStyle: const TextStyle(
              color: Colors.grey), // Subtle grey color for hint text
          prefixIcon: const Icon(
            Icons.search,
            color: Colors.grey, // Icon color
          ),
          filled: true, // Background fill color
          fillColor: Colors.white, // White background for the input
          border: OutlineInputBorder(
            borderRadius:
                BorderRadius.circular(10), // Rounded corners for the border
            borderSide: const BorderSide(
              color: Colors.transparent, // Transparent border by default
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: Colors.transparent, // No border when not focused
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: Colors.blue, // Blue border when focused
              width: 2, // Thicker border when focused
            ),
          ),
        ),
      ),
    );
  }
}
