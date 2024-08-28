class DirectedGraph {
  Map<String, List<String>> adjacencyList = {};

  // Adds a new vertex to the graph if it doesn't already exist
  void addVertex(String vertex) {
    if (!adjacencyList.containsKey(vertex)) {
      adjacencyList[vertex] = [];
    }
  }

  // Adds a directed edge from 'from' vertex to 'to' vertex
  void addEdge(String from, String to) {
    if (!adjacencyList.containsKey(from)) {
      addVertex(from);
    }
    adjacencyList[from]!.add(to);
  }

  // Removes the directed edge from 'from' vertex to 'to' vertex
  void removeEdge(String from, String to) {
    if (adjacencyList.containsKey(from)) {
      adjacencyList[from]!.remove(to);
    }
  }

  // Removes a vertex and all edges pointing to it
  void removeVertex(String vertex) {
    adjacencyList.remove(vertex);
    adjacencyList.forEach((key, value) {
      value.remove(vertex);
    });
  }

  // Returns a list of neighbors for a given vertex
  List<String> getNeighbors(String vertex) {
    return adjacencyList[vertex] ?? [];
  }

  // Checks if there's a directed edge from 'from' vertex to 'to' vertex
  bool hasEdge(String from, String to) {
    return adjacencyList[from]?.contains(to) ?? false;
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

    for (var neighbor in getNeighbors(vertex)) {
      _dfsHelper(neighbor, visited);
    }
  }

  // Performs Breadth-First Search starting from the given vertex
  void bfs(String start) {
    Set<String> visited = {};
    List<String> queue = [];

    visited.add(start);
    queue.add(start);

    while (queue.isNotEmpty) {
      String vertex = queue.removeAt(0);
      print(vertex);

      for (var neighbor in getNeighbors(vertex)) {
        if (!visited.contains(neighbor)) {
          visited.add(neighbor);
          queue.add(neighbor);
        }
      }
    }
  }

  // Checks if the graph contains a cycle
  bool hasCycle() {
    Set<String> visited = {};
    Set<String> recursionStack = {};

    for (String vertex in adjacencyList.keys) {
      if (_hasCycleHelper(vertex, visited, recursionStack)) {
        return true;
      }
    }

    return false;
  }

  // Helper function for cycle detection
  bool _hasCycleHelper(String vertex, Set<String> visited, Set<String> recursionStack) {
    if (recursionStack.contains(vertex)) {
      return true;
    }

    if (visited.contains(vertex)) {
      return false;
    }

    visited.add(vertex);
    recursionStack.add(vertex);

    for (var neighbor in getNeighbors(vertex)) {
      if (_hasCycleHelper(neighbor, visited, recursionStack)) {
        return true;
      }
    }

    recursionStack.remove(vertex);
    return false;
  }

  // Performs topological sort on the graph
  List<String> topologicalSort() {
    Set<String> visited = {};
    List<String> result = [];

    for (String vertex in adjacencyList.keys) {
      if (!visited.contains(vertex)) {
        _topologicalSortHelper(vertex, visited, result);
      }
    }

    return result.reversed.toList();
  }

  // Helper function for topological sort
  void _topologicalSortHelper(String vertex, Set<String> visited, List<String> result) {
    visited.add(vertex);

    for (var neighbor in getNeighbors(vertex)) {
      if (!visited.contains(neighbor)) {
        _topologicalSortHelper(neighbor, visited, result);
      }
    }

    result.add(vertex);
  }

  // Prints the graph structure
  void printGraph() {
    adjacencyList.forEach((vertex, edges) {
      print("$vertex -> ${edges.join(', ')}");
    });
  }
}
