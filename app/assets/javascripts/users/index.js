$(document).on('turbolinks:load', function(){
  $('.JS_Click_ShowModal_Trigger').on('click', function(){
    $('.ModalLayer').addClass('isShow');
  });
  // オーバーレイをタップでモーダル閉じる
  $('.ModalLayer-Mask').on('click', function(){
    $('.ModalLayer').removeClass('isShow');
  });
});