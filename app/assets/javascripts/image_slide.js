$(function(){
  function replaceZoomImage(next_id, next_src){
    $(".zoom-area").empty();
    $(".zoom-area").append(`<img src=${next_src} class='zoom_image' id='${next_id}'>`);
  }
  function replaceTopImage(next_id, next_src){
    $(".main-image").empty();
    $(".main-image").append(`<img src=${next_src} class='top_image' id='${next_id}'>`);
  }

  function addBorder(next_id){
    $(".sub_image").removeClass("selected_image")
    $("#"+ next_id).addClass("selected_image");
  }

  $(".sub_image").on("click", function(){
    var current_id = Number($(".top_image").attr("id"))
    image_src = $(this).attr("src");
    replaceTopImage(current_id, image_src) //トップ画像を切り替える
    replaceZoomImage(current_id, image_src) //拡大画像エリアを切り替える
    $(".sub_image").removeClass("selected_image") // 現在のサブイメージの枠線を外す
    $(this).addClass("selected_image"); // 次のサブイメージを枠線で囲う
  })

  $(".right-angle").on("click", function(){
    var current_id = Number($(".top_image").attr("id"))

    if(current_id < $(".sub-image-content li").length - 1){
      var next_id = current_id + 1;
    }else {
      var next_id = 0
    }
    var next_src = $("#" + String(next_id)).attr("src")
    addBorder(next_id) // サブイメージを枠線で囲う
    replaceTopImage(next_id, next_src) //トップ画像を切り替える
    replaceZoomImage(next_id, next_src); //拡大画像エリアを切り替える
  })

  $(".left-angle").on("click", function(){
    current_id = Number($(".top_image").attr("id"))

    if(current_id > 0){
      next_id = current_id - 1;
    }else {
      next_id = $(".sub-image-content li").length - 1
    }
    next_src = $("#" + String(next_id)).attr("src")
    addBorder(next_id) // サブイメージを枠線で囲う
    replaceTopImage(next_id, next_src) //トップ画像を切り替える
    replaceZoomImage(next_id, next_src); //拡大画像エリアを切り替える
  })
})
