#!usr/bin/env lua5.3
--DAY 2
--boilerplate file io
function lines_from(file)
	lines = {}
	for line in io.lines(file) do
		lines[#lines + 1] = line
	end
	return lines
end
--[string splitter
function string:split(sSeparator, nMax, bRegexp)
	assert(sSeparator ~= '')
	assert(nMax == nil or nMax > 1)
	
	local aRecord = {}

	if self:len() > 0 then
		local bPlain = not bRegexp
		nMax = nMax or -1

		local nField, nStart = 1,1
		local nFirst, nLast = self:find(sSeparator, nStart, bPlain)
		while nFirst and nMax ~= 0 do
			aRecord[nField] = self:sub(nStart, nFirst-1)
			nField = nField + 1
			nStart = nLast + 1
			nFirst, nLast = self:find(sSeparator, nStart, bPlain)
			nMax = nMax - 1
		end
		aRecord[nField] = self:sub(nStart)
	end
	
	return aRecord
end

--actual program  
local lines = lines_from('day2.txt')


for i=1, #lines do
	lines[i] = lines[i]:split('x')
	--print(lines[i][1],lines[i][2],lines[i][3])
end
for i=1, #lines do
	for j = 1, #lines[i] do
	lines[i][j] = tonumber(lines[i][j])
	end
end

sa = 0
rl = 0

for i=1, #lines do
	sa = sa + 2*lines[i][1]*lines[i][2]
	sa = sa + 2*lines[i][1]*lines[i][3]
	sa = sa + 2*lines[i][2]*lines[i][3]
	rl = rl + lines[i][1]*lines[i][2]*lines[i][3]
	print('1=',lines[i][1])
	print('2=',lines[i][2])
	print('3=',lines[i][3])
	if math.max(lines[i][1],lines[i][2],lines[i][3]) == lines[i][1] then
		sa = sa + lines[i][2]*lines[i][3]
		rl = rl + 2*lines[i][2] + 2*lines[i][3]
	elseif math.max(lines[i][1],lines[i][2],lines[i][3]) == lines[i][2] then
		sa = sa + lines[i][1]*lines[i][3]
		rl = rl + 2*lines[i][1] + 2*lines[i][3]
	else
		sa = sa + lines[i][1]*lines[i][2]
		rl = rl + 2*lines[i][1] + 2*lines[i][2]
	end
end

print(sa)
print(rl)
