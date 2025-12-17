<?
include(request.path .. 'lua/tpl_head.lp')

local bool_objects = get_objects('bool')
local bool_adr = {}
for i = 1, #bool_objects do
  bool_adr[i] = {bool_objects[i]["address"], bool_objects[i]["text"]}
end

local scale_objects = get_objects('scale')
local scale_adr = {}
for i = 1, #scale_objects do
  scale_adr[i] = {scale_objects[i]["address"], scale_objects[i]["text"]}
end

local float32_objects = get_objects('float32')
local float32_adr = {}
for i = 1, #float32_objects do
  float32_adr[i] = {float32_objects[i]["address"], float32_objects[i]["text"]}
end

?>

<div class="container justify-content-center total text-center mt-3">

  <h3>Adding KNX objects</h3>

  <div class="container d-flex justify-content-center total text-center">
    <div class="card" style="width: 640px">
      <div class="card-body">

        <div class="btn-group btn-group-md mb-3" role="group" aria-label="Radio buttons">
          <input type="radio" class="btn-check" name="options" id="bool_option" autocomplete="off" checked>
          <label class="btn btn-outline-primary" for="bool_option" style="width: 85px">Bool</label>

          <input type="radio" class="btn-check" name="options" id="scale_option" autocomplete="off">
          <label class="btn btn-outline-primary" for="scale_option" style="width: 85px">Scale</label>

          <input type="radio" class="btn-check" name="options" id="float32_option" autocomplete="off">
          <label class="btn btn-outline-primary" for="float32_option" style="width: 85px">Float32</label>
        </div>

        <div id="bool_select">
          <form id = "form_bool">
            <div class="mb-3">
              <label  class="form-label">bool object</label>
              <select class="form-select" id="bool_obj" name="bool_obj" required>
                <?

                  for i = 1, #bool_objects do
                    print('<option value="' .. escape(bool_adr[i][1]) .. '">' .. 
                      escape(string.gsub(bool_adr[i][2], "[()%(%)]", "")) .. '</option>')
                  end

                ?>
              </select>
              <div class="invalid-feedback">Please fill out this field.</div>
            </div>
            <div class="mb-3" style="text-align: right;">
              <button type="buttton" id="submit_bool"  class="btn btn-primary btn-md text-white-100">Add object</button>
            </div>
          </form>
        </div>

        <div id="scale_select">
          <form id = "form_scale">
            <div class="mb-3">
              <label  class="form-label">scale object</label>
              <select class="form-select" id="scale_obj" name="scale_obj" required>
                <?
                  for i = 1, #scale_objects do
                    print('<option value="' .. escape(scale_adr[i][1]) .. '">' ..
                      escape(string.gsub(scale_adr[i][2], "[()%(%)]", ""))  .. '</option>')
                  end
                ?>
              </select>
              <div class="invalid-feedback">Please fill out this field.</div>
            </div>
            <div class="mb-3" style="text-align: right;">
              <button type="buttton" id="submit_scale"  class="btn btn-primary btn-md text-white-100">Add object</button>
            </div>
          </form>
        </div>

        <div id="float_select">
          <form id = "form_float32">
            <div class="mb-3">
              <label  class="form-label">float32 object</label>
              <select class="form-select" id="float32_obj" name="float32_obj" required>
                <?
                  for i = 1, #float32_objects do
                    print('<option value="' .. escape(float32_adr[i][1]) .. '">' ..
                      escape(string.gsub(float32_adr[i][2], "[()%(%)]", ""))  .. '</option>')
                  end
                ?>
              </select>
              <div class="invalid-feedback">Please fill out this field.</div>
            </div>
            <div class="mb-3" style="text-align: right;">
              <button type="buttton" id="submit_float32"  class="btn btn-primary btn-md text-white-100">Add object</button>
            </div>
          </form>
        </div>


      </div>
    </div>
  </div>


  <br>
  <h3>Displaying KNX objects</h3>

  <div class="container d-flex justify-content-center total text-center mb-3">
    <div class="card" style="width: 640px">
      <div class="card-body">
        <h5 class="card-title">Boolean objects</h5>
        <table id="bool_obj_table" class="table">
          <thread>
            <tr>
              <th rowspan="1" colspan="1" style="width: 50px;">Index</th>
              <th rowspan="1" colspan="1" style="width: 340px;">Address</th>
              <th rowspan="1" colspan="1" style="width: 200px;">Value</th>
              <th rowspan="1" colspan="1" style="width: 50px;"></th>
            </tr>
          </thread>
          <tbody>

  <?
    local saved_bool_objects = get_all_saved_bool_objects() 
    local table_index_bool = 0

    for _, bool_obj in ipairs(saved_bool_objects) do
      table_index_bool = table_index_bool + 1  
      
      local value = get_object_value(bool_obj.bool_obj)

      if value then
        value = 1
      else
        value = 0
      end

      write('<tr id="bool-' .. escape(bool_obj.id) .. '">')
      write('<td>' .. table_index_bool .. '</td>')
      write('<td>' .. escape(bool_obj.bool_obj) .. '</td>')
      write('<td id="bool-' .. escape(bool_obj.id) .. '-value">' ..
        escape(value) .. '</td>')
      write('<td>')
      write('<button type="buttton" class="btn-danger btn btn-sm" bool-obj-remove>')
      write('<i class="bi bi-x"></i>')
      write('</button>')
      write('</td>')
      write('</tr>')
    end
  ?>

          </tbody>
        </table>
      </div>
    </div>
  </div>

  <div class="container d-flex justify-content-center total text-center mb-3">
    <div class="card" style="width: 640px">
      <div class="card-body">
        <h5 class="card-title">Scale objects</h5>
        <table id="scale_obj_table" class="table">
          <thread>
            <tr>
              <th rowspan="1" colspan="1" style="width: 50px;">Index</th>
              <th rowspan="1" colspan="1" style="width: 340px;">Address</th>
              <th rowspan="1" colspan="1" style="width: 200px;">Value</th>
              <th rowspan="1" colspan="1" style="width: 50px;"></th>
            </tr>
          </thread>
          <tbody>

  <?
    local saved_scale_objects = get_all_saved_scale_objects()
    local table_index_scale = 0

    for _, scale_obj in ipairs(saved_scale_objects) do
      table_index_scale = table_index_scale + 1

      local value = get_object_value(scale_obj.scale_obj)

      if not value then
        value = 0
      end

      write('<tr id="scale-' .. escape(scale_obj.id) .. '">')
      write('<td>' .. table_index_scale .. '</td>')
      write('<td>' .. escape(scale_obj.scale_obj) .. '</td>')
      write('<td id="scale-' .. escape(scale_obj.id) .. '-value">' ..
        escape(value) .. '</td>')
      write('<td>')
      write('<button type="buttton" class="btn-danger btn btn-sm" scale-obj-remove>')
      write('<i class="bi bi-x"></i>')
      write('</button>')
      write('</td>')
      write('</tr>')
      
    end
  ?>

          </tbody>
        </table>
      </div>
    </div>
  </div>


  <div class="container d-flex justify-content-center total text-center mb-3">
    <div class="card" style="width: 640px">
      <div class="card-body">
        <h5 class="card-title">Float32 objects</h5>
        <table id="float32_obj_table" class="table">
          <thread>
            <tr>
              <th rowspan="1" colspan="1" style="width: 50px;">Index</th>
              <th rowspan="1" colspan="1" style="width: 340px;">Address</th>
              <th rowspan="1" colspan="1" style="width: 200px;">Value</th>
              <th rowspan="1" colspan="1" style="width: 50px;"></th>
            </tr>
          </thread>
          <tbody>

  <?
    local saved_float32_objects = get_all_saved_float32_objects()
    local table_index_float32 = 0

    for _, float32_obj in ipairs(saved_float32_objects) do
      table_index_float32 = table_index_float32 + 1

      local value = get_object_value(float32_obj.float32_obj)

      if type(value) == 'number' then
        value = string.format('%.3f', value)
      else
        value = 0
      end

      write('<tr id="float32-' .. escape(float32_obj.id) .. '">')
      write('<td>' .. table_index_float32 .. '</td>')
      write('<td>' .. escape(float32_obj.float32_obj) .. '</td>')
      write('<td id="float32-' .. escape(float32_obj.id) .. '-value">' ..
        escape(value) .. '</td>')
      write('<td>')
      write('<button type="buttton" class="btn-danger btn btn-sm" float32-obj-remove>')
      write('<i class="bi bi-x"></i>')
      write('</button>')
      write('</td>')
      write('</tr>')
    end
  ?>

          </tbody>
        </table>
      </div>
    </div>
  </div>

</div>

<script src="core/knx_objects.js"></script>

<?
include(request.path .. 'lua/tpl_footer.lp')
?>
