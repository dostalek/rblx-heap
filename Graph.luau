local Graph = {}
Graph.__index = Graph

--[[
	Simple undirected graph implementation using an adjacency list
]]

function Graph.new()
	local self = {
		Graph = {},
	}

	setmetatable(self, Graph)

	return self
end

function Graph:AddEdge(u, v, w)
	if not self.Graph[u] then self.Graph[u] = {} end
	if not self.Graph[v] then self.Graph[v] = {} end
	
	self.Graph[u][v] = w
	self.Graph[v][u] = w
end

return Graph