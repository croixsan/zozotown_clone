$(function() {
  $(".main-image").on("mousemove", function(){
    $(".zoom-area").addClass('active');
  });
  $(".main-image").on("mouseout", function(){
    $(".zoom-area").removeClass('active');
  });
});
