class Graph {
  Map<String, List<String>> adjacencyList = {};

  // Adds a new vertex to the graph if it doesn't already exist
  void addVertex(String vertex) {
    if (!adjacencyList.containsKey(vertex)) {
      adjacencyList[vertex] = [];
    }
  }

  // Adds an undirected edge between two vertices
  void addEdge(String vertex1, String vertex2) {
    adjacencyList[vertex1]?.add(vertex2);
    adjacencyList[vertex2]?.add(vertex1);
  }

  // Prints the graph structure
  void printGraph() {
    adjacencyList.forEach((vertex, edges) {
      print("$vertex: ${edges.join(', ')}");
    });
  }

  // Performs Depth-First Search starting from the given vertex
  void dfs(String start) {
    Set<String> visited = {};
    _dfsHelper(start, visited);
  }

  // Helper function for DFS
  void _dfsHelper(String vertex, Set<String> visited) {
    if (visited.contains(vertex)) return;

    visited.add(vertex);
    print(vertex);

    adjacencyList[vertex]?.forEach((neighbor) {
      _dfsHelper(neighbor, visited);
    });
  }

  //   void dfs_(String vertex) {
    
  //   Set<String> visited = {};
  //   if (!visited.contains(vertex)) {
  //     visited.add(vertex);
  //     print(vertex);
  //     adjacencyList[vertex]?.forEach((neighbor) {
  //       dfs_(neighbor);
  //     });
  //   }
  // }

  // Performs Breadth-First Search starting from the given vertex
  void bfs(String start) {
    Set<String> visited = {};
    List<String> queue = [];

    visited.add(start);
    queue.add(start);

    while (queue.isNotEmpty) {
      String vertex = queue.removeAt(0);
      print(vertex);

      adjacencyList[vertex]?.forEach((neighbor) {
        if (!visited.contains(neighbor)) {
          visited.add(neighbor);
          queue.add(neighbor);
        }
      });
    }
  }

  // Checks if the graph contains a cycle
  bool hasCycle() {
    Set<String> visited = {};

    for (String vertex in adjacencyList.keys) {
      if (!visited.contains(vertex)) {
        if (_hasCycleHelper(vertex, visited, null)) {
          return true;
        }
      }
    }
    return false;
  }

  // Helper function for cycle detection
  bool _hasCycleHelper(String vertex, Set<String> visited, String? parent) {
    visited.add(vertex);

    for (String neighbor in adjacencyList[vertex]!) {
      if (!visited.contains(neighbor)) {
        if (_hasCycleHelper(neighbor, visited, vertex)) {
          return true;
        }
      } else if (neighbor != parent) {
        return true; // Found a cycle
      }
    }

    return false;
  }

  // Removes a vertex and all its edges from the graph
  void removeVertex(String vertex) {
    adjacencyList.remove(vertex);
    adjacencyList.forEach((key, neighbors) {
      neighbors.remove(vertex);
    });
  }

  // Removes an undirected edge between two vertices
  void removeEdge(String vertex1, String vertex2) {
    adjacencyList[vertex1]?.remove(vertex2);
    adjacencyList[vertex2]?.remove(vertex1);
  }

  // Deletes a vertex and all its edges from the graph
  void deleteVertex(String vertex) {
    if (!adjacencyList.containsKey(vertex)) {
      return; 
    }

    adjacencyList[vertex]?.forEach((neighbor) {
      adjacencyList[neighbor]?.remove(vertex);
    });

    
    adjacencyList.remove(vertex);
  }

  // Deletes an undirected edge between two vertices
  void deleteEdge(String vertex1, String vertex2) {
    adjacencyList[vertex1]?.remove(vertex2);
    adjacencyList[vertex2]?.remove(vertex1);
  }
}

void main() {
  Graph graph = Graph();
  graph.addVertex("A");
  graph.addVertex("B");
  graph.addVertex("C");
  graph.addVertex("D");

  graph.addEdge("A", "B");
  graph.addEdge("A", "C");
  graph.addEdge("B", "D");
  graph.addEdge("C", "D");

  print("DFS Traversal:");
  graph.dfs("A");

  print("\nBFS Traversal:");
  graph.bfs("A");

  print("\nCycle Detection:");
  if (graph.hasCycle()) {
    print("Cycle detected in the graph.");
  } else {
    print("No cycle detected in the graph.");
  }

  print("\nGraph before deleting vertex 'D':");
  graph.printGraph();
  graph.deleteVertex("D");
  print("\nGraph after deleting vertex 'D':");
  graph.printGraph();

  print("\nGraph before deleting edge between 'A' and 'C':");
  graph.printGraph();
  graph.deleteEdge("A", "C");
  print("\nGraph after deleting edge between 'A' and 'C':");
  graph.printGraph();
}