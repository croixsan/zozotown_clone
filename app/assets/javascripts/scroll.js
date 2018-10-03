$(function(){
  $(".initials").on("click", ".initial_link", function(){
    link = "#" + $(this).attr("id") + "-link"
    $("html,body").animate({scrollTop:$(link).offset().top});
  })
})
