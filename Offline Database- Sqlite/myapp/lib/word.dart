class Dictionary {
  final Map<String, Word> _words = {};

  void addWord(String id, String word, String meaning) {
    _words[id] = Word(id, word, meaning);
  }

  void updateWord(String id, String newMeaning, String word, String meaning) {
    if (_words.containsKey(id)) {
      _words[id]!.meaning = newMeaning;
    }
  }

  void deleteWord(String id) {
    if (_words.containsKey(id)) {
      _words.remove(id);
    }
  }

  List<Word> getWords() {
    return _words.values.toList();
  }
}

Future<void> speakWord(String word) async {
  var flutterTts;
  await flutterTts.speak(word);
}

class Word {
  String id;
  String word;
  String meaning;

  Word(this.id, this.word, this.meaning);
}
