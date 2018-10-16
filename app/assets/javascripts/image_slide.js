$(function(){
  $(".sub_image").on("click", function(){
    image_src = $(this).attr("src");
    $(".main-image").empty();
    $(".main-image").append(`<img src=${image_src} class='top_image'>`);
    $(".sub_image").removeClass("selected_image")
    $(this).addClass("selected_image");
  })

  $(".right-angle").on("click", function(){
    current_id = Number($(".top_image").attr("id"))

    if (current_id < $(".sub-image-content li").length - 1){
      next_id = current_id + 1;
    }else {
      next_id = 0
    }
    next_src = $("#" + String(next_id)).attr("src")
    $(".main-image").empty();
    $(".main-image").append(`<img src=${next_src} class='top_image' id='${next_id}'>`);
  })

  $(".left-angle").on("click", function(){
    current_id = Number($(".top_image").attr("id"))

    if (current_id > 0){
      next_id = current_id - 1;
    }else {
      next_id = $(".sub-image-content li").length - 1
    }
    next_src = $("#" + String(next_id)).attr("src")
    $(".main-image").empty();
    $(".main-image").append(`<img src=${next_src} class='top_image' id='${next_id}'>`);
  })
})
