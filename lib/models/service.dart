import 'package:flutter/material.dart';

class Service {
  final String label;
  final Icon icon;
  final Widget? widget;

  const Service({
    this.widget,
    required this.label,
    required this.icon,
  });
}
