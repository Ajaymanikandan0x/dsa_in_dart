class Node {
  int data;
  Node? next;
  Node(this.data);
}

class LinkedList {
  Node? head;
  Node? tail;

  // Function to add a node to the linked list
  void add_node(int new_data) {
    final new_node = Node(new_data);
    if (head == null) {
      head = new_node;
      tail = new_node;
    } else {
      tail!.next = new_node;
      tail = new_node;
    }
  }

  // Function to convert an array to a linked list
  void array_to_linked_list(List<int> arr) {
    if (arr.isEmpty) {
      return;
    }

    head = Node(arr[0]);
    var current = head;
    for (int i = 1; i < arr.length; i++) {
      current!.next = Node(arr[i]);
      current = current.next;
    }
  }

  // Function to search for a key in the linked list
  bool search(int key) {
    var current = head;
    while (current != null) {
      if (current.data == key) return true;
      current = current.next;
    }
    return false;
  }

  // Function to print the linked list
  void print_node() {
    var curr_node = head;
    while (curr_node != null) {
      print(curr_node.data);
      curr_node = curr_node.next;
    }
  }

  // Function to delete a node with specific data
  void delete_node(int data) {
    if (head == null) return;
    if (head?.data == data) {
      head = head?.next;
      if (head == null) {
        tail = null;
        return;
      }
    }
    var prev = head;
    var curr_node = head?.next;

    while (curr_node != null) {
      if (curr_node.data == data) {
        prev?.next = curr_node.next;
        if (tail == curr_node) tail = prev;
        return;
      }
      prev = curr_node;
      curr_node = curr_node.next;
    }
  }

  // Function to insert a node at a specific position
  void insert_node({required int value, required int position}) {
    final new_node = Node(value);
    if (head == null) {
      head = new_node;
      tail = new_node;
      return;
    }
    if (position == 0) {
      new_node.next = head;
      head = new_node;
      return;
    }
    var temp = head;
    int p = 0;
    while (temp != null) {
      if (p + 1 == position) {
        new_node.next = temp.next;
        temp.next = new_node;
        return;
      }
      temp = temp.next;
      p++;
    }
    tail!.next = new_node;
    tail = new_node;
  }

  // Function to reverse the linked list
  void reverse_node() {
    if (head == null) return;

    var temp = head;
    var prev = null;

    while (temp != null) {
      var next_node = temp.next;
      temp.next = prev;
      prev = temp;
      temp = next_node;
    }

    head = prev;
  }

  // Function to find the middle node of the linked list
  void find_mid() {
    if (head == null) return;
    var temp = head;
    var next = head;
    while (next != null && next.next != null) {
      temp = temp!.next;
      next = next.next!.next;
    }
    print(temp!.data);
  }

  // Function to calculate the sum of all nodes in the linked list
  int sum_node() {
    if (head == null) return -1;
    int sum = 0;
    var temp = head;
    while (temp != null) {
      sum += temp.data;
      temp = temp.next;
    }
    return sum;
  }

  // Function to combine two linked lists
  Node combine_node(LinkedList a) {
    var temp = head;
    while (temp!.next != null) {
      temp = temp.next;
    }
    temp.next = a.head;

    while (temp!.next != null) {
      tail = temp;
      temp = temp.next;
    }

    return temp;
  }
}

void main() {
  var linked_list = LinkedList();
  linked_list
    ..add_node(1)
    ..add_node(0)
    ..add_node(1)
    ..print_node();

  print(binary(linked_list.head));

  //linked_list.insert_node(position: 0, value: 10);
  //linked_list.print_node();
  //print('${linked_list.tail?.data}, ${linked_list.head?.data}');
}

// Function to delete the middle node of the linked list
Node? delete_middle(Node? head) {
  var prev = null;
  var temp = head;
  var next = head;
  while (next != null && next.next != null) {
    prev = temp;
    temp = temp!.next;
    next = next.next!.next;
  }

  if (prev != null) {
    prev.next = temp!.next;
  } else {
    head = head!.next;
  }

  return head;
}

