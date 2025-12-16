<?
include(request.path .. 'lua/tpl_head.lp')
?>

<div class="container justify-content-center total text-center mt-3">
  <!-- <h6><?=apptype?></h6> -->
  <h3>About Template app</h3>
  <br>
  <h5>This is an example for your apps. It includes:</h5>
  <h6>1. Form validity on client side</h6>
  <h6>2. Form validity on server side</h6>
  <h6>3. Usage of storage</h6>
  <h6>4. Usage of redis for storing data</h6>
  <h6>5. KNX objects selection</h6>
  <h6>6. KNX objects displaying</h6>
</div>

<?
include(request.path .. 'lua/tpl_footer.lp')
?>