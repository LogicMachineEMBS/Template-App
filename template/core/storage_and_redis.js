jQuery(function ($) {
  $('#submit_storage').click(function (e) {
    e.preventDefault();
    var form_storage = $('#form_storage');

    if(!form_storage[0].checkValidity()){
      $('<input type="submit">').hide().appendTo('#form_storage').click().remove();
    }else{
      $.ajax({
        type: "POST",
        url: "api/?action=save_name_storage",
        data: form_storage.serialize(),
        error: function (xhr, status) {
          alert('error');
        },
        success: function (data) {
          //alert('Successfully saved in storage');
          location.reload();
        },
      });
    }
    
  });



  $('#submit_redis').click(function (e) {
    e.preventDefault();
    var form_redis = $('#form_redis');

    if(!form_redis[0].checkValidity()){
      $('<input type="submit">').hide().appendTo('#form_redis').click().remove();
    }else{
      $.ajax({
        type: "POST",
        url: "api/?action=save_name_redis",
        data: form_redis.serialize(),
        error: function (xhr, status) {
          alert('error');
        },
        success: function (data) {
          //alert('Successfully saved in storage');
          location.reload();
        },
      });
    }
    
  });

});