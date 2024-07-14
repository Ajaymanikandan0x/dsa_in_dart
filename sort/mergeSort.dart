import 'dart:math';

// Function to perform merge sort on a list of integers
List<int> merge_sort(List<int> arr) {
  // Base case: if the list has only one element, it is already sorted
  if (arr.length == 1) return arr;

  // Recursively sort the left and right halves of the list
  List<int> left = merge_sort(arr.sublist(0, arr.length ~/ 2));
  List<int> right = merge_sort(arr.sublist(arr.length ~/ 2));

  // Merge the sorted halves
  return merge(left, right);
}

// Helper function to merge two sorted lists of integers
List<int> merge(List<int> left, List<int> right) {
  List<int> res = [];
  int left_index = 0;
  int right_index = 0;

  // Merge the two lists by comparing their elements
  while (left_index < left.length && right_index < right.length) {
    if (left[left_index] < right[right_index]) {
      res.add(left[left_index]);
      left_index++;
    } else {
      res.add(right[right_index]);
      right_index++;
    }
  }

  // Add any remaining elements from the left and right lists
  res.addAll(left.sublist(left_index));
  res.addAll(right.sublist(right_index));

  return res;
}

// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

// Function to perform merge sort on a list of strings
List<String> merge_sort_string(List<String> arr) {
  // Base case: if the list has only one element, it is already sorted
  if (arr.length == 1) return arr;

  // Find the middle index of the list
  int mid = arr.length ~/ 2;

  // Recursively sort the left and right halves of the list
  List<String> left = merge_sort_string(arr.sublist(0, mid));
  List<String> right = merge_sort_string(arr.sublist(mid));

  // Merge the sorted halves
  return sort(left, right);
}

// Helper function to merge two sorted lists of strings
List<String> sort(List<String> left, List<String> right) {
  List<String> res = [];
  int left_index = 0;
  int right_index = 0;

  // Merge the two lists by comparing their elements
  while (left_index < left.length && right_index < right.length) {
    if (left[left_index].compareTo(right[right_index]) <= 0) {
      res.add(left[left_index]);
      left_index++;
    } else {
      res.add(right[right_index]);
      right_index++;
    }
  }

  // Add any remaining elements from the left and right lists
  res.addAll(left.sublist(left_index));
  res.addAll(right.sublist(right_index));

  return res;
}

void main() {
  var random = Random();
  List<int> arr = [];

  // Generate a list of 10 random integers
  for (var i = 0; i < 10; i++) {
    arr.add(random.nextInt(100));
  }

  // Sort the list using the built-in sort method
  arr.sort();

  // Print the sorted list using merge sort
  print(merge_sort(arr));
}
