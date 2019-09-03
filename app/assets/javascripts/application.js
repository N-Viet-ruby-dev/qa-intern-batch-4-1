//= require jquery
//= require rails-ujs
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
});
