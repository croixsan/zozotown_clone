$(function(){

  function getDeliveryPrice(id){
    return $(".delivery-price_" + id).text()
  }

  function getPaymentPrice(id){
    return $(".payment-price_" + id).text()
  }

  function replaceDeliveryResult(price){
    $("#delivery-result").empty();
    $("#delivery-result").append(`<a>${price}</a>`)
  }

  function replacePaymentResult(price){
    $("#payment-result").empty();
    $("#payment-result").append(`<a>${price}</a>`)
  }

  //--Payment-----------------------------------------
  $('.table_left').on('click', '#card_payment', function(){
    // クレジットカードフォームの表示
    $(".card_table").css("display","block");
    // 価格テーブルの更新
    id = $(this).attr("data-id")
    price = getPaymentPrice(String(id));
    replacePaymentResult(price);
  })

  $('.table_left').on('click', '.other_payment', function(){
    // クレジットカードフォームの非表示
    $(".card_table").css("display","none");
    // 価格テーブルの更新
    id = $(this).attr("data-id")
    price = getPaymentPrice(String(id));
    replacePaymentResult(price);
  })

  //--Delivery-----------------------------------------
  $('.table_left').on('click', '#select_date', function(){
    // 日時選択フォームの表示
    $(".select_form").css("display","block")
    // 価格テーブルの更新
    id = $(this).attr("data-id")
    price = getDeliveryPrice(String(id));
    replaceDeliveryResult(price);
  })

  $('.table_left').on('click', '.other_date', function(){
    // 日時選択フォームを非表示
    $(".select_form").css("display","none")
    // 価格テーブルの更新
    id = $(this).attr("data-id")
    price = getDeliveryPrice(String(id));
    replaceDeliveryResult(price);
  })

  $('.radio').on('change', function(){
    // 価格テーブルの合計金額を算出
    item_price = $("#item-result").text().replace(",", "").match(/\d+/)[0];
    payment_price = $("#payment-result").text().match(/\d+/)[0];
    delivery_price = $("#delivery-result").text().match(/\d+/)[0];
    total_price = Number(item_price) + Number(payment_price) + Number(delivery_price);
    // 合計金額を３桁区切りに変換
    var final_price = String(total_price).replace(/(\d)(?=(\d\d\d)+$)/g, "$1,");
    $(".total_price_price").empty();
    $(".total_price_price").append(`<a>￥${final_price}</a>`)
  })
})
