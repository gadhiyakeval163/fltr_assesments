import 'package:flutter/material.dart';
import 'word.dart';
import 'package:flutter_tts/flutter_tts.dart';

class MyDictionaryScreen extends StatefulWidget {
  final Dictionary dictionary;

  const MyDictionaryScreen({Key? key, required this.dictionary})
      : super(key: key);

  @override
  _DictionaryScreenState createState() => _DictionaryScreenState();
}

class _DictionaryScreenState extends State<MyDictionaryScreen> {
  TextEditingController idController = TextEditingController();
  TextEditingController wordController = TextEditingController();
  TextEditingController meaningController = TextEditingController();
  FlutterTts flutterTts = FlutterTts();

  Word? selectedWord;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('English Dictionary'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: idController,
              decoration: const InputDecoration(
                labelText: 'ID',
              ),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: wordController,
              decoration: const InputDecoration(
                labelText: 'Word',
              ),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: meaningController,
              decoration: const InputDecoration(
                labelText: 'Meaning',
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _addWord,
              child: const Text('Add Word'),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: widget.dictionary.getWords().length,
                itemBuilder: (BuildContext context, int index) {
                  Word word = widget.dictionary.getWords()[index];
                  return ListTile(
                    title: Text(
                      word.word,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(word.meaning),
                    onTap: () {
                      setState(() {
                        selectedWord = word;
                        idController.text = word.id;
                        wordController.text = word.word;
                        meaningController.text = word.meaning;
                      });
                    },
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.volume_up),
                          onPressed: () {
                            speakWord(word.word);
                          },
                        ),
                        IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () {
                            _showDeleteConfirmationDialog(word);
                          },
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _updateWord,
              child: const Text('Update Word'),
            ),
          ],
        ),
      ),
    );
  }

  void _addWord() {
    String id = idController.text;
    String word = wordController.text;
    String meaning = meaningController.text;

    if (id.isNotEmpty && word.isNotEmpty && meaning.isNotEmpty) {
      widget.dictionary.addWord(id, word, meaning);
      setState(() {
        idController.clear();
        wordController.clear();
        meaningController.clear();
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please fill all the fields.'),
        ),
      );
    }
  }

  void _updateWord() {
    if (selectedWord != null) {
      String id = idController.text;
      String word = wordController.text;
      String meaning = meaningController.text;
      if (id.isNotEmpty && word.isNotEmpty && meaning.isNotEmpty) {
        widget.dictionary.updateWord(
          selectedWord!.id,
          id,
          word,
          meaning,
        );
        setState(() {
          selectedWord = null;
          idController.clear();
          wordController.clear();
          meaningController.clear();
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Please fill all the fields.'),
          ),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please select a word to update.'),
        ),
      );
    }
  }

  void _showDeleteConfirmationDialog(Word word) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirm Deletion'),
          content: Text(
              'Are you sure you want to delete the word with ID ${word.id}?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('No'),
            ),
            TextButton(
              onPressed: () {
                widget.dictionary.deleteWord(word.id);
                setState(() {
                  if (selectedWord?.id == word.id) {
                    selectedWord = null;
                    idController.clear();
                    wordController.clear();
                    meaningController.clear();
                  }
                });
                Navigator.of(context).pop();
              },
              child: const Text('Yes'),
            ),
          ],
        );
      },
    );
  }

  void speakWord(String word) {
    flutterTts.speak(word);
  }
}
