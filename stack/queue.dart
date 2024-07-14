class Node {
  dynamic data;
  Node? next;
  Node(this.data);
}

class Queue {
  Node? front;
  Node? rear;

  // Method to add an element to the queue
  void enqueue(int data) {
    var new_node = Node(data);
    if (front == null) {
      front = new_node;
      rear = new_node;
    } else {
      rear!.next = new_node;
      rear = new_node;
    }
  }

  // Method to remove an element from the queue
  int? dequeue() {
    if (front == null) return null;

    int data = front!.data;
    front = front!.next;
    if (front == null) {
      rear = null;
    }
    return data;
  }

  // Method to print all elements in the queue
  void print_queue() {
    var temp = front;
    while (temp != null) {
      print(temp.data);
      temp = temp.next;
    }
  }

  // Method to check if the queue is empty
  bool is_empty() {
    return front == null;
  }
  
  // Method to reverse the queue using recursion
  void reverse() {
    if (is_empty()) return;
    
    int? item = dequeue();
    reverse();
    enqueue(item!);
  }
}

void main() {
  final q = Queue();
  q.enqueue(10);
  q.enqueue(20);
  q.enqueue(30);
  q.print_queue();
  q.dequeue();
  print('_-_-_-_-_-_-_');
  q.print_queue();
}

// Function to reverse a queue using recursion
Queue reverse_function(Queue queue) {
  if (queue.front == null) {
    return queue;
  } else {
    int? data = queue.front!.data;
    queue.dequeue();
    queue = reverse_function(queue);
    queue.enqueue(data!);
    return queue;
  }
}

// Write the code to implement a stack using a queue
class Stack {
  Queue _queue = Queue();
  
  // Method to get the size of the stack
  int size() {
    int count = 0;
    var temp = _queue.front;
    while (temp != null) {
      count++;
      temp = temp.next;
    }
    return count;
  }
  
  // Method to push an element onto the stack
  void push(int value) {
    _queue.enqueue(value);
    int size = this.size();
    while (size > 1) {
      _queue.enqueue(_queue.dequeue()!);
      size--;
    }
  }
  
  // Method to pop an element from the stack
  int pop() {
    return _queue.dequeue()!;
  }
  
  // Method to peek the top element of the stack
  int peek() {
    return _queue.is_empty() ? -1 : _queue.front!.data;
  }
  
  // Method to check if the stack is empty
  bool is_empty() {
    return _queue.is_empty();
  }
}

// Deque (Double-ended Queue)
class Deque {
  List<int> _deque = [];
  
  // Method to add an element to the front of the deque
  void add_front(int value) {
    _deque.insert(0, value);
  }
  
  // Method to add an element to the rear of the deque
  void add_rear(int value) {
    _deque.add(value);
  }
  
  // Method to remove an element from the front of the deque
  int remove_front() {
    if (is_empty()) return -1;
    return _deque.removeAt(0);
  }
  
  // Method to remove an element from the rear of the deque
  int remove_rear() {
    if (is_empty()) return -1;
    return _deque.removeLast();
  }
  
  // Method to peek the front element of the deque
  int peek_front() {
    return is_empty() ? -1 : _deque.first;
  }
  
  // Method to peek the rear element of the deque
  int peek_rear() {
    return is_empty() ? -1 : _deque.last;
  }
  
  // Method to check if the deque is empty
  bool is_empty() {
    return _deque.isEmpty;
  }
}

// Priority Queue
class PriorityQueue {
  List<int> _queue = [];
  
  // Method to add an element to the priority queue
  void enqueue(int value) {
    if (_queue.isEmpty) {
      _queue.add(value);
    } else {
      int i = _queue.length - 1;
      while (i >= 0 && _queue[i] > value) {
        _queue[i + 1] = _queue[i];
        i--;
      }
      _queue[i + 1] = value;
    }
  }
  
  // Method to remove an element from the priority queue
  int dequeue() {
    if (is_empty()) return -1;
    return _queue.removeLast();
  }
  
  // Method to peek the highest priority element
  int peek() {
    return is_empty() ? -1 : _queue.last;
  }
  
  // Method to check if the priority queue is empty
  bool is_empty() {
    return _queue.isEmpty;
  }
}

// Circular Queue
class CircularQueue {
  List<int> _queue = [];
  int _front = 0;
  int _rear = -1;
  int _size = 0;
  
  // Method to add an element to the circular queue
  void enqueue(int value) {
    if (_size == _queue.length) throw Exception('Queue is full');
    
    _rear = (_rear + 1) % _queue.length;
    _queue[_rear] = value;
    _size++;
  }
  
  // Method to remove an element from the circular queue
  int dequeue() {
    if (is_empty()) throw Exception('Queue is empty');
    
    int removed_item = _queue[_front];
    _front = (_front + 1) % _queue.length;
    _size--;
    return removed_item;
  }
  
  // Method to get the front element of the circular queue
  int front() {
    if (is_empty()) throw Exception('Queue is empty');
    
    return _queue[_front];
  }
  
  // Method to get the rear element of the circular queue
  int rear() {
    if (is_empty()) throw Exception('Queue is empty');
    
    return _queue[_rear];
  }
  
  // Method to check if the circular queue is empty
  bool is_empty() {
    return _size == 0;
  }
}
