import 'package:flutter/material.dart';

class TransferModel {
  final String title;
  final String subtitle;
  final Widget? widget;

  const TransferModel({
    this.widget,
    required this.title,
    required this.subtitle,
  });
}
