# MapReduce Framework

A C++11 implementation of a generic Map-Reduce framework for concurrent processing across multiple threads, producing output pairs in shuffled, sorted order.

## Contents

| File | Purpose |
|------|---------|
| `MapReduceFramework.h` | Public API |
| `MapReduceFramework.cpp` | Framework implementation |
| `MapReduceClient.h` | Client interface (map/reduce) |
| `Barrier.h` / `Barrier.cpp` | Thread-barrier utility |
| `Makefile` | Builds shared library and archive |

## Build Instructions

```bash
# Build shared library
make

# Clean artifacts
make clean

# Create submission archive
make tar
```

Requires g++ 11+ with pthread support.

## Usage

1. **Implement the client interface**
2. **Link** with `-lMapReduceFramework -lpthread`
3. **Call** `runMapReduceFramework`

```cpp
#include "MapReduceClient.h"
#include "MapReduceFramework.h"

class WordCountClient : public MapReduceClient {
    void map(const K1* key, const V1* val, void* context) const override;
    void reduce(const K2* key, const std::vector<V2*>& vals, void* context) const override;
};

int main() {
    std::vector<std::pair<K1*, V1*>> input = loadFile("data.txt");
    WordCountClient client;
    auto results = runMapReduceFramework(&client, input, 8);
    return 0;
}
```

