$(function() {
  $(".main-image").on("mousemove", function(){
    $(".zoom-area").addClass('active');
    $(".image-grass").addClass('active');

      $('.main-image').on('mousemove', function(e) {
        var size_left = e.offsetX - 100;
        var size_top = e.offsetY - 100;
        var left = size_left + 'px';
        var top = size_top + 'px';
        $( ".image-grass" ).css( "margin-top" , top );
        $( ".image-grass" ).css( "margin-left" , left );
        var unleft = "-" + e.offsetX + 'px';
        var untop = "-" + e.offsetY + 'px';
        $( ".zoom_image" ).css( "margin-top" , untop );
        $( ".zoom_image" ).css( "margin-left" , unleft );
      });
  });
  $(".main-image").on("mouseout", function(){
    $(".zoom-area").removeClass('active');
  });
});

