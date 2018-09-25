$(function(){
  // お気に入りボタンの上にカーソルが乗っている場合はポップアップの表示をする
  $('#favorite-btn').on('mouseover', function(){
    $("#header__wrapper__right__popup").css("visibility","visible")
  })
  // お気に入りボタンからカーソルが離れたときにポップアップを消す
  $('#favorite-btn').on('mouseout', function(){
    $("#header__wrapper__right__popup").css("visibility","hidden")
  })
  // ポップアップの上にカーソルが乗っている場合はポップアップの表示を続ける
  $('#header__wrapper__right__popup').on('mouseover', function(){
    $("#header__wrapper__right__popup").css("visibility","visible")
  })
  // ポップアップからカーソルが離れたときにポップアップを消す
  $('#header__wrapper__right__popup').on('mouseout', function(){
    $("#header__wrapper__right__popup").css("visibility","hidden")
  })
})
