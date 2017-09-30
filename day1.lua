#!usr/bin/env lua5.3

--boilerplate file io
function lines_from(file)
	lines = {}
	for line in io.lines(file) do
		lines[#lines + 1] = line
	end
	return lines
end

counter = 0
local lines = lines_from('day1.txt')


floors = lines[1]

for i=1, #floors do
	if floors:sub(i,i) == '(' then
		counter = counter + 1
	else
		counter = counter - 1
	end
	if counter < 0 then
		print(i)
		break
	end
end

print(counter)
