$(function(){
  //---------------------- header ----------------------------
  //---- お気に入りボタン---------------------------
  $('#favorite-btn').on('mouseover', function(){
    $(".popup__favorite").css("visibility","visible")
  })
  $('#favorite-btn').on('mouseout', function(){
    $(".popup__favorite").css("visibility","hidden")
  })
  // ポップアップの上にカーソルが乗っている場合はポップアップの表示を続ける
  $(".popup__favorite").on('mouseover', function(){
    $(".popup__favorite").css("visibility","visible")
  })
  // ポップアップからカーソルが離れたときにポップアップを消す
  $(".popup__favorite").on('mouseout', function(){
    $(".popup__favorite").css("visibility","hidden")
  })
  //---- カートボタン---------------------------
  $('#cart-btn').on('mouseover', function(){
    $(".popup__cart").css("visibility","visible")
  })
  $('#cart-btn').on('mouseout', function(){
    $(".popup__cart").css("visibility","hidden")
  })
  $(".popup__cart").on('mouseover', function(){
    $(".popup__cart").css("visibility","visible")
  })
  $(".popup__cart").on('mouseout', function(){
    $(".popup__cart").css("visibility","hidden")
  })

  //---- メニューボタン---------------------------
  $('#menu-btn').on('mouseover', function(){
    $(".popup__menu").css("visibility","visible")
  })
  $('#menu-btn').on('mouseout', function(){
    $(".popup__menu").css("visibility","hidden")
  })
  $('.popup__menu').on('mouseover', function(){
    $(".popup__menu").css("visibility","visible")
  })
  $('.popup__menu').on('mouseout', function(){
    $(".popup__menu").css("visibility","hidden")
  })

  //---- ログインボタン---------------------------
  $('#login-btn').on('mouseover', function(){
    $(".popup__login").css("visibility","visible")
  })
  $('#login-btn').on('mouseout', function(){
    $(".popup__login").css("visibility","hidden")
  })
  $('.popup__login').on('mouseover', function(){
    $(".popup__login").css("visibility","visible")
  })
  $('.popup__login').on('mouseout', function(){
    $(".popup__login").css("visibility","hidden")
  })
})
