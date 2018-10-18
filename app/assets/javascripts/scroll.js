$(function(){

  $(window).scroll(function() {
    // ヘッダーのスクロール処理
    var offset = $("html, body").scrollTop()
    if(offset > 60){
      $("#header").offset({top: offset, left: 0})
    }else {
      $("#header").offset({top: 60, left: 0})
    }
  });

  $(".initials").on("click", ".initial_link", function(){
    link = "#" + $(this).attr("id") + "-link"
    $("html,body").animate({scrollTop:$(link).offset().top});
  })

  $(".anchor_lists").on("click", ".category_scroll", function(){
    next_link = "#link-" + $(this).attr("id")
    $("html, body").animate({scrollTop: $(next_link).offset().top})
  })
})
