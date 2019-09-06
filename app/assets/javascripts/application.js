//= require jquery
//= require rails-ujs
//= require popper
//= require bootstrap-sprockets
//= require activestorage
//= require turbolinks
//= require_tree .
//= require select2
//= require ckeditor/init

$(document).on('turbolinks:load', function() {
  $('.tag-multiple').select2({
    theme: 'bootstrap',
    placeholder: 'Select tags'
  });
});

