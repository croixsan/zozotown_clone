$(function() {

  var scale = 500 / 200;

  $(".top_image").on('load', function(){
    var image_left = $('.top_image').outerWidth();
    var image_top = $('.top_image').outerHeight();
    var grass_left = $('.image-grass').outerWidth();
    var grass_top = $('.image-grass').outerHeight();
    xmax = image_left - grass_left;
    ymax = image_top - grass_top;
  });

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
    var left = (e.pageX - image_offset.left - 100)  ;
    var top = (e.pageY - image_offset.top - 100 ) ;

    if(left > xmax){
      left = xmax;
    }
    if(top > ymax){
      top = ymax;
    }
    if(left < 0){
      left = 0;
    }
    if(top < 0){
      top = 0;
    }

    $(".image-grass").css("left", left);
    $(".image-grass").css("top", top);

    var unleft = "-" + ( left * scale ) + 'px';
    var untop = "-" + ( top * scale ) + 'px';
    $( ".zoom_image" ).css( "margin-left" , unleft );
    $( ".zoom_image" ).css( "margin-top" , untop );
  });
});
