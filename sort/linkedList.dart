// Class representing a node in the linked list
class List_node {
  int val;
  List_node? next;
  List_node(this.val);
}

// Class containing the solution to sort the linked list
class Solution {
  // Function to sort the linked list using merge sort
  List_node? sort_list(List_node? head) {
    // Base case: if the list is empty or has only one element, it is already sorted
    if (head == null || head.next == null) {
      return head;
    }

    // Initialize pointers for finding the middle of the list
    List_node? prev = null, slow = head, fast = head;

    // Use the fast and slow pointer technique to find the middle of the list
    while (fast != null && fast.next != null) {
      prev = slow;
      slow = slow!.next;
      fast = fast.next!.next;
    }
    // Disconnect the left half from the right half
    prev!.next = null;

    // Recursively sort the left and right halves
    List_node? left = sort_list(head);
    List_node? right = sort_list(slow);

    // Merge the sorted halves
    return _merge(left, right);
  }

  // Helper function to merge two sorted linked lists
  List_node? _merge(List_node? left, List_node? right) {
    // Create a dummy node to simplify the merge process
    List_node? res = List_node(0);
    List_node? temp = res;

    // Merge the two lists by comparing their values
    while (left != null && right != null) {
      if (left.val < right.val) {
        temp!.next = left;
        left = left.next;
      } else {
        temp!.next = right;
        right = right.next;
      }
      temp = temp.next;
    }

    // Attach the remaining elements, if any
    temp!.next = left ?? right;

    // Return the merged list, starting from the next node of the dummy node
    return res.next;
  }
}
