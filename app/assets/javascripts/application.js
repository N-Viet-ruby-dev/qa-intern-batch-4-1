//= require jquery
//= require rails-ujs
//= require jquery-ui
//= require popper
//= require bootstrap-sprockets
//= require activestorage
//= require turbolinks
//= require select2
//= require ckeditor/config
//= require question

$(document).on('turbolinks:load', function() {
  $('.tag-multiple').select2({
    theme: 'bootstrap',
    placeholder: 'Select tags'
  });

  $('#term').autocomplete({
    source: '/autocomplete',
    select: function(event, ui){
      $('#term').val(ui.item.value);
      $(this).closest('form').trigger('submit');
    }
  });
});
