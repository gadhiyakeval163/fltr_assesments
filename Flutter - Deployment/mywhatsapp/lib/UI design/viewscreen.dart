
import 'package:flutter/material.dart';
import 'dart:io';

class ViewStatusScreen extends StatelessWidget {
  final String status;

  const ViewStatusScreen(this.status, {super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('View Status'),
      ),
      body: Center(
        child: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Image.file(
            File(status),
          ),
        ),
      ),
    );
  }
}
