$(document).on('turbolinks:load', function() {
  $('.admin_user').click(function() {
    $('#user_email').val('admin@example.jp');
    $('#user_password').val('11111111');
  });
  $('.general_user').click(function() {
    $('#user_email').val('suguru_okamura@gmail.com');
    $('#user_password').val('1234567');
  });
});