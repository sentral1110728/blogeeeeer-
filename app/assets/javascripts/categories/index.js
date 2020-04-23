$(document).on('turbolinks:load', function() {
  $('i').click(function() {
    var getClass = $(this).attr('class');
    var matchClass = getClass.match(/toggle_icon[0-9]+/);
    var overlay = $(this).prev('div').attr("class");
    var toggle_icon1 = $(this).hasClass('fa-angle-double-left')
    var toggle_icon2 = $(this).hasClass('fa-angle-double-right')
    if(toggle_icon1){
      $('.'+matchClass).removeClass('fa-angle-double-left');
      $('.'+matchClass).addClass('fa-angle-double-right');
      $('.'+overlay).fadeIn();
    }else if(toggle_icon2){
      $('.'+matchClass).removeClass('fa-angle-double-right');
      $('.'+matchClass).addClass('fa-angle-double-left');
      $('.'+overlay).fadeOut();
    }
  });
});