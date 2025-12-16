<?

local rpath = request.path:gsub("api/$", "")
dofile(rpath .. "lua/init.lua")
dofile(rpath .. "lua/lib.lua")

local action = getvar("action") or ""
local result

local function getvarjson(var)
  local val = getvar(var)
  if type(val) == "string" then
	return json.decode(val)
  end
end

local function getvarnum(var)
  return tonumber(getvar(var))
end

local function contains_only_letters(str)
  return string.match(str, "^[A-Za-z]+$") ~= nil
end

local function is_float(value)
  local num = tonumber(value)
  return num ~= nil and type(num) == "number" and num % 1 ~= 0
end

local function is_number(value)
  return tonumber(value) ~= nil and type(value) == "number"
end


if action == "check_form" then
  
  local name = getvar("name_server")
  
  if(not name or not contains_only_letters(name)) then
    result = 'Error name should be entered (only letters).'
  end

  local age = getvarnum("age_server")

  if(not is_number(age) or age < 5 or age > 100 or is_float(age)) then
    local age_error_str = 'Error age should be ineger, from 5 to 100.'
    if not result then
      result = age_error_str
    else
      result = result .. age_error_str
    end
  end

  if not result then
    result = 'Server side form is valid.'
  end
  
elseif action == "save_name_storage" then
  local name = getvar("name_storage")
  storage.set('name_storage', name)
  result = 1

elseif action == "save_name_redis" then
  local name = getvar("name_redis")
  result = set_name_redis(name)

  
elseif action == "save_bool_obj" then
  local obj = getvars()
  result = save_bool_obj(obj)

elseif action == "remove_bool_obj" then
  local bool_obj_index = getvar("id")
  result = remove_bool_obj(bool_obj_index)


elseif action == "save_scale_obj" then
  local obj = getvars()
  result = save_scale_obj(obj)

elseif action == "remove_scale_obj" then
  local scale_obj_index = getvar("id")
  result = remove_scale_obj(scale_obj_index)

elseif action == "save_float32_obj" then
  local obj = getvars()
  result = save_float32_obj(obj)

elseif action == "remove_float32_obj" then
  local float32_obj_index = getvar("id")
  result = remove_float32_obj(float32_obj_index)

end 

if result then
  write(json.encode(result))
else
  ngx.exit(404)
end

?>