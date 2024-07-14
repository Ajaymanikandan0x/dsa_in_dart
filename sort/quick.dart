import 'dart:math';

// Function to perform quick sort on a list of integers
List<int> quick_sort(List<int> arr, int lower, int upper) {
  if (lower < upper) {
    // Partition the array and get the pivot index
    int loc = partition(arr, lower, upper);
    // Recursively sort the elements before and after the pivot
    quick_sort(arr, lower, loc - 1);
    quick_sort(arr, loc + 1, upper);
  }
  return arr;
}

// Function to partition the array using the lower element as pivot
int partition(List<int> arr, int lower, int upper) {
  int pivot = arr[lower];
  int start = lower;
  int end = upper;
  while (start < end) {
    // Find the first element greater than the pivot
    while (arr[start] <= pivot && start < upper) {
      start++;
    }
    // Find the first element less than or equal to the pivot
    while (arr[end] > pivot && end > lower) {
      end--;
    }
    // Swap the elements if start is less than end
    if (start < end) {
      swap(arr, start, end);
    }
  }
  // Swap the pivot element with the element at the end
  swap(arr, lower, end);
  return end;
}

// Function to partition the array using the upper element as pivot
int _partition(List<int> arr, int lower, int upper) {
  int pivot = arr[upper];
  int i = lower - 1;
  for (var j = lower; j < upper; j++) {
    // If the current element is less than the pivot, swap it
    if (arr[j] < pivot) {
      i++;
      swap(arr, i, j);
    }
  }
  // Swap the pivot element with the element at i+1
  swap(arr, i + 1, upper);
  return i + 1;
}

// Function to swap two elements in the array
void swap(List<int> arr, int a, int b) {
  int temp = arr[a];
  arr[a] = arr[b];
  arr[b] = temp;
}

void main() {
  var random = Random();
  List<int> arr = [];
  // Generate a list of 100 random integers
  for (var i = 0; i < 100; i++) {
    arr.add(random.nextInt(100));
  }

  // Perform quick sort on the list
  quick_sort(arr, 0, arr.length - 1);
  // Print the sorted list
  print(arr);
}
