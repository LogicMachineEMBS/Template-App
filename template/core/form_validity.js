jQuery(function ($) {

  $('#submit_client').click(function (e) {
    e.preventDefault();
    var form_client = $('#form_client');
    form_client.addClass('was-validated');
  
    if(!form_client[0].checkValidity()){
      alert('Client side form is invalid.');
      $('<input type="submit">').hide().appendTo('#form_client').click().remove();
    }
    else{
      alert('Client side form is valid.');
    }
  });


  $('#submit_server').click(function (e) {
    e.preventDefault();
    var form_server = $('#form_server');

    $.ajax({
      type: "POST",
      url: "api/?action=check_form",
      data: form_server.serialize(),
      error: function (xhr, status) {
        //alert('error');
      },
      success: function (data) {
        alert(data);
        //alert('Server side form is valid.');
      },
    });

  });

});