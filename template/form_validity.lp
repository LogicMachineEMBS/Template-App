<?
include(request.path .. 'lua/tpl_head.lp')
?>

<div class="container justify-content-center total text-center mt-3">
  <h3>Form validity on client side</h3>
  
  <div class="container d-flex justify-content-center total text-center">
    <div class="card" style="max-width: 640px">
      <div class="card-body">
        <form id="form_client">
          <div  class="mb-3">
            <label class="form-label" for="nameClient">Name:</label>
            <input class="form-control" type="text" name="nameClient" id="nameClient"
              pattern="[A-Za-z]+" required>
          </div>
          <div class="mb-3">
            <label  class="form-label" >Age:</label>
            <input type="number" class="form-control" id="ageClient" name="ageClient"
              min="5" max="100" pattern="[1-9]" required>
          </div>
          <div style="text-align: right;">
            <button type="buttton" id="submit_client"  class="btn btn-primary btn-md
              text-white-100">Submit</button>
          </div>
        </form>
      </div>
    </div>
  </div>

  <br>
  <br>
  <h3>Form validity on server side</h3>

  <div class="container d-flex justify-content-center total text-center">
    <div class="card" style="max-width: 640px">
      <div class="card-body">
        <form id="form_server">
          <div  class="mb-3">
            <label class="form-label" for="name_server">Name:</label>
            <input class="form-control" type="text" name="name_server" id="name_server">
          </div>
          <div class="mb-3">
            <label class="form-label" for="age_server">Age:</label>
            <input type="number" class="form-control" id="age_server" name="age_server">
          </div>
          <div style="text-align: right;">
            <button type="buttton" id="submit_server"
              class="btn btn-primary btn-md text-white-100">Submit</button>
          </div>
        </form>
      </div>
    </div>
  </div>

</div>

<script src="core/form_validity.js"></script>

<?
include(request.path .. 'lua/tpl_footer.lp')
?>