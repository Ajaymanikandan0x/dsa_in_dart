void main() {
  List<int> arr = [2, 3, 1, 5, 7, 4, 9, 8];
  print(insertion_sort(arr));
}

List<int> insertion_sort(List<int> arr) {
  for (var i = 0; i < arr.length; i++) {
    int current = arr[i];
    int j = i - 1;
    while (j >= 0 && arr[j] > current) {
      arr[j + 1] = arr[j];
      j--;
    }
    arr[j + 1] = current;
  }
  return arr;
}
