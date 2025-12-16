jQuery(function ($) {

  $("#scale_select").hide();
  $("#float_select").hide();

  $('input[name="options"]').change(function () {
    var selectedId = $(this).attr('id');

    $("#bool_select").hide();
    $("#scale_select").hide();
    $("#float_select").hide();
    
    if (selectedId === 'bool_option') {
      $('#bool_select').show();
    } else if (selectedId === 'scale_option') {
      $('#scale_select').show();
    } else if (selectedId === 'float32_option') {
      $('#float_select').show();
    }
  });

  $('#submit_bool').click(function (e) {
    e.preventDefault();
    var form_bool = $('#form_bool');

    if(!form_bool[0].checkValidity()){
      $('<input type="submit">').hide().appendTo('#form_bool').click().remove();
    }else{
      $.ajax({
        type: "POST",
        url: "api/?action=save_bool_obj",
        data: form_bool.serialize(),
        error: function (xhr, status) {
          alert('error');
        },
        success: function (data) {
          //alert(data);
          location.reload();
        },
      });
    }
    
  });

  $(document).on("click","[bool-obj-remove]", function() {
    if (confirm('The object will be removed. Are you sure?')) {
      
      var tr = $(this).closest('tr');
      var id = tr.attr('id').substring(5);
      
      $.get('api/?action=remove_bool_obj', {id:id}, function() {
        location.reload();
      });
    };
  });

  $('#submit_scale').click(function (e) {
    e.preventDefault();
    var form_scale = $('#form_scale');

    if(!form_scale[0].checkValidity()){
      $('<input type="submit">').hide().appendTo('#form_scale').click().remove();
    }else{
      $.ajax({
        type: "POST",
        url: "api/?action=save_scale_obj",
        data: form_scale.serialize(),
        error: function (xhr, status) {
          alert('error');
        },
        success: function (data) {
          //alert(data);
          location.reload();
        },
      });
    }
    
  });

  $(document).on("click","[scale-obj-remove]", function() {
    if (confirm('The object will be removed. Are you sure?')) {
      
      var tr = $(this).closest('tr');
      var id = tr.attr('id').substring(6);
      
      $.get('api/?action=remove_scale_obj', {id:id}, function() {
        location.reload();
      });
    };
  });


  $('#submit_float32').click(function (e) {
    e.preventDefault();
    var form_float32 = $('#form_float32');

    if(!form_float32[0].checkValidity()){
      $('<input type="submit">').hide().appendTo('#form_float32').click().remove();
    }else{
      $.ajax({
        type: "POST",
        url: "api/?action=save_float32_obj",
        data: form_float32.serialize(),
        error: function (xhr, status) {
          alert('error');
        },
        success: function (data) {
          //alert(data);
          location.reload();
        },
      });
    }
    
  });

  $(document).on("click","[float32-obj-remove]", function() {
    if (confirm('The object will be removed. Are you sure?')) {
      
      var tr = $(this).closest('tr');
      var id = tr.attr('id').substring(8);
      
      $.get('api/?action=remove_float32_obj', {id:id}, function() {
        location.reload();
      });
    };
  });

});