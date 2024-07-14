void main() {
  // Initialize an array of integers to be sorted
  var arr = [9, 8, 7, 6, 5, 4, 3, 2, 1];
  // Print the sorted array after calling the selection sort function
  print(selection(arr));
}

// Function to perform selection sort on a list of integers
List<int> selection(List<int> arr) {
  // Iterate through the array to find the minimum element
  for (int i = 0; i < arr.length - 1; i++) {
    // Initialize the minimum index to the current index
    int min_index = i;
    // Find the minimum element in the unsorted part of the array
    for (int j = i + 1; j < arr.length; j++) {
      if (arr[j] < arr[min_index]) {
        min_index = j;
      }
    }
    // Swap the found minimum element with the first element of the unsorted part
    if (min_index != i) {
      int temp = arr[min_index];
      arr[min_index] = arr[i];
      arr[i] = temp;
    }
  }
  // Return the sorted array
  return arr;
}
