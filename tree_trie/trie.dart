class TrieNode {
  Map<String, TrieNode> children = {};
  bool isEndOfWord = false;
}

class Trie {
  final TrieNode root = TrieNode();

  // Inserts a word into the trie
  void insert(String word) {
    TrieNode currentNode = root;
    for (var char in word.split('')) {
      currentNode = currentNode.children.putIfAbsent(char, () => TrieNode());
    }
    currentNode.isEndOfWord = true;
  }

  // Searches for a word in the trie
  bool search(String word) {
    TrieNode currentNode = root;
    for (var char in word.split('')) {
      if (!currentNode.children.containsKey(char)) {
        return false;
      }
      currentNode = currentNode.children[char]!;
    }
    return currentNode.isEndOfWord;
  }

  // Checks if any word in the trie starts with the given prefix
  bool startsWith(String prefix) {
    TrieNode currentNode = root;
    for (var char in prefix.split('')) {
      if (!currentNode.children.containsKey(char)) {
        return false;
      }
      currentNode = currentNode.children[char]!;
    }
    return true;
  }

  // Returns a list of words that start with the given prefix
  List<String> autocomplete(String prefix) {
    List<String> results = [];
    TrieNode currentNode = root;
    for (var char in prefix.split('')) {
      if (!currentNode.children.containsKey(char)) {
        return results; // No words with this prefix
      }
      currentNode = currentNode.children[char]!;
    }
    _findAllWords(currentNode, prefix, results);
    return results;
  }

  // Helper function to find all words with a given prefix
  void _findAllWords(TrieNode node, String currentWord, List<String> results) {
    if (node.isEndOfWord) {
      results.add(currentWord);
    }
    node.children.forEach((char, childNode) {
      _findAllWords(childNode, currentWord + char, results);
    });
  }

  // Deletes a word from the trie
  void delete(String word) {
    _delete(root, word, 0);
  }

  // Helper function to recursively delete a word from the trie
  bool _delete(TrieNode node, String word, int index) {
    if (index == word.length) {
      if (!node.isEndOfWord) {
        return false;
      }
      node.isEndOfWord = false;
      return node.children.isEmpty;
    }

    String char = word[index];
    if (!node.children.containsKey(char)) {
      return false;
    }

    bool shouldDeleteCurrentNode =
        _delete(node.children[char]!, word, index + 1);

    if (shouldDeleteCurrentNode) {
      node.children.remove(char);
      return node.children.isEmpty && !node.isEndOfWord;
    }

    return false;
  }
}

void main() {
  Trie trie = Trie();
  trie.insert("hello");
  trie.insert("hell");
  trie.insert("heaven");
  trie.insert("heavy");

  List<String> suggestions = trie.autocomplete("he");
  print(suggestions); // [hello, hell, heaven, heavy]

  suggestions = trie.autocomplete("hell");
  print(suggestions); // [hello, hell]

  trie.delete("hell");
  suggestions = trie.autocomplete("hell");
  print(suggestions); // [hello]
}

