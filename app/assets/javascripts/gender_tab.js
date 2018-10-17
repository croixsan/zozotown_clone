$(function(){
  var current_url = location.href
  if(current_url.match(/mens/)){
    $(".mens-btn").addClass("selected-color")
  }else if(current_url.match(/ladies/)){
    $(".ladies-btn").addClass("selected-color")
  }else if(current_url.match(/kids/)){
    $(".kids-btn").addClass("selected-color")
  }else{
    $(".all-btn").addClass("selected-color")
  }
})
