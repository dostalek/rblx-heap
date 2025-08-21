# RBLX Heap

A binary heap implementation for Roblox's Luau programming language.

# Example Usage

```lua
-- Require the Heap module
local Heap = require(--[[PATH_TO_HEAP_MODULE]])

-- Simple comparator function for a max-heap
local function cmp(parent, child)
	return parent > child
end

-- Create a new Heap object from a table by passing the comparator function
local myHeap = Heap.new(cmp, {5, 4, 7, 9, 1})

-- Extract (remove) and print the root node's value
print(myHeap.Extract()) -- 9
```
