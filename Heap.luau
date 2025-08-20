local Heap = {}
Heap.__index = Heap

function Heap.new(c: (a: any, b: any) -> boolean, t: {any}?)
	local newHeap = setmetatable({}, Heap)
	
	newHeap.Cmp = c
	newHeap.Heap = {}
	
	if t then
		for _, v in t do
			newHeap:Insert(v)
		end
	end
	
	return newHeap
end

function Heap:_heapify(i: number): ()
	local size = #self.Heap
	
	local left = 2 * i
	local right = 2 * i + 1
	local child = i
		
	if left <= size and self.Cmp(self.Heap[left], self.Heap[child]) then
		child = left
	end
	
	if right <= size and self.Cmp(self.Heap[right], self.Heap[child]) then
		child = right
	end
	
	if child ~= i then
		local temp = self.Heap[i]
		self.Heap[i] = self.Heap[child]
		self.Heap[child] = temp
		
		self:_heapify(child)
	end
end

function Heap:Insert(element: any): ()
	table.insert(self.Heap, element)
	
	local elementIndex = #self.Heap
	local parentIndex = math.ceil((elementIndex - 1) / 2)
	
	while elementIndex ~= 1 
		and self.Cmp(self.Heap[elementIndex], self.Heap[parentIndex]) do
		
		local temp = self.Heap[elementIndex]
		self.Heap[elementIndex] = self.Heap[parentIndex]
		self.Heap[parentIndex] = temp
		
		elementIndex = parentIndex
		parentIndex = math.ceil((elementIndex - 1) / 2)
	end
	
	return
end

function Heap:Extract(): any?
	local size = #self.Heap
	local rootValue = self.Heap[1]

	self.Heap[1] = self.Heap[size]
	self.Heap[size] = nil

	self:_heapify(1)

	return rootValue
end

return Heap
