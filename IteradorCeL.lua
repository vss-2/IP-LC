-- Implementação do iterador do slide para coleções
function value(t)
    local i = 0
    return function () i = i + 1; return t[i] end
end

-- Implementação do iterador do slide para listas
function values(t)
    local i = 0
    return function () i = i + 1; return t[i] end
end

-- Implementação da linguagem
t = {10, 20, 30}
iter = list_iter(t)    -- creates the iterator
while true do
  local element = iter()   -- calls the iterator
  if element == nil then break end
  print(element)
end
