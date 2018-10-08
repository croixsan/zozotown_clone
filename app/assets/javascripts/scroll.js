$(function(){
  $(".initials").on("click", ".initial_link", function(){
    link = "#" + $(this).attr("id") + "-link"
    $("html,body").animate({scrollTop:$(link).offset().top});
  })

  $(".anchor_lists").on("click", ".category_scroll", function(){
    next_link = "#link-" + $(this).attr("id")
    $("html, body").animate({scrollTop: $(next_link).offset().top})
  })
})
