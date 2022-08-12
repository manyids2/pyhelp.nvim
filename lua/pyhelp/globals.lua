P = function(v)
  print(vim.inspect(v))
  return v
end

RELOAD = function(...)
  return require("plenary.reload").reload_module(...)
end

R = function(name)
  RELOAD(name)
  return require(name)
end

CK = function (table, element)
  for _, value in pairs(table) do
    if value == element then
      return true
    end
  end
  return false
end

CE = function (table, element)
  for _, value in ipairs(table) do
    if value == element then
      return true
    end
  end
  return false
end


