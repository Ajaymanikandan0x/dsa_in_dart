// void main() {
//   String text = "This is a sample text with several words. This text is a sample text.";
//   HashTable hashTable = HashTable(100);
//   countFrequentWords(hashTable, text);

//   hashTable.display();
// }


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

// _____________________________________________________________________________

class LinearProbingHashTable<K, V> {
  int _capacity;
  late List<MapEntry<K, V>?> _table;

  LinearProbingHashTable(this._capacity) {
    _table = List.filled(_capacity, null);
  }

  int _hash(K key) {
    return key.hashCode % _capacity;
  }

  void put(K key, V value) {
    int index = _hash(key);

    // Linear probing to find an empty or matching slot
    while (_table[index] != null && _table[index]!.key != key) {
      index = (index + 1) % _capacity;
    }

    _table[index] = MapEntry(key, value);
  }

  V? get(K key) {
    int index = _hash(key);

    while (_table[index] != null) {
      if (_table[index]!.key == key) {
        return _table[index]!.value;
      }
      index = (index + 1) % _capacity;
    }

    return null; // Key not found
  }

  void delete(K key) {
    int index = _hash(key);

    while (_table[index] != null) {
      if (_table[index]!.key == key) {
        _table[index] = null;
        return;
      }
      index = (index + 1) % _capacity;
    }
  }

  void printTable() {
    for (int i = 0; i < _capacity; i++) {
      if (_table[i] != null) {
        print("Key: ${_table[i]!.key}, Value: ${_table[i]!.value}");
      }
    }
  }
}

void main() {
  var table = LinearProbingHashTable<int, String>(10);
  
  table.put(1, "One");
  table.put(2, "Two");
  table.put(11, "Eleven"); // Collides with key 1
  table.put(21, "Twenty-One"); // Collides with key 1 and 11

  print("Linear Probing Hash Table:");
  table.printTable();

  print("\nValue at key 2: ${table.get(2)}");
  print("Value at key 11: ${table.get(11)}");

  print("\nDeleting key 2...");
  table.delete(2);

  print("\nHash Table after deletion:");
  table.printTable();
}





