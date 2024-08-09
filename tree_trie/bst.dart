class Node {
  int data;
  Node? left;
  Node? right;

  Node(this.data);
}

class BinarySearchTree {
  Node? root;

  void insert(int data) {
    root = _insert(root, data);
  }

  Node _insert(Node? node, int data) {
    if (node == null) {
      return Node(data);
    }
    if (data < node.data) {
      node.left = _insert(node.left, data);
    } else {
      node.right = _insert(node.right, data);
    }
    return node;
  }

  void inOrderTraversal(Node? node) {
    if (node == null) return;
    inOrderTraversal(node.left);
    print(node.data);
    inOrderTraversal(node.right);
  }

  void preOrderTraversal(Node? node) {
    if (node == null) return;
    print(node.data);
    preOrderTraversal(node.left);
    preOrderTraversal(node.right);
  }

  void postOrderTraversal(Node? node) {
    if (node == null) return;
    postOrderTraversal(node.left);
    postOrderTraversal(node.right);
    print(node.data);
  }

  void levelOrderTraversal(Node? root) {
    if (root == null) return;

    final queue = <Node>[];
    queue.add(root);

    while (queue.isNotEmpty) {
      final node = queue.removeAt(0);
      print(node.data);
      if (node.left != null) queue.add(node.left!);
      if (node.right != null) queue.add(node.right!);
    }
  }

  bool search(int data) {
    return _search(root, data) != null;
  }

  Node? _search(Node? node, int data) {
    if (node == null || node.data == data) {
      return node;
    }
    if (data < node.data) {
      return _search(node.left, data);
    } else {
      return _search(node.right, data);
    }
  }

  void delete(int data) {
    root = _delete(root, data);
  }

  Node? _delete(Node? node, int data) {
    if (node == null) return null;

    if (data < node.data) {
      node.left = _delete(node.left, data);
    } else if (data > node.data) {
      node.right = _delete(node.right, data);
    } else {
      // Node to delete found
      if (node.left == null) return node.right;
      if (node.right == null) return node.left;

      // Node has two children
      Node? minRight = _findMin(node.right);
      node.data = minRight!.data;
      node.right = _delete(node.right, minRight.data);
    }
    return node;
  }

  Node? _findMin(Node? node) {
    while (node?.left != null) {
      node = node?.left;
    }
    return node;
  }
    bool contains(int data) {
    Node? current = root;
    while (current != null) {
      if (data < current.data) {
        current = current.left;
      } else if (data > current.data) {
        current = current.right;
      } else {
        return true;
      }
    }
    return false;
  }
}

void main() {
  BinarySearchTree bst = BinarySearchTree();
  bst.insert(50);
  bst.insert(30);
  bst.insert(70);
  bst.insert(20);
  bst.insert(40);
  bst.insert(60);
  bst.insert(80);

  print("In-order Traversal:");
  bst.inOrderTraversal(bst.root);

  print("Search for 60: ${bst.search(60)}");
  print("Search for 25: ${bst.search(25)}");

  print("Deleting 30:");
  bst.delete(30);
  print("In-order Traversal after deletion:");
  bst.inOrderTraversal(bst.root);
}