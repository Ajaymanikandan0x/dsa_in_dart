class HeapSort {
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

  void _swap(List<int> arr, int i, int j) {
    int temp = arr[i];
    arr[i] = arr[j];
    arr[j] = temp;
  }
}