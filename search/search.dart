class Search {
  // Function to perform binary search on a list of integers
  void binary_search(List<int> arr, int value) {
    int left = 0;
    int right = arr.length - 1;

    while (left <= right) {
      int middle = (left + right) ~/ 2;
      if (arr[middle] == value) {
        print('value is found $middle');
        return;
      } else if (arr[middle] > value) {
        right = middle - 1;
      } else {
        left = middle + 1;
      }
    }
    print('value not found');
  }

  // Function to perform binary search on a list of strings
  void binary_search_string(List<String> arr, String value) {
    int left = 0;
    int right = arr.length - 1;

    while (left <= right) {
      int middle = (left + right) ~/ 2;
      int comparison = value.compareTo(arr[middle]);

      if (comparison == 0) {
        print('Found the value $value');
        return;
      } else if (comparison < 0) {
        right = middle - 1;
      } else {
        left = middle + 1;
      }
    }
    print('Value $value not found');
  }

  // Function to perform linear search on a list of integers
  int linear_search(List<int> list, int target) {
    for (int i = 0; i < list.length; i++) {
      if (list[i] == target) {
        return i;
      }
    }
    return -1;
  }

  // Function to perform binary search using recursion on a list of integers
  int binary_search_recursion({
    required List<int> arr,
    required int target,
    required int left,
    required int right,
  }) {
    if (left <= right) {
      int mid = (left + right) ~/ 2;

      if (arr[mid] == target) {
        return mid;
      }
      if (arr[mid] > target) {
        return binary_search_recursion(
            arr: arr, target: target, left: left, right: mid - 1);
      }

      return binary_search_recursion(
          arr: arr, target: target, left: mid + 1, right: right);
    }
    return -1;
  }

  // Function to perform binary search using recursion on a list of strings
  int binary_search_string_recursion(
      List<String> arr, String target, int left, int right) {
    if (left <= right) {
      int mid = (left + right) ~/ 2;
      int contain = target.compareTo(arr[mid]);
      if (contain == 0) {
        return mid;
      }
      if (contain < 0) {
        return binary_search_string_recursion(arr, target, left, mid - 1);
      }
      return binary_search_string_recursion(arr, target, mid + 1, right);
    }
    return -1;
  }
}

void main() {
  // List<int> numbers = [34, 67, 89, 95, 123, 156];
  List<String> sr = ['a', 'b', 'c', 'd', 'e', 'f'];
  final s = Search();
  // int k=s.binary_search(numbers, 123);
  // int k = s.linear_search(numbers, 123);
  // print("Element found at index $k");
  // print(s.binary_search_recursion(
  // arr: numbers, target: 95, left: 0, right: numbers.length - 1));
  print(s.binary_search_string_recursion(sr, 'f', 0, sr.length - 1));
}
