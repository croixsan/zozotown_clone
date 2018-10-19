$(function() {

  var scale = 500 / 200;

  $(".main-image").on("mouseenter", function(){
    var zoom_image = $('.top_image').outerWidth();
    zoom_image_size = zoom_image * scale;

    $('.zoom_image').width(zoom_image_size);
    $(".zoom-area").addClass('active');
  });

  $(".main-image").on("mouseleave", function(){
    $(".zoom-area").removeClass('active');
  });


  $(".main-image").on("mousemove", function(e){
    var image_offset = $('.main-image').offset();
    var left = (e.pageX - image_offset.left - 100) ;
    var top = (e.pageY - image_offset.top - 100 ) ;
    var px_left = (e.pageX - image_offset.left - 100) + 'px';
    var px_top = (e.pageY - image_offset.top - 100 ) + 'px';

    // var size_content = e.pageXOffset;
    // if (size_left < 300 && 0 < size_left && 0 < size_top && size_top < 400){
    $(".image-grass").css("left", px_left);
    $(".image-grass").css("top", px_top);
    // }
    var unleft = "-" + ( left * scale ) + 'px';
    var untop = "-" + ( top * scale ) + 'px';
    $( ".zoom_image" ).css( "margin-left" , unleft );
    $( ".zoom_image" ).css( "margin-top" , untop );

  });
});
