import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:share/share.dart';
import 'status_utilsscreen.dart';
import 'viewscreen.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  List<String> _statuses = [];
  final Directory _whatsappStatusDir =
      Directory('/storage/emulated/0/WhatsApp/Media/.Statuses');
  bool _showImagesOnly = false;

  @override
  void initState() {
    super.initState();
    _loadStatuses();
  }

  Future<void> _loadStatuses() async {
    _statuses = await StatusUtils.getStatuses(_whatsappStatusDir);
    setState(() {});
  }

  Future<void> _saveStatus(String status) async {
    final Directory? appDir = await getExternalStorageDirectory();
    final String? appPath = appDir?.path;
    final String fileName = status.split('/').last;
    final String newPath = '$appPath/$fileName';

    await File(status).copy(newPath);
    setState(() {});
    StatusUtils.showSnackBar(context, 'Status saved to $appPath');
  }

 Future<void> _deleteStatus(String status) async {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      String inputID = '';
      return AlertDialog(
        title: const Text('Confirm Deletion'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('Are you sure you want to delete this status?'),
            const SizedBox(height: 10),
            TextField(
              onChanged: (value) {
                inputID = value;
              },
              decoration: const InputDecoration(
                labelText: 'Enter Your ID',
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () async {
              if (inputID.isNotEmpty) {
                Navigator.pop(context); 
                await _confirmDeletion(status);
              } else {
                StatusUtils.showSnackBar(context, 'Please enter your ID');
              }
            },
            child: const Text('Confirm'),
          ),
        ],
      );
    },
  );
}

Future<void> _confirmDeletion(String status) async {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Confirm Deletion'),
        content: const Text('Are you sure you want to delete this status?'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context); 
            },
            child: const Text('No'),
          ),
          TextButton(
            onPressed: () async {
              await _deleteStatusConfirm(status);
              Navigator.pop(context); 
            },
            child: const Text('Yes'),
          ),
        ],
      );
    },
  );
}

Future<void> _deleteStatusConfirm(String status) async {
  final File file = File(status);
  await file.delete();
  setState(() {
    _statuses.remove(status);
  });
  StatusUtils.showSnackBar(context, 'Status deleted successfully');
}


  void _viewStatus(String status) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ViewStatusScreen(status),
      ),
    );
  }

  void _previewStatus(String status) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Preview'),
          content: Image.file(
            File(status),
            fit: BoxFit.contain,
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }

  void _shareStatus(String status) {
    Share.shareFiles([status]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('WhatsApp Status Saver'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Text('Show Images Only'),
                Switch(
                  value: _showImagesOnly,
                  onChanged: (value) {
                    setState(() {
                      _showImagesOnly = value;
                    });
                  },
                ),
              ],
            ),
            Expanded(
              child: StatusUtils.buildStatusGrid(
                context,
                _statuses,
                _saveStatus,
                _deleteStatus,
                _viewStatus,
                _previewStatus,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _shareStatus(_statuses.isNotEmpty ? _statuses[0] : '');
        },
        child: const Icon(Icons.share),
      ),
    );
  }
}

