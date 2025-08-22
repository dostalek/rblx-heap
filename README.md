# RBLX Heap

A binary heap implementation for Roblox's Luau programming language.

## Example Usage

```lua
-- Require the Heap module
local Heap = require(--[[PATH_TO_HEAP_MODULE]])

-- Simple comparator function for a max-heap
local function cmp(parent, child)
	return parent > child
end

-- Simple comparator function for a min-heap
local function otherCmp(parent, child)
	return parent < child
end

-- Construct a new Heap object from a comparator function and table
local myHeap = Heap.new(cmp, {5, 4, 7, 9, 1})

-- Construct an empty Heap object from a comparator function
local otherHeap = Heap.new(otherCmp)
otherHeap:Insert(5)
otherHeap:Insert(1)
otherHeap:Insert(3)

-- Extract (remove) and print the root node's value
print(myHeap:Extract())	   -- Out: 9
print(otherHeap:Extract()) -- Out: 1
```

## Dijkstra's Algorithm

Dijkstra's algorithm utilizes a minimum priority queue (min-heap) data strucutre to efficiently compute the shortest path from a source vertex to all other vertices in a graph. See [Dijkstra.luau](Dijkstra.luau) for an implementation.
