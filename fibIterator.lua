function fibonacci(n)
	if(n == 1) then return 1 end
	if(n == 2) then return 1 end
	function iterator()
		local f1 = fibonacci(n-1)
		local f2 = fibonacci(n-2)
		output = f1 + f2
		return output
	end
	return iterator
end

resposta = fibonacci(1)
print(resposta(1))
