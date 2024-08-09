enum HeapType { MinHeap, MaxHeap }

class Heap {
  List<int> heap = [];
  final HeapType type;

  Heap(this.type);

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
    heapifyDown(0);
    return root;
  }

  void heapifyUp(int index) {
    while (index > 0) {
      int parentIndex = (index - 1) ~/ 2;
      if (compare(heap[index], heap[parentIndex]) >= 0) break;
      swap(index, parentIndex);
      index = parentIndex;
    }
  }

  void heapifyDown(int index) {
    int extreme = index;
    int leftChild = 2 * index + 1;
    int rightChild = 2 * index + 2;

    if (leftChild < heap.length && compare(heap[leftChild], heap[extreme]) < 0) {
      extreme = leftChild;
    }

    if (rightChild < heap.length && compare(heap[rightChild], heap[extreme]) < 0) {
      extreme = rightChild;
    }

    if (extreme != index) {
      swap(index, extreme);
      heapifyDown(extreme);
    }
  }

  int compare(int a, int b) {
    if (type == HeapType.MinHeap) {
      return a - b;
    } else {
      return b - a;
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
  Heap minHeap = Heap(HeapType.MinHeap);
  minHeap.buildHeap([3, 1, 6, 5, 2, 4]);
  minHeap.printHeap();

  minHeap.insert(0);
  minHeap.printHeap();

  print("Removed from MinHeap: ${minHeap.remove()}");
  minHeap.printHeap();

  Heap maxHeap = Heap(HeapType.MaxHeap);
  maxHeap.buildHeap([3, 1, 6, 5, 2, 4]);
  maxHeap.printHeap();

  maxHeap.insert(7);
  maxHeap.printHeap();

  print("Removed from MaxHeap: ${maxHeap.remove()}");
  maxHeap.printHeap();
}
