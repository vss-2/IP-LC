-- Não tá funcionando assim

[[--
tupla = {3,0,1}
x = 10

function newpoli(tupla)
	return function(x)
		local resposta = 0
		if x == 0 then resposta = tupla[3] end
		if x == 1 then resposta = tupla[1] + tupla[2] + tupla[3] end
		if x > 1 then resposta = tupla[1]*x*x + tupla[2]*x + tupla[3] end
		print(resposta)
		return resposta
	end
end

print(resposta)
--]]

-- Tá funcionando assim
tupla = {3,0,1}
x = 10

if x == 0 then resposta = tupla[3] end
if x == 1 then resposta = tupla[1] + tupla[2] + tupla[3] end
if x > 1 then resposta = tupla[1]*x*x + tupla[2]*x + tupla[3] end
print(resposta)
