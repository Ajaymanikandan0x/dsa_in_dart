class Node {
  int data;
  Node? left;
  Node? right;

  Node(this.data);
}

class BinarySearchTree {
  Node? root;

  // Inserts a new node with the given data into the BST
  void insert(int data) {
    root = _insert(root, data);
  }

  // Helper function to recursively insert a new node
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

  // Performs an in-order traversal of the BST
  void inOrderTraversal(Node? node) {
    if (node == null) return;
    inOrderTraversal(node.left);
    print(node.data);
    inOrderTraversal(node.right);
  }

  // Performs a pre-order traversal of the BST
  void preOrderTraversal(Node? node) {
    if (node == null) return;
    print(node.data);
    preOrderTraversal(node.left);
    preOrderTraversal(node.right);
  }

  // Performs a post-order traversal of the BST
  void postOrderTraversal(Node? node) {
    if (node == null) return;
    postOrderTraversal(node.left);
    postOrderTraversal(node.right);
    print(node.data);
  }

  // Performs a level-order traversal of the BST
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

  // Searches for a node with the given data in the BST
  bool search(int data) {
    return _search(root, data) != null;
  }

  // Helper function to recursively search for a node
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

  // Deletes a node with the given data from the BST
  void delete(int data) {
    root = _delete(root, data);
  }

  // Helper function to recursively delete a node
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

  // Finds the minimum value node in a subtree
  Node? _findMin(Node? node) {
    while (node?.left != null) {
      node = node?.left;
    }
    return node;
  }

  int height(Node? node) {
    if (node == null) return -1;
    return 1 + _maxHeight(height(node.left), height(node.right));
  }

  int _maxHeight(int? leftHeight, int? rightHeight) {
    if (leftHeight == null) return rightHeight ?? -1;
    if (rightHeight == null) return leftHeight;
    return leftHeight > rightHeight ? leftHeight : rightHeight;
  }

  // Checks if the BST contains a node with the given data
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