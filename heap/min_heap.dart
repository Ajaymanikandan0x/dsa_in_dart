class MinHeap {
  List<int> heap = [];

  MinHeap();

  void buildHeap(List<int> elements) {
    heap = elements;
    for (int i = (heap.length ~/ 2) - 1; i >= 0; i--) {
      heapifyDown(i);
    }
  }

  void insert(int element) {
    heap.add(element);
    heapifyUp(heap.length - 1);
  }

  int remove() {
    if (heap.isEmpty) {
      throw Exception("Heap is empty");
    }
    int root = heap[0];
    heap[0] = heap.removeLast();
    if (heap.isNotEmpty) {
      heapifyDown(0);
    }
    return root;
  }

  void delete(int element) {
    int index = heap.indexOf(element);
    if (index == -1) {
      return;
    }

    heap[index] = heap.last;
    heap.removeLast();

    if (index < heap.length) {
      heapifyUp(index);

      if (index > 0 && heap[index] > heap[(index - 1) ~/ 2]) {
        heapifyDown(index);
      }
    }
  }

  void heapifyUp(int index) {
    while (index > 0) {
      int parentIndex = (index - 1) ~/ 2;
      if (heap[index] >= heap[parentIndex]) break;
      swap(index, parentIndex);
      index = parentIndex;
    }
  }

  void heapifyDown(int index) {
    int smallest = index;
    int leftChild = 2 * index + 1;
    int rightChild = 2 * index + 2;

    if (leftChild < heap.length && heap[leftChild] < heap[smallest]) {
      smallest = leftChild;
    }

    if (rightChild < heap.length && heap[rightChild] < heap[smallest]) {
      smallest = rightChild;
    }

    if (smallest != index) {
      swap(index, smallest);
      heapifyDown(smallest);
    }
  }

  void swap(int i, int j) {
    int temp = heap[i];
    heap[i] = heap[j];
    heap[j] = temp;
  }

  void printHeap() {
    print(heap);
  }
}

void main() {
  MinHeap minHeap = MinHeap();
  minHeap.buildHeap([3, 1, 6, 5, 2, 4]);
  minHeap.printHeap();

  minHeap.insert(0);
  minHeap.printHeap();

  print("Removed: ${minHeap.remove()}");
  minHeap.printHeap();

  minHeap.delete(5);
  print("After deleting 5:");
  minHeap.printHeap();
}
