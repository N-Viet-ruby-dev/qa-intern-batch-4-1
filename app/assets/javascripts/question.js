$(document).on('turbolinks:load', function() {
  $('#category').on('change', function() {
    $.ajax({
      url: "/questions",
      dataType: "script",
      data: {category: $(this).val()}
    });
  });
});
