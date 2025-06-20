local fn = {}

function fn.map(t, f)
  local res = {}
  for i, v in pairs(t) do
    res[i] = f(v, i)
  end
  return res
end

function fn.filter(t, f)
  local res = {}
  for i, v in pairs(t) do
    if f(i, v) then
      res[#res + 1] = {i, v}
    end
  end
  return res
end

function fn.reduce(t, f, init)
  local acc = init
  for i, v in pairs(t) do
    acc = f(acc, v, i)
  end
  return acc
end

function fn.forEach(t, f)
  for i, v in pairs(t) do
    f(v, i)
  end
end

function fn.flatMap(t, f)
  local res = {}
  for _, v in pairs(t) do
    local inner = f(v)
    for _, iv in ipairs(inner) do
      res[#res + 1] = iv
    end
  end
  return res
end

function fn.any(t, f)
  for i, v in pairs(t) do
    if f(v, i) then return true end
  end
  return false
end

function fn.all(t, f)
  for i, v in pairs(t) do
    if not f(v, i) then return false end
  end
  return true
end

return fn