// Function to remove the nth node from the end of the linked list
Node? remove_nth_from_end(Node? head, int n) {
  Node dummy = Node(0);
  dummy.next = head;
  var temp = dummy;
  var next = dummy;
  for (var i = 0; i < n; i++) {
    next = next.next!;
  }
  while (next.next != null) {
    temp = temp.next!;
    next = next.next!;
  }
  temp.next = temp.next!.next;
  return dummy.next;
}

// Function to remove duplicate nodes from the linked list
Node? remove_dup(Node? l1) {
  if (l1 == null) return null;

  Node? temp = l1;
  while (temp != null) {
    var current = temp;
    while (current.next != null) {
      if (current.next!.data == temp.data) {
        current.next = current.next!.next;
      } else {
        current = current.next!;
      }
    }
    temp = temp.next;
  }
  return l1;
}

// Function to merge two sorted linked lists
Node? sort_two_node_list(Node? l1, Node? l2) {
  if (l1 == null && l2 == null) return null;
  Node? dummy = Node(0);
  var temp = dummy;
  while (l1 != null && l2 != null) {
    if (l1.data < l2.data) {
      temp.next = l1;
      l1 = l1.next;
    } else {
      temp.next = l2;
      l2 = l2.next;
    }
    temp = temp.next!;
  }
  temp.next = l1 ?? l2;
  return dummy.next;
}

// Function to remove elements with a specific value from the linked list
Node? remove_elements(Node? head, int val) {
  if (head == null) return null;
  Node? dummy = Node(0);
  dummy.next = head;
  Node? temp = dummy;
  while (temp!.next != null) {
    if (temp.next!.data == val) {
      temp.next = temp.next!.next;
    } else {
      temp = temp.next;
    }
  }
  return dummy.next;
}

// Function to add a node at a specific position without using a linked list class
void add(Node? head, int val, int pos) {
  Node? temp;
  var new_node = Node(val);
  temp = head;
  if (pos == 0) {
    new_node.next = head;
    head = new_node;
    return;
  }
  int po = 1;
  while (temp != null) {
    if (po == pos) {
      new_node.next = temp.next;
      temp.next = new_node;
      return;
    }
    temp = temp.next;
    po++;
  }
}

// Function to convert a binary linked list to an integer
int binary(Node? head) {
  var temp = head;
  int res = 0;
  while (temp != null) {
    res *= 2;
    res += temp.data;
    temp = temp.next;
  }
  return res;
}

// Function to delete the middle element of the linked list using two pointers
void delete_middle_(LinkedList list) {
  if (list.head == null) return;
  var slow = list.head;
  var fast = list.head;
  Node? prev;
  while (fast != null && fast.next != null) {
    fast = fast.next!.next;
    prev = slow;
    slow = slow!.next;
  }
  if (prev != null) prev.next = slow!.next;
}

// Function to reorder items in a singly linked list
void reorder_list(LinkedList list) {
  if (list.head == null) return;
  var slow = list.head;
  var fast = list.head;
  while (fast != null && fast.next != null) {
    slow = slow!.next;
    fast = fast.next!.next;
  }
  Node? second_half = reverse_linked_list(slow!.next!);
  slow.next = null;
  Node? first_half = list.head;
  while (second_half != null) {
    var temp1 = first_half!.next;
    var temp2 = second_half.next;
    first_half.next = second_half;
    second_half.next = temp1;
    first_half = temp1;
    second_half = temp2!;
  }
}

// Function to reverse a linked list
Node reverse_linked_list(Node head) {
  Node? prev = null;
  Node? current = head;
  while (current != null) {
    var next = current.next;
    current.next = prev;
    prev = current;
    current = next!;
  }
  return prev!;
}

// Function to detect a cycle in the linked list
bool detect_cycle(LinkedList list) {
  var slow = list.head;
  var fast = list.head;
  while (fast != null && fast.next != null) {
    slow = slow!.next;
    fast = fast.next!.next;
    if (slow == fast) return true;
  }
  return false;
}

// Function to remove duplicates from the linked list
void remove_duplicates(LinkedList list) {
  if (list.head == null) return;
  var current = list.head;
  while (current != null) {
    var runner = current;
    while (runner.next != null) {
      if (runner.next!.data == current.data) {
        runner.next = runner.next!.next;
      } else {
        runner = runner.next!;
      }
    }
    current = current.next;
  }
}
