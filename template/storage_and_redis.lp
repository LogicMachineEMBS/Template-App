<?
include(request.path .. 'lua/tpl_head.lp')
?>

<div class="container justify-content-center total text-center mt-3">
  
  <?
    if apptype == 'knx' then

      write('<h3>Usage of Storage</h3>')
      write('<h5>Name from Storage</h5>')

      local storage_name = storage.get('name_storage')
      if storage_name then
        write("<h4>" .. escape(storage_name) .. "</h4>")
      else
        write("<h6>No name in storage </h6>")
      end

      local storage_card = [[
        <div class="container d-flex justify-content-center total text-center">
          <div class="card" style="max-width: 640px">
            <div class="card-body">
              <form id="form_storage">
                <div  class="mb-3">
                  <label class="form-label" for="name_storage">Name:</label>
                  <input class="form-control" type="text" name="name_storage" id="name_storage"
                    pattern="[A-Za-z]+" required>
                </div>
                <div style="text-align: right;">
                  <button type="buttton" id="submit_storage"  class="btn btn-primary btn-md
                    text-white-100">Submit</button>
                </div>
              </form>
            </div>
          </div>
        </div>
    
        <br>
      ]]

      write(storage_card)

    end
  ?>

  <h3>Usage of Redis</h3>
  <h5>Name from Redis</h5>
  <?
    local redis_name = get_name_redis()
    if redis_name then
      write("<h4>" .. escape(redis_name) .. "</h4>")
    else
      write("<h6>No name in redis</h6>")
    end
  ?>

  <div class="container d-flex justify-content-center total text-center">
    <div class="card" style="max-width: 640px">
      <div class="card-body">
        <form id="form_redis">
          <div  class="mb-3">
            <label class="form-label" for="name_redis">Name:</label>
            <input class="form-control" type="text" name="name_redis" id="name_redis"
              pattern="[A-Za-z]+" required>
          </div>
          <div style="text-align: right;">
            <button type="buttton" id="submit_redis" class="btn btn-primary btn-md
              text-white-100">Submit</button>
          </div>
        </form>
      </div>
    </div>
  </div>

</div>

<script src="core/storage_and_redis.js"></script>

<?
include(request.path .. 'lua/tpl_footer.lp')
?>