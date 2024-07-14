void main() {
  var arr = [6, 7, 9, 5, 2, 31, 8, 7, 9, 6, 4, 2, 3, 5, 2, 3, 2, 35, 2, 4];
  int res = 0;
  int rep = 0;

  for (var i = 0; i < arr.length; i++) {
    int count = 0;
    for (var j = 0; j < arr.length; j++) {
      if (arr[i] == arr[j] && i != j) {
        count++;
      }
    }

    if (count > res) {
      res = count;
      rep = arr[i];
    }
  }
  print(rep);

  int val = arr[0];
  for (var i = 0; i < arr.length; i++) {
    if (val < arr[i]) {
      val = arr[i];
    }
  }
  print(val);
}
