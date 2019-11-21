function receive() 
	local status, value = coroutine.resume(producer)
	return value
end

function send(x)
	coroutine.yield(x)
end

producer = coroutine.create(
	function()
		while true do
		local x = io.read() -- produz um novo valor
		send(x)
		end
	end)
