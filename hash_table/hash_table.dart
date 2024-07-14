class HashTable {
  final List<LinkedList<KeyValue>> table;
  final int table_size;

  HashTable(this.table_size)
      : table = List.generate(table_size, (_) => LinkedList());

  int _hash_function(String key) {
    int hash = key.hashCode;
    return hash % table_size;
  }

  void insert(String key, dynamic value) {
    int index = _hash_function(key);
    table[index].add(KeyValue(key, value));
  }

  dynamic search(String key) {
    int index = _hash_function(key);
    var current = table[index].head;
    while (current != null) {
      if (current.data.key == key) {
        return current.data.value;
      }
      current = current.next;
    }
    return null;
  }

  void delete(String key) {
    int index = _hash_function(key);
    var current = table[index].head;
    var prev = null;
    while (current != null) {
      if (current.data.key == key) {
        if (prev == null) {
          table[index].head = current.next;
        } else {
          prev.next = current.next;
        }
        return;
      }
      prev = current;
      current = current.next;
    }
  }
}

class KeyValue {
  final String key;
  final dynamic value;

  KeyValue(this.key, this.value);
}

class LinkedList<T> {
  Node<T>? head;

  void add(T data) {
    var new_node = Node(data);
    if (head == null) {
      head = new_node;
    } else {
      new_node.next = head;
      head = new_node;
    }
  }
}

class Node<T> {
  final T data;
  Node<T>? next;

  Node(this.data);
}

//  Hash Table Operations
class HashTable_<K, V> {
  late List<List<MapEntry<K, V>>> _buckets;
  int _capacity;
  
  HashTable_(this._capacity) {
    _buckets = List<List<MapEntry<K, V>>>.generate(_capacity, (_) => []);
  }
  
  int _hash(K key) {
    return key.hashCode % _capacity;
  }
  
  void put(K key, V value) {
    int index = _hash(key);
    for (int i = 0; i < _buckets[index].length; i++) {
      if (_buckets[index][i].key == key) {
        _buckets[index][i] = MapEntry(key, value);
        return;
      }
    }
    _buckets[index].add(MapEntry(key, value));
  }
  
  V? get(K key) {
    int index = _hash(key);
    for (MapEntry<K, V> entry in _buckets[index]) {
      if (entry.key == key) {
        return entry.value;
      }
    }
    return null;
  }
  
  void remove(K key) {
    int index = _hash(key);
    _buckets[index].removeWhere((entry) => entry.key == key);
  }
}