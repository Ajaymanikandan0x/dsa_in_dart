class Node {
  int data;
  Node? next;
  Node? prev;
  Node(this.data);
}

class DoublyLinkedList {
  Node? head;
  Node? tail;

  // Method to add a node to the doubly linked list
  void add_node(int data) {
    var new_node = Node(data);

    if (head == null) {
      head = tail = new_node;
    } else {
      tail!.next = new_node;
      new_node.prev = tail;
      tail = new_node;
    }
  }

  // Method to insert a node at a specific position
  void insert_node({required int value, required int pos}) {
    Node new_node = Node(value);
    var temp = head;
    int po = 1;

    if (pos == 0) {
      new_node.next = head;
      if (head != null) {
        head!.prev = new_node;
      }
      head = new_node;
      if (tail == null) {
        tail = new_node;
      }
      return;
    }

    while (temp != null && temp.next != null) {
      if (po == pos) {
        new_node.next = temp.next;
        temp.next!.prev = new_node;
        temp.next = new_node;
        new_node.prev = temp;
        if (new_node.next == null) {
          tail = new_node;
        }
        return;
      }
      temp = temp.next;
      po++;
    }

    if (temp != null && po == pos) {
      temp.next = new_node;
      new_node.prev = temp;
      tail = new_node;
    }
  }

  // Method to delete a node with specific data
  void delete(int data) {
    if (head!.data == data) {
      head = head!.next;
      head!.prev = null;
      return;
    }

    Node? temp = head;
    while (temp != null) {
      if (temp == tail) {
        tail = temp.prev;
        tail!.next = null;
        return;
      }
      if (temp.data == data) {
        temp.prev!.next = temp.next;
        temp.next!.prev = temp.prev;
        return;
      }
      temp = temp.next;
    }
  }

  // Method to display the list forward
  void display_forward() {
    if (head == null) {
      print('no data available');
      return;
    }
    var temp = head;
    while (temp != null) {
      print(temp.data);
      temp = temp.next;
    }
  }

  // Method to display the list backward
  void display_backward() {
    if (tail == null) {
      print('no data available');
      return;
    }
    var temp = tail;
    while (temp != null) {
      print(temp.data);
      temp = temp.prev;
    }
  }

  // Method to delete duplicate nodes
  void delete_duplicate() {
    if (head == null) {
      return;
    }
    Node? temp = head;

    while (temp != null) {
      Node? next = temp.next;
      while (next != null) {
        if (next.data == temp.data) {
          next = next.next;
          if (next != null) {
            next.prev = temp;
          }
        } else {
          next = next.next;
        }
      }
      temp = temp.next;
    }
  }
}

// Method to insert a node at a specific position in a doubly linked list
void insert_node_at_position(DoublyLinkedList list, int position, int data) {
  var new_node = Node(data);
  var current = list.head;
  if (position == 0) {
    new_node.next = list.head;
    if (list.head != null) list.head!.prev = new_node;
    list.head = new_node;
    return;
  }
  for (int i = 0; i < position - 1 && current != null; i++) {
    current = current.next;
  }
  if (current != null) {
    new_node.next = current.next;
    new_node.prev = current;
    if (current.next != null) current.next!.prev = new_node;
    current.next = new_node;
  }
}

// Method to delete a specific node in a doubly linked list
void delete_node(DoublyLinkedList list, Node? del) {
  if (del == null) return;
  if (del.prev != null) del.prev!.next = del.next;
  if (del.next != null) del.next!.prev = del.prev;
  if (list.head == del) list.head = del.next;
}

void main() {
  final d_list = DoublyLinkedList();
  d_list.add_node(99);
  d_list.add_node(9);
  d_list.add_node(1);
  d_list.add_node(99);
  d_list.add_node(99);
  d_list.insert_node(value: 100, pos: 2);
  d_list.display_backward();
  d_list.delete_duplicate();
  print('-_--_-_--_-_--_');
  d_list.delete(1);

  d_list.display_forward();
}
