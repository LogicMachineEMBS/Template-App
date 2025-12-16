local rk_prefix = "app:template:"
local rk_redis_name = "redis_name"

local rk_bool_obj_id = "bool_obj_id"
local rk_bool_object = "bool_object"

local rk_scale_obj_id = "scale_obj_id"
local rk_scale_object = "scale_object"

local rk_float32_obj_id = "float32_obj_id"
local rk_float32_object = "float32_object"

local redisclient


function get_redis()
  if not redisclient then
    redisclient = require("redis").connect()
  end
  return redisclient
end

function set_name_redis(name)
  local res = get_redis():set(rk_prefix .. rk_redis_name, name)
  return res
end

function get_name_redis()
  local res = get_redis():get(rk_prefix .. rk_redis_name)
  return res
end

function get_object_value(addr)
  if apptype=='canx' then
    return canx.getvalue(addr)
  else
    return grp.getvalue(addr)
  end
end


function get_objects(dpt)
  local objects = {}
  if apptype=='canx' then

    local w = ' datatype>=0 '
    
    if dpt == 'bool' then
      w = ' datatype in (1) '
    elseif dpt == 'scale' then
      w = ' datatype in (13) '
    elseif dpt == 'float32' then
      w = ' datatype in (43) '
    end

    local query = 'SELECT id, name, datatype FROM canx_groups WHERE ' .. w .. ' ORDER BY id'
    objects = canx.dbfn('getall', query)

    for _, object in ipairs(objects) do
      object.address = canx.numtogroup(object.id)
      object.text = object.address
      if object.name then
        object.text = object.text .. ' (' .. object.name .. ')'
      end
    end

  else
    if dpt == 'bool' then
      objects = grp.dpt('bool')
    elseif dpt == 'scale' then
      objects = grp.dpt('scale')
    elseif dpt == 'float32' then
      objects = grp.dpt('float32')
    else
      local allobjects = grp.all()
      for _, o in ipairs(allobjects) do
        if o.datatype then
          if o.datatype==dt.bool or (o.datatype>=1001 and o.datatype <= 1014) or 
            o.datatype==dt.scale or o.datatype==dt.angle or o.datatype==dt.uint8 or o.datatype==dt.int8  or
            o.datatype==dt.int16 or o.datatype==dt.int64 or
            o.datatype==dt.uint16 or o.datatype==dt.uint16 or o.datatype==dt.uint24 or
            o.datatype==dt.float16 or o.datatype==dt.temperature or o.datatype==dt.uint32 or
            o.datatype==dt.int32  or o.datatype==dt.float32  then
            table.insert(objects, o)
          end
        end
      end
    end
    for _, object in ipairs(objects) do
      object.text = object.address
      if object.name then
        object.text = object.text .. ' (' .. object.name .. ')'
      end
    end
  end

  return objects
end

function get_bool_obj_id()
  return get_redis():incr(rk_prefix .. rk_bool_obj_id)
end

function save_bool_obj(obj)
  if not obj then
    return
  end

  local id = get_bool_obj_id()

  obj.id = id
  
  get_redis():hset(rk_prefix .. rk_bool_object, id, json.encode(obj))

  return id
end

function remove_bool_obj(id)
  if not id then
    return
  end

  get_redis():hdel(rk_prefix .. rk_bool_object, id)

  return id
end

function get_bool_obj(id)
  if not id then
    return
  end

  local bool_obj = get_redis():hget(rk_prefix .. rk_bool_object, id)
  if bool_obj then
    return json.decode(bool_obj)
  end
end

function get_all_saved_bool_objects()
  local result = {}
  local bool_objects = get_redis():hgetall(rk_prefix .. rk_bool_object)

  for id, bool_obj in pairs(bool_objects) do
    bool_obj = json.pdecode(bool_obj)
    if type(bool_obj) == 'table' then
      result[#result + 1] = bool_obj
    end
  end

  table.sort(result, function(a,b)
    --return a.id > b.id -- change order
    return a.id < b.id
  end)

  return result
end

function get_scale_obj_id()
  return get_redis():incr(rk_prefix .. rk_scale_obj_id)
end

function save_scale_obj(obj)
  if not obj then
    return
  end

  local id = get_scale_obj_id()

  obj.id = id
  
  get_redis():hset(rk_prefix .. rk_scale_object, id, json.encode(obj))

  return id
end

function remove_scale_obj(id)
  if not id then
    return
  end

  get_redis():hdel(rk_prefix .. rk_scale_object, id)

  return id
end

function get_scale_obj(id)
  if not id then
    return
  end

  local scale_object = get_redis():hget(rk_prefix .. rk_scale_object, id)
  if scale_object then
    return json.decode(scale_object)
  end
end

function get_all_saved_scale_objects()
  local result = {}
  local scale_objects = get_redis():hgetall(rk_prefix .. rk_scale_object)

  for id, scale_obj in pairs(scale_objects) do
    scale_obj = json.pdecode(scale_obj)
    if type(scale_obj) == 'table' then
      result[#result + 1] = scale_obj
    end
  end

  table.sort(result, function(a,b)
    -- return a.id > b.id -- change order
    return a.id < b.id
  end)

  return result
end

function get_float32_obj_id()
  return get_redis():incr(rk_prefix .. rk_float32_obj_id)
end

function save_float32_obj(obj)
  if not obj then
    return
  end

  local id = get_float32_obj_id()

  obj.id = id
  
  get_redis():hset(rk_prefix .. rk_float32_object, id, json.encode(obj))

  return id
end

function remove_float32_obj(id)
  if not id then
    return
  end

  get_redis():hdel(rk_prefix .. rk_float32_object, id)

  return id
end

function get_float32_obj(id)
  if not id then
    return
  end

  local float32_obj = get_redis():hget(rk_prefix .. rk_float32_object, id)
  if float32_obj then
    return json.decode(float32_obj)
  end
end

function get_all_saved_float32_objects()
  local result = {}
  local float32_objects = get_redis():hgetall(rk_prefix .. rk_float32_object)

  for id, float32_obj in pairs(float32_objects) do
    float32_obj = json.pdecode(float32_obj)
    if type(float32_obj) == 'table' then
      result[#result + 1] = float32_obj
    end
  end

  table.sort(result, function(a,b)
    --return a.id > b.id -- change order
    return a.id < b.id
  end)

  return result
end

function prepare_object(object, fn)
  object.id = fn(object.id)
  object.text = object.id

  if object.name then
    object.text = object.text .. ' (' .. object.name .. ')'
  end
end



if apptype == "knx" then
  function get_all_objects()
    local objects = db:getall('SELECT id, name, datatype FROM objects ORDER BY id')

    for _, object in ipairs(objects) do
      prepare_object(object, buslib.decodega)
    end

    return objects
  end

else
  local canx = require('applibs.canx')

  function get_all_objects()
    local query = 'SELECT id, datahex, name, datatype FROM canx_groups ORDER BY id'
    local objects = canx.dbfn('getall', query)
    local result = {}
    for _, object in ipairs(objects) do
      result[object.id] = object
    end

    return result
  end
end
