// Class representing a Node in the stack
class Node {
  Node? next;
  dynamic data;
  Node(this.data);
}

// Class representing a Stack data structure
class Stack {
  Node? top;

  // Function to push data onto the stack
  void push(int data) {
    var new_node = Node(data);
    if (top == null) {
      top = new_node;
    } else {
      new_node.next = top;
      top = new_node;
    }
  }

  // Function to pop data from the stack
  void pop() {
    if (top == null) return;
    top = top!.next;
  }

  // Function to print the elements of the stack
  void print_stack() {
    var temp = top;
    while (temp != null) {
      print(temp.data);
      temp = temp.next;
    }
  }
}

void main() {
  var stack = Stack();
  stack.push(1);
  stack.push(2);
  stack.push(3);
  stack.push(4);
  stack.print_stack();
  print('_-_-_-_-_-_-_-_-_-');
  stack.pop();
  stack.print_stack();
}
