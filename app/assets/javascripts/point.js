$(function(){
  $('.point-btn').on('click', function(){
    use_point = Number($(".point_form").val())
    current_point = Number($(".current_point").text())
    if(use_point > current_point){
      alert("0 ~ " + String(current_point) + "の範囲で入力してください")
    }else {
      // 「クーポン・ポイント欄」の表示を変更
      $(".point-price").empty();
      $(".point-price").append(`<a>-${use_point}pt</a>`);
      // 「合計欄」の表示を変更

      item_price = $(".payment-total-num").text().replace(",", "").match(/\d+/)[0];
      delivery_price = $(".payment-option-delivery-price").text().replace(",", "").match(/\d+/)[0];
      payment_price = $(".payment-price").text().replace(",", "").match(/\d+/)[0];

      total_price = Number(item_price) + Number(delivery_price) + Number(payment_price) - use_point
      var final_price = "￥" + String(total_price).replace(/(\d)(?=(\d\d\d)+$)/g, "$1,");
      $(".payment-option-total-price").empty();
      $(".payment-option-total-price").append(`<a>${final_price}</a>`);
    }
  })
})
