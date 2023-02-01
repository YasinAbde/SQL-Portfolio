--This was a practice challenge from HackerRank to test advanced query writing.
--This statement sorts each number into categories based on it's placement in a binary tree, which can be determined based on if it has any numbers above or below it in the binary tree.

--Binary Tree Nodes
--MS SQL Server
--https://www.hackerrank.com/challenges/binary-search-tree-1/problem?isFullScreen=true
--Write a query to find the node type of Binary Tree ordered by the value of the node. Output one of the following for each node:
	--Root: If node is root node.
	--Leaf: If node is leaf node.
	--Inner: If node is neither root nor leaf node.

Select n, case
	When p is null then "Root" --If there are no numbers above it in the tree then it must be the root.
        When p is not null and n in (Select p From bst) then "Inner" --If there are numbers below it and it is above another number then it must be inner.
        Else "Leaf" --Everything left is numbers with nothing below them meaning they are leaves.
        End 
From BST 
Order by n;