-- Implementação tosca, mas serve

function newpoli(tupla)
	return function(x)
		local resposta = 0
		if x == 0 then resposta = tupla[3] end
		if x == 1 then resposta = tupla[1] + tupla[2] + tupla[3] end
		if x > 1 then resposta = tupla[1]*x*x + tupla[2]*x + tupla[3] end
		return resposta
	end
end

np = newpoli({3,0,1})
print(np(5))
print(np(10))
