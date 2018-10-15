$(function(){
  $(".sub_image").on("click", function(){
    image_id = $(this).attr("image-id");
    image_src = $(this).attr("src");
    $(".main-image").empty();
    $(".main-image").append(`<img src=${image_src} class='top_image'>`);
    $(".sub_image").removeClass("selected_image")
    $(this).addClass("selected_image");
  })
})
