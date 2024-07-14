// Reverse an array
List<int> reverse_array(List<int> arr) {
  return arr.reversed.toList();
}

// Sum of elements in an array
int sum_of_elements(List<int> arr) {
  return arr.reduce((a, b) => a + b);
}

// Find non-repeating element from an array
int find_non_repeating_element(List<int> arr) {
  var count = <int, int>{};
  for (var num in arr) {
    count[num] = (count[num] ?? 0) + 1;
  }
  return count.entries.firstWhere((entry) => entry.value == 1).key;
}

// Remove substring from a string
String remove_substring(String str, String sub) {
  return str.replaceAll(sub, '');
}

// First non-repeating element from an array
int first_unique_element(List<int> arr) {
  var count = <int, int>{};
  for (var num in arr) {
    count[num] = (count[num] ?? 0) + 1;
  }
  return arr.firstWhere((num) => count[num] == 1);
}

// Find the index of the target
int find_index(List<int> arr, int target) {
  return arr.indexOf(target);
}

// Remove duplicates from array
List<int> remove_duplicates_from_array(List<int> arr) {
  return arr.toSet().toList();
}

// Majority Element in an Array
int majority_element(List<int> arr) {
  var count = <int, int>{};
  for (var num in arr) {
    count[num] = (count[num] ?? 0) + 1;
    if (count[num]! > arr.length ~/ 2) return num;
  }
  return -1;
}

// String palindrome or not
bool is_palindrome(String str) {
  String reversed = str.split('').reversed.join('');
  return str == reversed;
}

// Convert a string to title case
String to_title_case(String str) {
  return str.split(' ').map((word) => word[0].toUpperCase() + word.substring(1)).join(' ');
}

// Function to add period to a string
String add_period(String str) {
  return str + '.';
}

// Longest word in a string
String longest_word(String str) {
  return str.split(' ').reduce((a, b) => a.length > b.length ? a : b);
}

 //Find the longest repeating character in a string
String longest_repeating_character(String str) {
  if (str.isEmpty) return '';
  
  Map<String, int> char_count = {};
  for (int i = 0; i < str.length; i++) {
    String char = str[i];
    char_count[char] = (char_count[char] ?? 0) + 1;
  }
  
  String longest_char = '';
  int max_count = 0;
  
  char_count.forEach((key, value) {
    if (value > max_count) {
      max_count = value;
      longest_char = key;
    }
  });
  
  return longest_char;
}
//Find the index of the first unique character from the string
int first_unique_character(String str) {
  Map<String, int> char_count = {};
  for (int i = 0; i < str.length; i++) {
    String char = str[i];
    char_count[char] = (char_count[char] ?? 0) + 1;
  }
  
  for (int i = 0; i < str.length; i++) {
    if (char_count[str[i]] == 1) {
      return i;
    }
  }
  
  return -1;
}

//Remove duplicate characters from a given string
String remove_duplicates_from_string(String str) {
  String result = '';
  Set<String> seen = {};
  
  for (int i = 0; i < str.length; i++) {
    if (!seen.contains(str[i])) {
      result += str[i];
      seen.add(str[i]);
    }
  }
  
  return result;
}

 //Find the number with the maximum occurrence of numbers
int find_max_occurrence(List<int> nums) {
  if (nums.isEmpty) return -1;
  
  Map<int, int> count_map = {};
  int max_num = nums[0];
  int max_count = 0;
  
  for (int num in nums) {
    count_map[num] = (count_map[num] ?? 0) + 1;
    if (count_map[num]! > max_count) {
      max_count = count_map[num]!;
      max_num = num;
    }
  }
  
  return max_num;
}