void main() {
  String text = "This is a sample text with several words. This text is a sample text.";
  HashTable hashTable = HashTable(100);
  countFrequentWords(hashTable, text);

  hashTable.display();
}


void countFrequentWords(HashTable hashTable, String text) {
  List<String> words = text.toLowerCase().split(RegExp(r'[\s\W]+'));

  for (String word in words) {
    if (word.isEmpty) continue;
    int? count = hashTable.search(word);
    if (count == null) {
      hashTable.insert(word, 1);
    } else {
      hashTable.insert(word, count + 1);
    }
  }
}

class HashTable {
  final int tableSize;
  late List<KeyValue?> table;
  late List<bool> deleted;

  HashTable(this.tableSize) {
    table = List<KeyValue?>.filled(tableSize, null);
    deleted = List<bool>.filled(tableSize, false);
  }

  int _hashFunction(String key) {
    return key.hashCode % tableSize;
  }

  void insert(String key, int value) {
    int index = _hashFunction(key);
    int originalIndex = index;
    while (table[index] != null && table[index]!.key != key && !deleted[index]) {
      index = (index + 1) % tableSize;
      if (index == originalIndex) {
        // The table is full
        return;
      }
    }
    table[index] = KeyValue(key, value);
    deleted[index] = false;
  }

  int? search(String key) {
    int index = _hashFunction(key);
    int originalIndex = index;
    while (table[index] != null) {
      if (table[index]!.key == key && !deleted[index]) {
        return table[index]!.value;
      }
      index = (index + 1) % tableSize;
      if (index == originalIndex) {
        break;
      }
    }
    return null;
  }

  void delete(String key) {
    int index = _hashFunction(key);
    int originalIndex = index;
    while (table[index] != null) {
      if (table[index]!.key == key && !deleted[index]) {
        deleted[index] = true;
        return;
      }
      index = (index + 1) % tableSize;
      if (index == originalIndex) {
        break;
      }
    }
  }

  void display() {
    for (int i = 0; i < tableSize; i++) {
      if (table[i] != null && !deleted[i]) {
        print('${table[i]!.key}: ${table[i]!.value}');
      }
    }
  }
}

class KeyValue {
  final String key;
  int value;

  KeyValue(this.key, this.value);
}





