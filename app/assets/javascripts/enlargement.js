$(function() {
  $(".main-image").on("mousemove", function(e){
    $(".zoom-area").addClass('active');
    $(".image-grass").addClass('active');
    var size_left = e.pageX - 360;
    var size_top = e.pageY - 860;
    var left = size_left + 'px';
    var top = size_top + 'px';
    $(".image-grass").css("margin-left", left);
    $(".image-grass").css("margin-top", top);
    var unleft = "-" + ((e.pageX - 260) * 2 ) + 'px';
    var untop = "-" + ((e.pageY - 160) * 2 ) + 'px';
    $( ".zoom_image" ).css( "margin-top" , untop );
    $( ".zoom_image" ).css( "margin-left" , unleft );
  });
  $(".main-image").on("mouseout", function(){
    $(".zoom-area").removeClass('active');
    $(".image-grass").removeClass('active');
  });
});
