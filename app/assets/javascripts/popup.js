$(function(){
  //---------------------- header ----------------------------
  //---- お気に入りボタン---------------------------
  $('#favorite-btn').on('mouseover', function(){
    $("#header__wrapper__right__popup__inner__favorite").css("visibility","visible")
    $("#header__wrapper__right__popup").css("visibility","visible")
  })
  $('#favorite-btn').on('mouseout', function(){
    $("#header__wrapper__right__popup__inner__favorite").css("visibility","hidden")
    $("#header__wrapper__right__popup").css("visibility","hidden")
  })
  // ポップアップの上にカーソルが乗っている場合はポップアップの表示を続ける
  $('#header').on('mouseover', "#header__wrapper__right__popup__inner__favorite", function(){
    $("#header__wrapper__right__popup__inner__favorite").css("visibility","visible")
    $("#header__wrapper__right__popup").css("visibility","visible")
  })
  // ポップアップからカーソルが離れたときにポップアップを消す
  $('#header__wrapper__right__popup__inner__favorite').on('mouseout', function(){
    $("#header__wrapper__right__popup__inner__favorite").css("visibility","hidden")
    $("#header__wrapper__right__popup").css("visibility","hidden")
  })
  //---- カートボタン---------------------------
  $('#cart-btn').on('mouseover', function(){
    $("#header__wrapper__right__popup__inner__cart").css("visibility","visible")
    $("#header__wrapper__right__popup").css("visibility","visible")
  })
  $('#cart-btn').on('mouseout', function(){
    $("#header__wrapper__right__popup__inner__cart").css("visibility","hidden")
    $("#header__wrapper__right__popup").css("visibility","hidden")
  })
  $('#header__wrapper__right__popup__inner__cart').on('mouseover', function(){
    $("#header__wrapper__right__popup__inner__cart").css("visibility","visible")
  })
  $('#header__wrapper__right__popup__inner__cart').on('mouseout', function(){
    $("#header__wrapper__right__popup__inner__cart").css("visibility","hidden")
    $("#header__wrapper__right__popup").css("visibility","hidden")
  })

  //---- メニューボタン---------------------------
  $('#menu-btn').on('mouseover', function(){
    $("#header__wrapper__right__popup__inner__menu").css("visibility","visible")
    $("#header__wrapper__right__popup").css("visibility","visible")
  })
  $('#menu-btn').on('mouseout', function(){
    $("#header__wrapper__right__popup__inner__menu").css("visibility","hidden")
    $("#header__wrapper__right__popup").css("visibility","hidden")
  })
  $('#header__wrapper__right__popup__inner__menu').on('mouseover', function(){
    $("#header__wrapper__right__popup__inner__menu").css("visibility","visible")
    $("#header__wrapper__right__popup").css("visibility","visible")
  })
  $('#header__wrapper__right__popup__inner__menu').on('mouseout', function(){
    $("#header__wrapper__right__popup__inner__menu").css("visibility","hidden")
    $("#header__wrapper__right__popup").css("visibility","hidden")
  })
})
