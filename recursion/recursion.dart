class Recursion {
  
  // Function to calculate factorial of a number
  int factorial(int n) {
    if (n <= 1) {
      return 1;
    } else {
      return n * factorial(n - 1);
    }
  }

  // Function to print elements of a list recursively
  void print_recu(List<String> arr, int index) {
    if (index == arr.length) return;
    print(arr[index]);
    print_recu(arr, index + 1);
  }

  // Function to reverse a string recursively
  String reverse_string(String str) {
    if (str.isEmpty) {
      return "";
    } else {
      return str[str.length - 1] +
          reverse_string(str.substring(0, str.length - 1));
    }
  }

  // Function to reverse a list of strings recursively
  List<String> reverse_list(List<String> s) {
    if (s.length <= 1) return s;
    return [s.last] + reverse_list(s.sublist(0, s.length - 1));
  }

  // Function to reverse a list of strings in place recursively
  void reverse_list_recursive(List<String> list) {
    if (list.length <= 1) {
      return;
    }
    String first_element = list.removeAt(0); 
    reverse_list_recursive(list); 
    list.add(first_element); 
  }

  // Function to reverse a list of integers recursively
  List<int> rev(List<int> arr) {
    if (arr.isEmpty) return arr;
    return [arr.last, ...rev(arr.sublist(0, arr.length - 1))];
  }

  // Function to calculate the greatest common divisor (GCD) of two numbers
  int gcd(int a, int b) {
    if (b == 0) {
      return a;
    } else {
      return gcd(b, a % b);
    }
  }
}

void main() {
  List<int> arr = [1, 2, 3, 4, 5, 6, 7, 8];
  final rec = Recursion(); 
  print(rec.rev(arr));
  // print(rec.gcd(24, 8));
}
