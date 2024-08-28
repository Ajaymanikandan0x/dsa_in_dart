class HeapSort {
  // Sorts the given array in ascending order using the heap sort algorithm
  void heapSort(List<int> arr) {
    int n = arr.length;

    for (int i = n ~/ 2 - 1; i >= 0; i--) {
      _heapify(arr, n, i);
    }

    for (int i = n - 1; i > 0; i--) {
      _swap(arr, 0, i);
      _heapify(arr, i, 0);
    }
  }

  // Heapifies a subtree rooted with node i which is an index in arr[]. n is size of heap
  void _heapify(List<int> arr, int n, int i) {
    int largest = i;
    int left = 2 * i + 1;
    int right = 2 * i + 2;

    if (left < n && arr[left] > arr[largest]) {
      largest = left;
    }

    if (right < n && arr[right] > arr[largest]) {
      largest = right;
    }

    if (largest != i) {
      _swap(arr, i, largest);
      _heapify(arr, n, largest);
    }
  }

  // Sorts the given array in descending order using the heap sort algorithm
  void heapSortDescending(List<int> arr) {
    int n = arr.length;

    for (int i = n ~/ 2 - 1; i >= 0; i--) {
      _heapifyDescending(arr, n, i);
    }

    for (int i = n - 1; i > 0; i--) {
      _swap(arr, 0, i);
      _heapifyDescending(arr, i, 0);
    }
  }

  // Heapifies a subtree rooted with node i which is an index in arr[]. n is size of heap
  // This version maintains a min heap for descending order sort
  void _heapifyDescending(List<int> arr, int n, int i) {
    int smallest = i;
    int left = 2 * i + 1;
    int right = 2 * i + 2;

    if (left < n && arr[left] < arr[smallest]) {
      smallest = left;
    }

    if (right < n && arr[right] < arr[smallest]) {
      smallest = right;
    }

    if (smallest != i) {
      _swap(arr, i, smallest);
      _heapifyDescending(arr, n, smallest);
    }
  }

  // Swaps two elements in the array
  void _swap(List<int> arr, int i, int j) {
    int temp = arr[i];
    arr[i] = arr[j];
    arr[j] = temp;
  }
}