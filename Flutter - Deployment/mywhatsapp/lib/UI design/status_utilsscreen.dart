import 'package:flutter/material.dart';
import 'dart:io';


class StatusUtils {
  static Future<List<String>> getStatuses(Directory dir) async {
    List<FileSystemEntity> files = dir.listSync();
    List<String> statuses = [];
    for (var file in files) {
      if (file.path.endsWith('.jpg') || file.path.endsWith('.mp4')) {
        statuses.add(file.path);
      }
    }
    return statuses;
  }

  static void showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  static Widget buildStatusGrid(
    BuildContext context,
    List<String> statuses,
    Function(String) onSave,
    Function(String) onDelete,
    Function(String) onView,
    Function(String) onPreview,
  ) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8.0,
        mainAxisSpacing: 8.0,
      ),
      itemCount: statuses.length,
      itemBuilder: (BuildContext context, int index) {
        return InkWell(
          onTap: () {
            onView(statuses[index]);
          },
          onLongPress: () {
            onPreview(statuses[index]);
          },
          onDoubleTap: () {
            onDelete(statuses[index]);
          },
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.file(
              File(statuses[index]),
              fit: BoxFit.cover,
            ),
          ),
        );
      },
    );
  }
}
