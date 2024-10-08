class MaxHeap {
  List<int> heap = [];

  MaxHeap();

  // Builds a max heap from the given list of elements
  void build_heap(List<int> elements) {
    heap = elements;
    for (int i = (heap.length ~/ 2) - 1; i >= 0; i--) {
      heapify_down(i);
    }
  }

  // Inserts a new element into the heap
  void insert(int element) {
    heap.add(element);
    heapify_up(heap.length - 1);
  }

  // Removes and returns the maximum element from the heap
  int remove() {
    if (heap.isEmpty) {
      throw Exception("Heap is empty");
    }
    int root = heap[0];
    heap[0] = heap.removeLast();
    if (heap.isNotEmpty) {
      heapify_down(0);
    }
    return root;
  }

  // Deletes a specific element from the heap
  void delete(int element) {
    int index = heap.indexOf(element);
    if (index == -1) {
      return; 
    }
    
    heap[index] = heap.last;
    heap.removeLast();

    if (index < heap.length) {
     
      heapify_up(index);
     
      if (index > 0 && heap[index] < heap[(index - 1) ~/ 2]) {
        heapify_down(index);
      }
    }
  }

  // Restores the heap property by moving an element up the heap
  void heapify_up(int index) {
    while (index > 0) {
      int parent_index = (index - 1) ~/ 2;
      if (heap[index] <= heap[parent_index]) break;
      swap(index, parent_index);
      index = parent_index;
    }
  }

  // Restores the heap property by moving an element down the heap
  void heapify_down(int index) {
    int largest = index;
    int left_child = 2 * index + 1;
    int right_child = 2 * index + 2;

    if (left_child < heap.length && heap[left_child] > heap[largest]) {
      largest = left_child;
    }

    if (right_child < heap.length && heap[right_child] > heap[largest]) {
      largest = right_child;
    }

    if (largest != index) {
      swap(index, largest);
      heapify_down(largest);
    }
  }

  // Swaps two elements in the heap
  void swap(int i, int j) {
    int temp = heap[i];
    heap[i] = heap[j];
    heap[j] = temp;
  }

  // Prints the current state of the heap
  void print_heap() {
    print(heap);
  }
}

void main() {
  MaxHeap max_heap = MaxHeap();
  max_heap.build_heap([3, 1, 6, 5, 2, 4]);
  max_heap.print_heap();

  max_heap.insert(7);
  max_heap.print_heap();

  print("Removed: ${max_heap.remove()}");
  max_heap.print_heap();

  max_heap.delete(5);
  print("After deleting 5:");
  max_heap.print_heap();
}
