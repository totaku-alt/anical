import 'package:anical/constants/colors.dart';
import 'package:flutter/material.dart';

Widget titles(String title) {
  return Padding(
    padding: const EdgeInsets.only(left: 30),
    child: Text(
      title,
      style: const TextStyle(
          fontSize: 40, fontWeight: FontWeight.bold, color: textPrimaryColor),
    ),
  );
}

Widget subtitle(String subtitle) {
  return Padding(
    padding: const EdgeInsets.only(
      left: 31,
      top: 10,
    ),
    child: Text(
      subtitle,
      style: const TextStyle(fontSize: 22, color: textPrimaryColor),
    ),
  );
}
