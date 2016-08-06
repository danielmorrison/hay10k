'use strict';
$(document).on('ready page:load', function () {

  $('.edit_finish').on('change', function() {
    var $form = $(this).closest("form");
    $form.find('.images .spinner').show();
    $form.find('.images .error').hide();
    $form.submit();
  });
});
