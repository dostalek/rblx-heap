local Heap = require(script.Parent.Heap)

-- Determines the shortest path from a source vertex to every other vertex of a graph
-- @param graph An undirected graph as represented by an adjacency list
-- (list[u][v] = w)
-- @param source The start vertex
-- @return A tuple containing a list of distances and a list of predecessors
local function dijkstra(graph, source)	
	local dist = {}
	local prev = {}
	
	local priorityQueue = Heap.new(function(p, c) return p[1] < c[1] end)
	
	for v, _ in graph do
		prev[v] = nil
		dist[v] = math.huge
	end
	
	dist[source] = 0
	priorityQueue:Insert({0, source})
	
	while not priorityQueue:IsEmpty() do
		local u = priorityQueue:Extract()[2]
		
		for v, w in graph[u] do
			local alt = dist[u] + w
			
			if alt < dist[v] then
				prev[v] = u
				dist[v] = alt
				priorityQueue:Insert({alt, v})
			end
		end
	end
	
	return dist, prev
end