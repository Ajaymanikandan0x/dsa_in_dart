void main() {
  // Initialize the list of integers to be sorted
  List<int> arr = [94, 22, 10, 44, 23, 77, 5, 44, 88];
  // Print the sorted list after performing radix sort
  print(radix_sort(arr));
}

// Function to perform radix sort on a list of integers
List<int> radix_sort(List<int> arr) {
  // Find the maximum number to determine the number of digits
  int max = arr.reduce((a, b) => a > b ? a : b);
  // Perform counting sort for every digit
  for (var exp = 1; max ~/ exp > 0; exp *= 10) {
    counting_sort(arr, exp);
  }
  return arr;
}

// Function to perform counting sort based on the digit represented by exp
List<int> counting_sort(List<int> arr, int exp) {
  // Initialize the count array with zeros
  List<int> count = List.filled(10, 0);
  // Initialize the output array to store the sorted elements
  List<int> output = List.filled(arr.length, 0);

  // Store the count of occurrences of each digit
  for (var i = 0; i < arr.length; i++) {
    count[(arr[i] ~/ exp) % 10]++;
  }

  // Change count[i] so that it contains the actual position of the digit in the output array
  for (var i = 1; i < 10; i++) {
    count[i] += count[i - 1];
  }

  // Build the output array
  for (var i = arr.length - 1; i >= 0; i--) {
    output[count[(arr[i] ~/ exp) % 10] - 1] = arr[i];
    count[(arr[i] ~/ exp) % 10]--;
  }

  // Copy the output array to arr, so that arr now contains sorted numbers according to the current digit
  for (var i = 0; i < arr.length; i++) {
    arr[i] = output[i];
  }

  return arr;
}
